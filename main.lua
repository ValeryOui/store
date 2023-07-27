local component = require("component")
local gpu = component.gpu
local ae2 = component.me_controller 
local mei = component.me_interface 
local event = require("event")
local ttf = require("tableToFile")
local io = require("io")
local unicode = require("unicode")
local serialization = require("serialization")
local pim = component.pim

-- own library
local itemConfig = require("config/buyitems")
local depositConfig = require("config/deposititems")
local image = require("library/image")
local gui = require("library/gui")

--[[
os.execute("del library/image.lua")
os.execute("del library/gui.lua")
os.execute("del config/buyitems.lua")
os.execute("del config/deposititems.lua")
os.execute("del main")
os.execute("del autocraft")

os.execute("mkdir config")
os.execute("mkdir library")

os.execute("wget https://raw.githubusercontent.com/ValeryOui/store/master/library/image.lua library/image.lua")
os.execute("wget https://raw.githubusercontent.com/ValeryOui/store/master/library/gui.lua library/gui.lua")
os.execute("wget https://raw.githubusercontent.com/ValeryOui/store/master/config/buyitems.lua config/buyitems.lua")
os.execute("wget https://raw.githubusercontent.com/ValeryOui/store/master/config/deposititems.lua config/deposititems.lua")
os.execute("wget https://raw.githubusercontent.com/ValeryOui/store/master/main.lua main")
os.execute("wget https://raw.githubusercontent.com/ValeryOui/store/master/autocraft.lua autocraft")
]]



---image converter

-------------------------

local checkPimPlayer, db, logs, infoButton
local CHEST_PUSH_SIDE = 'DOWN'
local CHEST_PULL_SIDE = 'UP'
local playersPath = "/config.txt"
local logsPath = "/logs.txt"
local depositListStrings, depositListData, itemListStrings, itemListData, pages = {}, {}, {}, {}, {}
local depositListChoose, buyListChoose, curPage = 1, 1, 1

local prgName = "Store v1.0 by LIMI_np"

------------ Database ------------------------------------


function loadFile(name, tbl) 
  local file = io.open(name, "r")
  tbl = serialization.unserialize(file:read("*a")) or {}
  file:close()
end
function saveFile(name, tbl) 
  local file = io.open(name, "w")
  file:write(serialization.serialize(tbl))
  file:close()
end

function saveAll() saveFile(playersPath, db) end
function loadAll() 
  local file = io.open(playersPath, "r")
  db = serialization.unserialize(file:read("*a")) or {}
  file:close()
end

function saveLogs() saveFile(logsPath, logs) end
function loadLogs() 
  local file = io.open(logsPath, "r")
  if not file then logs = {} return  end
  
  logs = serialization.unserialize(file:read("*a")) or {}
  file:close()
end

function addLog(row)
  table.insert(logs, row)
  saveLogs()
end

function getPlayerMoney(uniqueName)
  if not db[uniqueName] then
    db[uniqueName] = 0
    saveAll(db)
  end

  return db[uniqueName]
end
function setPlayerMoney(uniqueName, value)
  if not db[uniqueName] then
    db[uniqueName] = 0
  end
  addLog(string.format("%s изменено значение денег с %s на %s (value = %s)", pimPlayer, db[uniqueName], db[uniqueName] + value, value))
  db[uniqueName] = db[uniqueName] + value
  saveAll(db)
end

loadAll() 
loadLogs() 
saveAll() 
function PrintTable(tbl) for k,v in pairs(tbl) do print(k,v) end end
PrintTable(db)


------------------- Config --------------------------------

local function compare(a,b)
  return a.name < b.name
end
  
table.sort(itemConfig, compare)


local function getNewText(dist1, dist2, dist3, text1, text2, text3)
  local column3 = text3 .. string.rep(" ", dist3 - unicode.wlen(text3))
  local column2 = text2 .. string.rep(" ", dist2 - unicode.wlen(text2))
  local column1 = text1 .. string.rep(" ", dist1 - unicode.wlen(text1))

  return column1 .. column2 .. column3
end

local function getButtonText(text, width)
  local buttonWidth = width or 16
  local textWidth = unicode.wlen(text)

  if textWidth < buttonWidth then
    local margin = math.ceil((buttonWidth - textWidth) / 2)
    text = string.rep(" ", buttonWidth - textWidth - margin) .. text .. string.rep(" ", margin)
  end

  return text
end

local function sS(text, width) -- stringSpacing
  text = text or ""
  width = width or 38
  local wlen = unicode.wlen(text) or 0
  local margin = math.floor((width - wlen) / 2)

  return string.rep(" ", margin) .. text .. string.rep(" ", width - wlen - margin)
