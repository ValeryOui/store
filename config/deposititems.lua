local depositConfig = {
    ["minecraft:iron_ingot"] = {name = "Железный слиток", id = 265, amount = 1, price = 0.1},
    ["minecraft:iron_block"] = {name = "Железный блок", id = 42, amount = 1, price = 0.9},
}

for k, v in pairs(depositConfig) do
    v.uniqueID = k
end

return depositConfig