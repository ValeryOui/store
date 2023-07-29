local component = require("component")
local gpu = component.gpu
local ae2 = component.me_controller 
--local mei = component.me_interface 
local event = require("event")
--local ttf = require("tableToFile")
local io = require("io")
local unicode = require("unicode")
local serialization = require("serialization")
--local pim = component.pim

-- own library
local itemConfig = require("config/buyitems")
local depositConfig = require("config/deposititems")
local image = require("library/image")
local gui = require("library/gui")


-- changed config
    local changedConfigPath = "/changedconfig.txt"   
    changedItemConfig = {}

    function loadChangedItems() 
        local file = io.open(changedConfigPath, "r") 
        if file then
            changedItemConfig = serialization.unserialize(file:read("*a")) or {}
            file:close()
        end
    end
    function saveChangedItems() 
        local file = io.open(changedConfigPath, "w")
        file:write(serialization.serialize(changedItemConfig))--serialization.serialize({}))--
        file:close()
    end

    function isItemHasInConfig(uniqueID, dmg, tbl)
        for _, row in ipairs(tbl) do
           if row.uniqueID == uniqueID and row.dmg == dmg then return true end
        end

        return false
    end

    loadChangedItems() 
    for _, row in ipairs(changedItemConfig) do
        if not isItemHasInConfig(row.uniqueID, row.dmg, itemConfig) then
            row.name = "(NT) "..row.name
            row.isChanged = true
            table.insert(itemConfig, row)
        end
    end

    function changeChangedItem(uniqueID, name, dmg, min)
        local result = gui.getYesNo(sS("Предмет уже существует"), sS("Обновить название и минималку?"), sS(""))
        if result == true then
            for _, row in ipairs(changedItemConfig) do
                if row.uniqueID == uniqueID and row.dmg == dmg then 
                    row.minItems = min
                    row.name = "(NT) "..namename
                    saveChangedItems() 
    
                    for _, row in ipairs(itemConfig) do
                        if row.uniqueID == uniqueID and row.dmg == dmg then
                            row.minItems = min
                            row.name = "(NT) "..name
                            break
                        end
                    end
    
                    return true 
                end
            end
        end
        gui.displayGui(myGui)
    end

    function addChangedItem(uniqueID, name, id, min)
        local craft = ae2.getCraftables({name = uniqueID, damage = dmg})[1]
        if not craft then showMsg("Отсутствует крафт", uniqueID, name .. " " .. dmg) return false end

        dmg = dmg and tonumber(dmg) or 0
        if isItemHasInConfig(uniqueID, dmg, changedItemConfig) then
            changeChangedItem(uniqueID, dmg, min)

            return true
        end

        local row = {uniqueID = uniqueID, id = id, dmg = dmg or 0, name = "(NT) "..name, isChanged == true, minItems = min}
        table.insert(changedItemConfig, row)
        table.insert(itemConfig, row)
        saveChangedItems() 

        return true
    end

    function removeChangedItem(uniqueID, dmg)
        for _, row in ipairs(changedItemConfig) do
            if row.uniqueID == uniqueID and row.dmg == dmg then 
                table.remove(changedItemConfig, _)
                saveChangedItems() 

                for _, row in ipairs(itemConfig) do
                    if row.uniqueID == uniqueID and row.dmg == dmg then
                        table.remove(itemConfig, _)
                    end
                end

                return true 
            end
        end

        return false
    end
--

local itemListChoose = {}
local itemListStrings = {}
local itemListData = {}
local delay = 3
local lastrequest = 0
local autoRefreshIsActice = false


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

local function compare(a,b)
    return a.name < b.name
end

table.sort(itemConfig, compare)

local function getNewText(dist1, dist2, dist3, text1, text2, text3)
    local column3 = (text3 or "") .. string.rep(" ", dist3 - unicode.wlen(text3 or ""))
    local column2 = (text2 or "") .. string.rep(" ", dist2 - unicode.wlen(text2 or ""))
    local column1 = (text1 or "") .. string.rep(" ", dist1 - unicode.wlen(text1 or ""))

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
        for _, networkData in pairs(getItemsInNetwork) do
            if data.uniqueID == networkData.name and data.dmg == networkData.damage then
                data.amount = networkData.size
                data.label = networkData.label
                break
            end
        end
    end

    os.sleep(0.01)

    return true
end

function getListRow(counter, name, id, amount, min)
    local tempid = " (#" .. id .. ")"
    local tempname = " " .. counter .. ". " .. name
    local newname = unicode.wlen(tempname) > (60 - unicode.wlen(tempid)) and (unicode.sub(tempname, 1, 57 - unicode.wlen(tempid)) .. "...") or tempname
    local row = getNewText(60, 15, 15, newname .. tempid, amount, min)

    return row