end

local function sS2(text, width) -- stringSpacing
  text = text or ""
  width = width or 38
  local wlen = unicode.wlen(text) or 0
  local margin = width - wlen

  return text .. string.rep(" ", margin)
end



function getDepositList()
  depositListStrings = {}
  depositListData = {}

  local counter = 1
  for uniqueID, data in pairs(depositConfig) do
    table.insert(depositListData, data)

    local row = getNewText(29, 10, 10, counter .. ". " .. data.name, data.amount .. "шт.", data.price .. "$ ")
    
    table.insert(depositListStrings, row)
    counter = counter + 1
  end

  return depositListStrings
end





function getItemData(uniqueID, label, dmg)
  return ae2.getItemsInNetwork({name = uniqueID, label = label or nil, damage = dmg or nil})[1]
end

function getItemAmount(uniqueID, label, dmg)
  local itemData = getItemData(uniqueID, label, dmg)
  if itemData then
    return itemData.size
  end

  return 0
end

function updateItemsAmount()
    local getItemsInNetwork = ae2.getItemsInNetwork()
    
    for _, data in pairs(itemConfig) do
      for _, networkData in ipairs(getItemsInNetwork) do
        if data.uniqueID == networkData.name and data.dmg == networkData.damage then
          data.amount = networkData.size
          break
        end
      end
    end

  os.sleep(0.01)

  return true
end

function getListRow(counter, name, id, amount, price)
  local tempid = " (#" .. id .. ")"
  local tempname = " " .. counter .. ". " .. name
  local newname = unicode.wlen(tempname) > (60 - unicode.wlen(tempid)) and (unicode.sub(tempname, 1, 57 - unicode.wlen(tempid)) .. "...") or tempname
  local row = getNewText(60, 15, 15, newname .. tempid, amount .. " шт.", price .. "$" )

  return row
end

function getItemList(subtext)
    updateItemsAmount()

    itemListStrings = {}
    itemListData = {}

    local counter = 1

    if subtext and subtext ~= "" then
        for _, data in ipairs(itemConfig) do
            local lowtext = string.lower(subtext)

            if string.find(string.lower(data.uniqueID), lowtext) 
                or (data.label and string.find(string.lower(data.label), lowtext)) 
                or string.find(string.lower(data.id), lowtext) 
                or string.find(unicode.lower(data.name), unicode.lower(subtext))
            then
                table.insert(itemListData, data)

                local row = getListRow(counter, data.name, data.id, data.amount, data.price)

                table.insert(itemListStrings, row)
                counter = counter + 1
            end
        end
    else
        for _, data in ipairs(itemConfig) do
            table.insert(itemListData, data)

            local row = getListRow(counter, data.name, data.id, data.amount, data.price)

            table.insert(itemListStrings, row)
            counter = counter + 1
        end
    end

    return itemListStrings
end








function setPageVisible(page, bVisible)
  for _, name in pairs(pages[page]) do
    gui.setVisible(myGui, name, bVisible)
    if bVisible then gui.setEnable(myGui, name, true, true) end
  end
end

function setBackButtonEnable(bEnable)
  local buttons = {backbutton_up, backbutton, backbutton_down}

  for key, value in ipairs(buttons) do
    gui.setVisible(myGui, value, bEnable)
    if bEnable then gui.setEnable(myGui, value, true, true) end
  end
end

function drawPage(page)
  setPageVisible(curPage, false)
  setPageVisible(page, true)

  if page == 2 or page == 3 then
    setBackButtonEnable(true)
  else
    setBackButtonEnable(false)
  end

  curPage = page
end


function exitButtonCallback(guiID, id)
  local result = gui.getYesNo(sS(""), sS("Выход только для разработчика!"), sS(""))
  if result == true and pimPlayer == "LIMI_np" then
    gui.exit()
  end
  gui.displayGui(myGui)
end

function updateList(guiID, listID, subtext)
    gui.clearList(guiID, list_1_ID)

    gui.tableList(guiID, list_1_ID, getItemList(subtext))
end

function updateBuyList()
  updateItemsAmount()
  updateList(myGui, list_1_ID, myGui[filterentry].text)
end

function loadScreen(func, newPage)
  newPage = newPage or curPage

  if func then func() end
  drawPage(newPage)
end

function backButtonCallback() drawPage(1) end
function drawBuyPage() 
  drawPage(2) 
  buyListCallback(myGui, list_1_ID, 1)
end
function drawDepositPage() drawPage(3) end




