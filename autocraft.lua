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


local itemListChoose = {}
local itemListStrings = {}
local itemListData = {}

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

local function getButtonText(text)
    local buttonWidth = 16
    local textWidth = unicode.wlen(text)

    if textWidth < buttonWidth then
        local margin = math.ceil((buttonWidth - textWidth) / 2)
        text = string.rep(" ", buttonWidth - textWidth - margin) .. text .. string.rep(" ", margin)
    end

    return text
end

local function sS(text, width) -- stringSpacing
    width = width or 38
    local wlen = unicode.wlen(text) or 0
    local margin = math.floor((width - wlen) / 2)

    return string.rep(" ", margin) .. text .. string.rep(" ", width - wlen - margin)
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
    local getItemsInNetwork = ae2.getItemsInNetwork({name = uniqueID, label = label or nil, damage = dmg or nil})
    
    for _, data in pairs(itemConfig) do
        for _, networkData in ipairs(getItemsInNetwork) do
            if data.uniqueID == networkData.name and data.dmg == networkData.damage then
                data.amount = networkData.size
                break
            end
        end
    end

    return true
end

function getListRow(counter, name, id, amount, price)
    local tempid = " (#" .. id .. ")"
    local tempname = " " .. counter .. ". " .. name
    local newname = unicode.wlen(tempname) > (60 - unicode.wlen(tempid)) and (unicode.sub(tempname, 1, 57 - unicode.wlen(tempid)) .. "...") or tempname
    local row = getNewText(60, 15, 15, newname .. tempid, amount .. " шт.", price .. "$" )

    return row
end

function updateList(guiID, listID, subtext)
    gui.clearList(guiID, list_1_ID)

    local temp = {"123", "456", "789"}

    gui.tableList(guiID, list_1_ID, serialization.serialize(temp))
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

                getListRow(counter, data.name, data.id, data.amount, data.price)

                table.insert(itemListStrings, row)
                counter = counter + 1
            end
        end
    else
        for _, data in ipairs(itemConfig) do
            table.insert(itemListData, data)

            local tempid = " (#" .. data.id .. ")"
            local tempname = " " .. counter .. ". " .. data.name
            local newname = unicode.wlen(tempname) > (60 - unicode.wlen(tempid)) and (unicode.sub(tempname, 1, 57 - unicode.wlen(tempid)) .. "...") or tempname
            local row = getNewText(60, 15, 15, newname .. tempid, data.amount .. " шт.", data.price .. "$" )

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

function craftCallback(guiID, id)
    
end

function craftEntry(guiID, id, text)
    if tonumber(text) == nil then
        text = string.match(text , "%d+") or 1
        gui.setText(guiID, id, text)
    end
end

gui.clearScreen()
gui.setTop("Autocraft system")

myGui = gui.newGui(2, 2, 158, 48, true)                                                                       -- Главная менюшка
welcomeLabel = gui.newLabel(myGui, 2, 1, "") -- Строка приветствия
  
filter = gui.newLabel(myGui, 2, 3, "Фильтр:")
filterentry = gui.newText(myGui, 9, 3, 30, "", updateList)
list_1_ID = gui.newList(myGui, 2, 5, 94, 42, getItemList(), itemListCallback, "                         Название                         |  В наличии   |   Цена за 1шт.  ")
buyLabel = gui.newLabel(myGui, 98, 6, "Количество предметов:")
buyEntry1 = gui.newText(myGui, 98, 8, 10, "1", craftEntry)

buySuccess_up = gui.newButton(myGui, 98, 12, getButtonText(""), craftCallback)
buySuccess = gui.newButton(myGui, 98, 13, getButtonText("Заказать"), craftCallback)
buySuccess_down = gui.newButton(myGui, 98, 14, getButtonText(""), craftCallback)

backbutton_up = gui.newButton(myGui, 138, 44, getButtonText(""), exitButtonCallback)          
backbutton = gui.newButton(myGui, 138, 45, getButtonText("Выход"), exitButtonCallback)                          
backbutton_down = gui.newButton(myGui, 138, 46, getButtonText(""), exitButtonCallback)        

while true do
    gui.runGui(myGui)
end