end

function updateItemList()
    updateItemsAmount()
    updateList(myGui, list_1_ID, myGui[filterentry].text)
end

function updateList(guiID, listID, subtext)
    gui.clearList(guiID, list_1_ID)

    local filteredList = getItemList(subtext)
    gui.tableList(guiID, list_1_ID, filteredList)
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

                local row = getListRow(counter, data.name, data.id, data.amount, data.minItems or 1)

                table.insert(itemListStrings, row)
                counter = counter + 1
            end
        end
    else
        for _, data in ipairs(itemConfig) do
            table.insert(itemListData, data)

            local row = getListRow(counter, data.name, data.id, data.amount, data.minItems or 1)

            table.insert(itemListStrings, row)
            counter = counter + 1
        end
    end

    return itemListStrings
end

function itemListCallback(guiID, id, rowID, text)
    itemListChoose = rowID
end

function exitButtonCallback(guiID, id)
    local result = gui.getYesNo(sS(""), sS("Вы точно хотите выйти?"), sS(""))
    if result == true then
        gui.exit()
    end
    gui.displayGui(myGui)
end

function showMsg(msg1, msg2, msg3)
  gui.showMsg(sS(msg1), sS(msg2), sS(msg3))
end

local activeRequests = {}
local saveEmptyCpus = 2

local function updateActiveRequests()
    for _, data in ipairs(activeRequests) do
        if data.request.isDone() or data.request.isCanceled() then
            table.remove(activeRequests, _)
        end
    end

    statusUpdateText()
    updateItemsAmount()
end

local function getEmptyCpus()
    local counter = 0

    for _, cpu in ipairs(ae2.getCpus()) do
        if not cpu.busy then
            counter = counter + 1
        end
    end

    return math.max(counter - saveEmptyCpus, 0)
end

local function itemHasRequest(uniqueID, dmg)
    for _, data in ipairs(activeRequests) do
        if data.uniqueID == uniqueID or data.dmg == dmg then
            return true
        end
    end

    return false
end

local function findMinItemAmount()
    for _, data in ipairs(itemConfig) do
        if not itemHasRequest(data.uniqueID, data.dmg) then
            local minItems = data.minItems and tonumber(data.minItems) or 1
        
            if data.amount < minItems then
                local craft = ae2.getCraftables({name = data.uniqueID, damage = data.dmg})[1]
                if not craft then showMsg("Отсутствует крафт", data.name, data.uniqueID .. "#" .. data.id) return false end
    
                local request = craft.request(minItems - data.amount)
                
                local result, reason = request.isCanceled()
                if not result then
                    local row = data
                    row.requestquantity = minItems - data.amount
                    row.request = request
                    table.insert(activeRequests, row)
    
                    return true
                end
            end
        end
    end

    return false
end

function statusSetText(text)
    text = text or ""
    local text2 = ""
    if unicode.wlen(text) > 156 then
        text2 = unicode.sub(text, 156)
        text = unicode.sub(text, 1, 155)
    end

    gui.setText(myGui, status, sS2(text, 156))
    gui.setText(myGui, status2, sS2(text2, 156))
end

function statusUpdateText()
    local items = {}

    for _, data in ipairs(activeRequests) do
        table.insert(items, "(x"..data.requestquantity..")"..data.name)
    end

    if #items > 0 then
        statusSetText("Статус ("..tostring(lastrequest or 0).."): Cоздание [" .. serialization.serialize(items) .. "]")
    else
        statusSetText("Статус ("..tostring(lastrequest or 0).."): Нету предметов создания")
    end
end

function CurTime()
    return os.time() / 100
end

function autocraft()
    if autoRefreshIsActice and lastrequest < CurTime() then
        craftAllCallback()
        lastrequest = CurTime() + delay
    end 
end

function craftAllCallback(guiID, id)
    local emptyCpus = getEmptyCpus()
    if emptyCpus <= 0 then return end

    updateItemsAmount()
    updateActiveRequests()
    
    while emptyCpus > 0 do
        local res = findMinItemAmount()
        if res == true then
            emptyCpus = emptyCpus - 1
        else
            emptyCpus = 0
        end
    end

    statusUpdateText()
end

function craftEntry(guiID, id, text)
    if tonumber(text) == nil then
        text = string.match(text , "%d+") or 1
        gui.setText(guiID, id, text)
    end
end

function autoRefreshCallback(guiID, id)
    if autoRefreshIsActice then
        autoRefreshIsActice = false 
        gui.setText(guiID, autoRefreshLabel, "Автообновление [выключено]")
    else
        autoRefreshIsActice = true
        gui.setText(guiID, autoRefreshLabel, "Автообновление [включено]")
    end