function depositListCallback(guiID, id, rowID, text)
  depositListChoose = rowID

  gui.setText(guiID, depositEntry2, tonumber(guiID[depositEntry1].text) * depositListData[depositListChoose].price)
end

function calculateDepositEntry1(guiID, id, text)
  if tonumber(text) == nil then
    text = string.match(text , "%d+") or 1
    gui.setText(guiID, id, text)
  end

  local result = tonumber(text) / depositListData[depositListChoose].price
  gui.setText(guiID, depositEntry1, result)
end

function calculateDepositEntry2(guiID, id, text)
  if tonumber(text) == nil then
    text = string.match(text , "%d+") or 1
    gui.setText(guiID, id, text)
  end

  local result = tonumber(text) * depositListData[depositListChoose].price
  gui.setText(guiID, depositEntry2, result)
end

function itemsCountByID(uniqueID)
  if pim.getInventoryName() ~= pimPlayer then showMsg("Возникла ошибка при считывании инвентаря") return 0 end

  local count = 0

  for i = 1, 40 do
    if pim.getStackInSlot(i) then
      if pim.getStackInSlot(i).id == uniqueID then
        count = count + pim.getStackInSlot(i).qty
      end
    end
  end

  return count
end

function takeawayItemsCountByID(uniqueID, amount)
  if pim.getInventoryName() ~= pimPlayer then return false end

  for i = 1, 40 do
    if pim.getStackInSlot(i) then
      if pim.getStackInSlot(i).id == uniqueID then
        local count = pim.getStackInSlot(i).qty
        if count >= amount then
          pim.pushItemIntoSlot(CHEST_PUSH_SIDE, i, amount)
          return true
        else
          pim.pushItemIntoSlot(CHEST_PUSH_SIDE, i)
          amount = amount - count
        end
      end
    end
  end

  return false
end

function showMsg(msg1, msg2, msg3)
  gui.showMsg(sS(msg1), sS(msg2), sS(msg3))
end

function updatePlayerMoney()
  if not pimPlayer then return end

  local money = getPlayerMoney(pimPlayer)
  gui.setText(myGui, welcomeLabel, "Добро пожаловать " .. pimPlayer .. ", в наличии - " .. money .. " защекоинов.")
end

function depositSuccessCallback(guiID, id)
  if not pimPlayer then return showMsg("Вы должны стоять на плите") end

  local uniqueID = depositListData[depositListChoose].uniqueID
  local amount = tonumber(guiID[depositEntry1].text)

  if not uniqueID then return showMsg("Ошибка в названии предмета") end
  local currentCount = itemsCountByID(uniqueID)

  if currentCount < amount then return showMsg("У вас недостаточно средств") end

  local bSuccess = takeawayItemsCountByID(uniqueID, amount)
  if not bSuccess then showMsg("Возникла ошибка при пополнении!") end

  local result = amount * depositListData[depositListChoose].price
  
  setPlayerMoney(pimPlayer, result)
  addLog(string.format("%s пополнил счет на %s защекоинов, внесены предметы - %s, (x%s), цена за 1шт. - %s$", pimPlayer, result, uniqueID, amount, depositListData[depositListChoose].price))
  showMsg("Пополнение произошло успешно", "На ваш счет начислено " .. result .. "$", "Изъяты предметы - " .. depositListData[depositListChoose].name .. "(x" .. amount .. ")")
  updatePlayerMoney()
end

function buyListCallback(guiID, id, rowID, text)
  buyListChoose = rowID

  local result = tonumber(guiID[buyEntry1].text) * itemListData[buyListChoose].price
  gui.setText(guiID, buyInfo, "К оплате - " .. result .. "$             ")
  
  if itemListData[buyListChoose].image and curPage == 2 then
    image.DrawImage(itemListData[buyListChoose].image, 100, 17)
  end
end

function calculateBuyEntry(guiID, id, text)
  if tonumber(text) == nil then
    text = string.match(text , "%d+") or 1
    gui.setText(guiID, id, text)
  end

  local result = tonumber(text) * itemListData[buyListChoose].price
  gui.setText(guiID, buyInfo, "К оплате - " .. result .. "$             ")
end

function getEmptySlots()
  if not pimPlayer then return 0 end
  if pimPlayer ~= pim.getInventoryName() then return 0 end

  local counter = 0
  for i = 1, 40 do
    if not pim.getStackInSlot(i) then
      counter = counter + 1
    end
  end

  return counter
end

function buySuccessCallback(guiID, id)
  if not pimPlayer then return showMsg("Встаньте на плиту") end
  if not itemListData[buyListChoose] then return showMsg("Возникла ошибка при инициализации товара!") end

  local uniqueID = itemListData[buyListChoose].uniqueID
  local amount = tonumber(guiID[buyEntry1].text)
  if not amount then return showMsg("Возникла ошибка при buyEntry1!") end

  local itemData = getItemData(uniqueID, itemListData[buyListChoose].label, itemListData[buyListChoose].dmg)
  if not itemData or itemData.name ~= uniqueID then return showMsg("Invalid item, сообщите LIMI_np") end

  -- Проверка надурака
  local row1 = "Вы хотите купить за " .. itemListData[buyListChoose].price .. "$ (" .. amount .. " шт.)"
  local row2 = unicode.wlen(itemListData[buyListChoose].name) > 38 and (unicode.sub(itemListData[buyListChoose].name, 1, 36) .. "-") or (itemListData[buyListChoose].name .. "?")
  local row3 = unicode.wlen(itemListData[buyListChoose].name) > 38 and (unicode.sub(itemListData[buyListChoose].name, 37) .. "?") or nil
  local result = gui.getYesNo(row1, row2, row3)
  if not result then
    return gui.displayGui(myGui)
  end

  -- 
  if itemData.size < amount then return showMsg("Недостаточно предметов в магазине") end
  local price = itemListData[buyListChoose].price * amount

  if getPlayerMoney(pimPlayer) < price then return showMsg("У вас недостаточно средств, пополнитее счет") end

  -- Проверка поместиться ли лут в инвентарь
  local maxSize = itemData.maxSize
  if not maxSize then return showMsg("Ошибка просчета стака предмета") end

  local emptySlots = math.ceil(amount / maxSize)

  if emptySlots > getEmptySlots() then return showMsg("У вас недостаточно места в инвентаре") end
  if not itemListData[buyListChoose].dmg then return showMsg("У предмета отсутствует DMG") end

  local fp = {id = uniqueID, dmg = itemListData[buyListChoose].dmg} 

  setPlayerMoney(pimPlayer, -price)

  local _amount = amount
  if _amount > 64 then
    while _amount > 0 do
      local exportResult = mei.exportItem(fp, "UP", _amount)
      addLog(string.format("%s'у выдано %s [dmg:%s] в количестве %s шт.", pimPlayer, exportResult.id, exportResult.dmg, exportResult.size))
      _amount = _amount - 64
    end
  else
    local exportResult = mei.exportItem(fp, "UP", _amount)
    addLog(string.format("%s'у выдано %s [dmg:%s] в количестве %s шт.", pimPlayer, exportResult.id, exportResult.dmg, exportResult.size))
  end
  
  addLog(string.format("%s купил %s (x%s) за %s$", pimPlayer, itemListData[buyListChoose].name, amount, price))
  local peace1 = "Получены предметы "
  local peace3 = "(x" .. amount .. ")"
  local pwlen = unicode.wlen(peace1) + unicode.wlen(peace3)
  local peace2 = unicode.wlen(itemListData[buyListChoose].name) > (38 - pwlen) and (unicode.sub(itemListData[buyListChoose].name, 1, 35 - pwlen) .. "...") or itemListData[buyListChoose].name
  showMsg("Покупка произошла успешно", peace1 .. peace2 .. peace3, "Со счета снято " .. price .. " защекоинов")
  updatePlayerMoney()
  
  itemListData[buyListChoose].amount = getItemAmount(itemListData[buyListChoose].uniqueID, itemListData[buyListChoose].label, itemListData[buyListChoose].dmg)
  gui.renameList(myGui, list_1_ID, buyListChoose, getListRow(buyListChoose, itemListData[buyListChoose].name, itemListData[buyListChoose].id, itemListData[buyListChoose].amount, itemListData[buyListChoose].price))
end



myGui = gui.newGui(2, 2, 158, 48, true)                                                                       -- Главная менюшка
welcomeLabel = gui.newLabel(myGui, 2, 1, "") -- Строка приветствия


backbutton_up = gui.newButton(myGui, 138, 1, getButtonText(""), backButtonCallback)                               -- Вернуться на главную страницу
backbutton = gui.newButton(myGui, 138, 2, getButtonText("В главное меню"), backButtonCallback)                               -- Вернуться на главную страницу
backbutton_down = gui.newButton(myGui, 138, 3, getButtonText(""), backButtonCallback)                               -- Вернуться на главную страницу
setBackButtonEnable(false)