end

local function _valid()
    local temp = {"uniqueID", "Название", "Full ID", "Минималка"}

    for key, value in ipairs({chIEntry1, chIEntry2, chIEntry3, chIEntry4}) do
        if not myGui[value].text or myGui[value].text == "" then
            showMsg("Поле N" .. key .. " - " .. temp[key] .. " пустое", msg2, msg3)

            return false
        end
    end

    return true
end

function addChangedItemCallback(gui, id)
    if not _valid() then return end

    local uniqueID, name, dmg, min = gui[chIEntry1].text, gui[chIEntry2].text, gui[chIEntry3].text, gui[chIEntry4].text 
    addChangedItem(uniqueID, name, dmg, min)
    updateItemList()
    showMsg("Предмет успешно добавлен", msg2, msg3)
end

function removeChangedItemCallback(gui, id)
    local rowID = gui.getSelected(gui, list_1_ID)
    local rowData = itemListData[rowID]

    if not rowData then return end
    removeChangedItem(rowData.uniqueID, rowData.dmg)
    updateItemList()
    showMsg("Предмет успешно удален", msg2, msg3)
end

gui.clearScreen()
gui.setTop("Autocraft system")

myGui = gui.newGui(2, 2, 158, 48, true)    
status = gui.newLabel(myGui, 2, 1, "Статус:")
status2 = gui.newLabel(myGui, 2, 2, "")

filter = gui.newLabel(myGui, 2, 3, "Фильтр:")
filterentry = gui.newText(myGui, 9, 3, 30, "", updateList)
list_1_ID = gui.newList(myGui, 2, 5, 94, 42, getItemList(), itemListCallback, sS("Название", 58) .. "|" .. sS("В наличии", 14) .. "|" .. sS("Должно быть", 17))
buyLabel = gui.newLabel(myGui, 98, 6, "Количество предметов:")
buyEntry1 = gui.newText(myGui, 98, 8, 10, "1", craftEntry)

craftSuccess_up = gui.newButton(myGui, 98, 12, getButtonText(""), craftCallback)
craftSuccess = gui.newButton(myGui, 98, 13, getButtonText("Заказать"), craftCallback)
craftSuccess_down = gui.newButton(myGui, 98, 14, getButtonText(""), craftCallback)

craftAllSuccess_up = gui.newButton(myGui, 98, 16, getButtonText(""), craftAllCallback)
craftAllSuccess = gui.newButton(myGui, 98, 17, getButtonText("Проверка кол-ва"), craftAllCallback)
craftAllSuccess_down = gui.newButton(myGui, 98, 18, getButtonText(""), craftAllCallback)

updateListButton_up = gui.newButton(myGui, 98, 20, getButtonText(""), updateItemList)
updateListButton = gui.newButton(myGui, 98, 21, getButtonText("Обновить список"), updateItemList)
updateListButton_down = gui.newButton(myGui, 98, 22, getButtonText(""), updateItemList)

autoRefreshLabel = gui.newLabel(myGui, 98, 24, "Автообновление: [выключено]")

autoRefreshButton_up = gui.newButton(myGui, 98, 26, getButtonText("", 25), autoRefreshCallback)
autoRefreshButton = gui.newButton(myGui, 98, 27, getButtonText("Вкл/выкл автообновление", 25), autoRefreshCallback)
autoRefreshButton_down = gui.newButton(myGui, 98, 28, getButtonText("", 25), autoRefreshCallback)

addChangedItemButton = gui.newButton(myGui, 98, 30, getButtonText("Добавить предмет"), addChangedItemCallback)
removeChangedItemButton = gui.newButton(myGui, 117, 30, getButtonText("Удалить предмет"), removeChangedItemCallback)

chILabel1 = gui.newLabel(myGui, 98, 32, "uniqueID")
chILabel2 = gui.newLabel(myGui, 98, 33, "Название")
chILabel3 = gui.newLabel(myGui, 98, 34, "Full ID")
chILabel4 = gui.newLabel(myGui, 98, 35, "Минималка")

chIEntry1 = gui.newText(myGui, 108, 32, 40, "")
chIEntry2 = gui.newText(myGui, 108, 33, 40, "")
chIEntry3 = gui.newText(myGui, 108, 34, 40, "")
chIEntry4 = gui.newText(myGui, 108, 35, 40, "")

backbutton_up = gui.newButton(myGui, 138, 44, getButtonText(""), exitButtonCallback)          
backbutton = gui.newButton(myGui, 138, 45, getButtonText("Выход"), exitButtonCallback)                          
backbutton_down = gui.newButton(myGui, 138, 46, getButtonText(""), exitButtonCallback)        

while true do
    gui.runGui(myGui)
    autocraft()
end