-- firstPage
buymenu_up = gui.newButton(myGui, "center", 17, getButtonText(""), drawBuyPage)
buymenu = gui.newButton(myGui, "center", 18, getButtonText("Покупка"), drawBuyPage)
buymenu_down = gui.newButton(myGui, "center", 19, getButtonText(""), drawBuyPage)

depositmenu_up = gui.newButton(myGui, "center", 21, getButtonText(""), drawDepositPage)
depositmenu = gui.newButton(myGui, "center", 22, getButtonText("Пополнение"), drawDepositPage)
depositmenu_down = gui.newButton(myGui, "center", 23, getButtonText(""), drawDepositPage)

exitbutton_up = gui.newButton(myGui, "center", 25, getButtonText(""), exitButtonCallback) -- @todo Убрать когда сделаю шоп
exitbutton = gui.newButton(myGui, "center", 26, getButtonText("Выход"), exitButtonCallback) -- @todo Убрать когда сделаю шоп
exitbutton_down = gui.newButton(myGui, "center", 27, getButtonText(""), exitButtonCallback) -- @todo Убрать когда сделаю шоп

pages[1] = {buymenu_up, buymenu, buymenu_down, 
            depositmenu_up, depositmenu, depositmenu_down, 
            exitbutton_up, exitbutton, exitbutton_down}

-- buyPage 
filter = gui.newLabel(myGui, 2, 3, "Фильтр:")
filterentry = gui.newText(myGui, 9, 3, 30, "", updateList)
list_1_ID = gui.newList(myGui, 2, 5, 94, 42, getItemList(), buyListCallback, "                         Название                         |  В наличии   |   Цена за 1шт.  ")
buyLabel = gui.newLabel(myGui, 98, 6, "Количество предметов:")
buyEntry1 = gui.newText(myGui, 98, 8, 10, "1", calculateBuyEntry)
buyInfo = gui.newLabel(myGui, 98, 10, "К оплате - " .. itemListData[1].price .. "$")

buySuccess_up = gui.newButton(myGui, 98, 12, getButtonText(""), buySuccessCallback)
buySuccess = gui.newButton(myGui, 98, 13, getButtonText("Купить"), buySuccessCallback)
buySuccess_down = gui.newButton(myGui, 98, 14, getButtonText(""), buySuccessCallback)

pages[2] = {filter, filterentry, list_1_ID, buyLabel, buyEntry1, buyInfo, buySuccess_up, buySuccess, buySuccess_down} setPageVisible(2, false)

-- depositPage
depositList = gui.newList(myGui, 10, 10, 50, 10, getDepositList(), depositListCallback, "A List")
depositLabel = gui.newLabel(myGui, 62, 10, "Количество предметов:")
depositEntry1 = gui.newText(myGui, 62, 12, 10, "1", calculateDepositEntry2)
depositInfo = gui.newLabel(myGui, 62, 14, "Вам будет начислено:")
depositEntry2 = gui.newText(myGui, 62, 16, 10, "0.1", calculateDepositEntry1)
depositSuccess = gui.newButton(myGui, 62, 18, "Пополнить", depositSuccessCallback)
pages[3] = {depositList, depositLabel, depositEntry1, depositInfo, depositEntry2, depositSuccess} setPageVisible(3, false)

-- loadingPage
loadingLabel = gui.newLabel(myGui, "center", 22, "Подождите, загрузка данных...")
pages[4] = {loadingLabel} setPageVisible(4, false)

-- startMenu
startLabel = gui.newLabel(myGui, "center", 21, "Добро пожаловать в наш магазин.")
startLabel2 = gui.newLabel(myGui, "center", 22, "Чтобы продолжить, авторизируйтесь встав на плиту")
pages[5] = {startLabel,startLabel2 } setPageVisible(5, false)


-- Programm

gui.clearScreen()
gui.setTop(prgName)

drawPage(5)

function checkPimPlayer()
  if gui.pimPlayer ~= pimPlayer then
    if gui.pimPlayer then
      pimPlayer = gui.pimPlayer
      -- addLog(string.format("%s встал на плиту", pimPlayer))

      drawPage(4)
  
      loadScreen(updateBuyList(), 1)
      local money = getPlayerMoney(pimPlayer)
      gui.setText(myGui, welcomeLabel, "Добро пожаловать " .. pimPlayer .. ", в наличии - " .. money .. " защекоинов.")

      buyListCallback(myGui, list_1_ID, 1)
    else
      -- addLog(string.format("%s покинул плиту", pimPlayer))
      pimPlayer = nil
      drawPage(5)
      gui.setText(myGui, welcomeLabel, "                                                                              ")
    end
  end
end

while true do
  gui.runGui(myGui)
  checkPimPlayer()
end