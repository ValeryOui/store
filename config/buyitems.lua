local items = {
	--Майнкрафт
	{uniqueID = "minecraft:cactus", id = "81", name = "Кактус", price = 0.03, image = "1008000000⠀0A0A00⠀0F1400⠛141400⠀0F1500⠛141500⣤0A1500⠛000F00⠛0A0A00⠀0F0F00⠀0F0F00⠀141500⣤141400⠀141400⠀0F0F00⠀000000⠀000000⠀000500⣤0F0F00⠀0F0F00⠀0F0F00⠀141500⠛0F0F00⠀0A0F00⣤000A00⠛0A0F00⠛0F0F00⠀141500⣤141500⣤0A0F00⣤000F00⣤000000⠀000000⠀0A0A00⠀0F0F00⠀141400⠀0F0F00⠀0F1400⠛0F1400⠛0F0F00⠀050A00⣤0F0F00⠀141400⠀141500⠛141500⠛0F0F00⠀0F0F00⠀000000⠀000000⠀000A00⣤0F1500⣤0F0F00⠀141400⠀0F0F00⠀0F1500⣤0F0F00⠀000A00⠛0A0F00⠛141400⠀0F0F00⠀141400⠀0A0F00⣤000A00⣤000000⠀000000⠀0A0A00⠀151500⠀0F0F00⠀0F1400⠛0F1500⣤0A1400⠛000F00⠛050A00⣤0F0F00⠀151500⠀0F0F00⠀141500⣤0F0F00⠀0F0F00⠀000000⠀000000⠀0A0A00⠀141400⠀0F0F00⠀0F1400⠛151500⠀0F0F00⠀0A0F00⣤0A0A00⠀0F0F00⠀151500⠀0F0F00⠀151500⠀0A0F00⣤000A00⣤000000⠀000000⠀000500⣤0F0F00⠀0F0F00⠀0F1400⣤141500⠛0F0F00⠀0F0F00⠀000500⣤0F0F00⠀0F1500⠛0F0F00⠀0F1500⣤0F1500⣤0F0F00⠀000000⠀000000⠀0A0A00⠀0F0F00⠀141500⠛0F0F00⠀141400⠀0A0F00⣤000A00⣤0A0A00⠀0F1400⣤0F1500⠛0F0F00⠀141400⠀0F0F00⠀0F0F00⠀000000⠀"},
	{uniqueID = "minecraft:dye", id = "351:3", name = "Какао-бобы", price = 0.03, image = "10085B5B00⠀5B8C00⣤60BD00⣤60BD00⣤8CBD00⣤5B8C00⣤5B5B00⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀009200⣤609200⠛306000⠛8C8C00⠀BDC200⣤BDC300⣤C2C800⣤92C200⣤BDBD00⠀8C8C00⠀000000⠀000000⠀000000⠀000000⠀000000⠀609200⠛306000⠛303000⠀000000⠀608C00⣤8CBD00⠛BDBD00⠀BDC200⠛BDBD00⠀8CBD00⠛5B6000⠛565B00⣤5BB700⣤5B6000⣤5BBD00⣤5B6000⣤606000⠀87B700⣤5B8700⣤000000⠀005B00⠛005B00⠛006000⠛006000⠛006000⠛008C00⠛005B00⠛5B5B00⠀BDBD00⠀92BD00⣤C3C300⠀BDC200⣤919200⣤BCBD00⣤5B5B00⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀606000⠀BDBD00⠀929200⠀C2C200⠀C2C200⠀8C9200⠛BCBD00⠛305B00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀5B6000⠛BCBD00⠛609200⠛BDC200⠛BDBD00⠀608C00⠛B7B700⠀2B2B00⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀005B00⠛008700⠛005B00⠛008C00⠛006000⠛005B00⠛005B00⠛002B00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀"},
	{uniqueID = "minecraft:reeds", id = "338", name = "Сахарный тростник", price = 0.03, image = "1008000000⠀9CD600⠛6B9D00⠛000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2D600⣤9C9D00⣤000000⠀000000⠀A2A200⠀9C9C00⠀70A600⠛000000⠀A2A200⠀9C9C00⠀00A600⣤000000⠀A2A200⠀9C9C00⠀007000⠛000000⠀9CA200⣤6B9C00⣤000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀9CD600⠛6B9D00⠛007000⠛000000⠀A2D600⣤9C9D00⣤000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀9CA200⣤6B9C00⣤000000⠀000000⠀A2A200⠀9C9C00⠀70A600⠛70A600⠛9CD600⠛6B9D00⠛000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2D600⣤9C9D00⣤000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀007000⠛9CD600⠛6B9D00⠛000000⠀70A600⠛A2A200⠀9C9C00⠀000000⠀000000⠀9CA200⣤6B9C00⣤000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2D600⣤9C9D00⣤000000⠀007000⣤A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀000000⠀9CA200⣤6B9C00⣤000000⠀000000⠀A2A200⠀9C9C00⠀000000⠀"},
	{uniqueID = "minecraft:nether_wart", id = "372", name = "Адский нарост", price = 0.02, image = "1008000000⠀000000⠀008700⣤008700⣤008700⣤005600⣤005600⣤000000⠀000000⠀000000⠀008700⣤008700⣤008700⣤005600⣤005600⣤000000⠀005600⣤568800⣤88B300⣤878800⠛828800⠛82B800⠛828800⠛565600⠀005600⣤568800⣤878800⠛828800⠛5BB800⠛878800⠛568800⠛565600⠀565600⠀88B300⣤828700⠛828200⠀82B300⣤828200⠀565600⠀565600⠀565600⠀888800⠀828200⠀828D00⣤5B8200⣤5B8200⠛568200⠛565600⠀005600⠛568800⠛828200⠀5B8200⠛5B8200⣤568200⠛565600⠀565600⠀568200⣤565600⠀568200⠛5B8200⣤568200⠛565600⠀005600⠛000000⠀000000⠀005600⣤565600⠀828700⣤565600⠀565600⠀568200⣤565600⠀565600⠀565600⠀565600⠀5B8700⠛5B5C00⣤565600⠀000000⠀000000⠀565600⠀5B8800⠛565600⠀5B8200⠛565B00⣤565B00⣤828200⠀565600⠀565600⠀565B00⣤2B5600⠛5B5B00⠀5B5B00⠀565600⠀000000⠀000000⠀000000⠀2B3000⣤565B00⣤5B6100⣤5B5B00⠀305B00⠛5B5B00⠀565B00⣤2B3000⣤565B00⣤303000⠀5C5C00⠀5B5C00⠛302A00⣤000000⠀000000⠀000000⠀2B3000⠛2B3000⠛5B5C00⣤5B5B00⠀303000⠀5B5B00⠀5B5C00⠛2B3000⠛5B5B00⠀2B3000⠛616100⠀535300⠀292A00⠛000000⠀000000⠀"},
	{uniqueID = "minecraft:ender_pearl", id = "368", name = "Жемчуг Эндера", price = 0.5, image = "1008000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000B00⣤000B00⣤0B4100⣤0B4100⣤0B3C00⣤000B00⣤000B00⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000B00⣤0B4100⣤104100⠛41A900⣤104C00⣤0B1000⠛0B1000⠛103C00⠛103C00⠛0B1000⣤000B00⣤000000⠀000000⠀000000⠀000000⠀000B00⣤0B4100⣤104100⠛4CA900⠛0B4C00⠛0B0B00⠀290B00⠛290B00⠛0B0B00⠀0B0B00⠀0B1000⠛0B1000⣤000B00⣤000000⠀000000⠀000000⠀0B0B00⠀3C4100⠛101000⠀0B0B00⠀0B0B00⠀292900⠀292900⠀292900⠀0B0B00⠀0B0B00⠀414100⠀101000⠀0B0B00⠀000000⠀000000⠀000000⠀000000⠀0B0B00⠀3C3C00⠀0B1000⣤0B0B00⠀0B0B00⠀0B0B00⠀0B0B00⠀0B4C00⣤4CA900⣤101000⠀0B0B00⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000B00⠛0B1000⠛0B1000⠛0B1000⣤104100⠛104100⠛0B1000⠛0B1000⠛000B00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000B00⠛000B00⠛000B00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀"},
	{uniqueID = "minecraft:bone", id = "352", name = "Кость", price = 0.2, image = "1008000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00D600⣤007F00⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀F9FF00⠛FED700⠛D6D700⣤007F00⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00F900⣤F9D700⣤7FD700⠛007F00⠛007F00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00F900⣤F9FF00⣤7FD700⠛007F00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00F900⣤F9D700⣤7FD700⠛007F00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00D700⣤00F900⣤F9FF00⣤7FD700⠛007F00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀7FD600⠛D6FF00⠛D7D700⠀7F7F00⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀007F00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀"},
	{uniqueID = "minecraft:leather", id = "334", name = "Кожа", price = 0.2, image = "1008000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀005B00⣤005B00⣤005B00⣤005B00⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀5B5B00⠀5B8D00⣤005B00⣤5BBD00⣤8DBD00⣤BDBD00⠀BDBD00⠀8D8D00⠀5BBD00⣤005B00⣤5B8D00⣤305B00⠛000000⠀000000⠀000000⠀000000⠀000000⠀5B5B00⠀8DBD00⠛BDBD00⠀8D8D00⠀BDBD00⠀BDBD00⠀8DBD00⠛BDBD00⠀8D8D00⠀303000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀5B5B00⠀8DBD00⠛8DBD00⣤BDBD00⠀BDBD00⠀BDBD00⠀8D8D00⠀303000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀5B5B00⠀BDBD00⠀BDBD00⠀8D8D00⠀BDBD00⠀BDBD00⠀BDBD00⠀303000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀5B5B00⠀8DBD00⣤8DBD00⣤BDBD00⠀8DBD00⣤BDBD00⠀8DBD00⣤8DBD00⣤8D8D00⠀303000⠀000000⠀000000⠀000000⠀000000⠀000000⠀005B00⣤5B8D00⣤8DBD00⠛308D00⠛308D00⠛8D8D00⠀8D8D00⠀308D00⠛30BD00⠛8D8D00⠀308D00⣤003000⣤000000⠀000000⠀000000⠀000000⠀005B00⠛003000⠛003000⠛000000⠀000000⠀003000⠛003000⠛000000⠀000000⠀003000⠛003000⠛003000⠛000000⠀000000⠀"},
	{uniqueID = "minecraft:glowstone_dust", id = "348", name = "Светящаяся пыль", price = 0.1, image = "1008000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀006000⣤006000⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀006000⣤60FB00⣤CBCB00⠀96CB00⠛609600⣤006000⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀006000⣤60CB00⣤CBCB00⠀CBCB00⠀CBCB00⠀CBCB00⠀969600⠀659600⠛60FB00⣤006000⣤000000⠀000000⠀000000⠀000000⠀000000⠀606000⠀CBFB00⠛96CB00⠛CBCB00⠀96CB00⣤CBCB00⠀CBFB00⠛969600⠀969600⠀659600⠛969600⠀606000⠀000000⠀000000⠀000000⠀000000⠀006000⠛609600⠛96CB00⠛96FB00⠛CBCB00⠀CBCB00⠀65CB00⠛969600⠀969600⠀96FB00⣤609600⠛006000⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀006000⠛006000⠛609600⠛609600⠛609600⠛609600⠛006000⠛006000⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀"},
	{uniqueID = "minecraft:nether_star", id = "399", name = "Адская звезда", price = 128.9, image = "1008000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00AC00⣤007E00⣤000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀D5D700⣤D6FE00⣤818100⠀7E7E00⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00D500⣤00D700⣤D5D700⠛D5D500⠀FEFE00⠀ACD500⠛D5D500⠀7E8100⣤7E8100⣤007E00⣤000000⠀000000⠀000000⠀000000⠀000000⠀7EAC00⠛81D600⠛ACFE00⠛D5FE00⠛ACFE00⠛CBCD00⣤81CD00⠛81FE00⠛D5FE00⠛81AC00⠛7E8100⠛007E00⠛000000⠀000000⠀000000⠀000000⠀000000⠀007E00⠛007E00⠛7ED500⠛ACD500⠛FEFE00⠀81D500⣤7ED500⠛007E00⠛007E00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀007E00⠛7E8100⠛81D500⠛7E8100⠛007E00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀007E00⠛000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀"},
	{uniqueID = "minecraft:dragon_egg", id = "122", name = "Яйцо дракона", price = 194.22, image = "1008282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282C00⣤282C00⣤282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282C00⠛282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282C00⠛282C00⠛282800⠀282800⠀282800⠀282C00⣤282C00⣤282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282C00⠛282800⠀282800⠀282800⠀282800⠀282800⠀282C00⣤282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀2C2C00⠀282C00⠛282800⠀282800⠀282800⠀282800⠀282C00⣤282800⠀282800⠀282800⠀2C2C00⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀2C2C00⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282800⠀282C00⠛282800⠀282800⠀282800⠀282800⠀282800⠀"},
  
	--Индастриал
	{uniqueID = "IC2:itemRubber", id = "4099", name = "Резина", price = 0.0016, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:11", name = "Утилизатор", price = 1.48, image = "1008818100⠀81D500⣤81D500⣤81D500⣤81D500⣤81D500⣤81D500⣤81D500⣤81D500⣤81D500⣤81D500⣤AAD500⣤AAD500⣤AAD500⣤AAD500⣤AAAA00⠀81AA00⣤D5D500⠀53D500⡟53D500⠉53D500⠉2AD500⠉2AD500⠉53D500⠉53D500⠉2AD500⠉2AD500⠉53D500⠉53D500⠉53D500⢻D5D500⠀81AA00⠛818100⠀D5D500⠀53D500⡇2A5500⢈2A5500⡁2A5300⣾2A5300⡇555500⠀555500⠀2A5300⢸2A5300⣷2A5500⢈2A5500⡁53D500⢸D5D500⠀818100⠀81AA00⠛ACAC00⠀53AC00⡇2A5500⢈2A5500⡁2A5300⢿2A5300⡇555500⠀555500⠀2A5300⢸2A5300⡿2A5500⢈2A5500⡁53AC00⢸ACAC00⠀818100⠀AAAA00⠀ACAC00⠀53AC00⣧53AC00⣀53AC00⣀2AAC00⣀2AAC00⣀53AC00⣀53AC00⣀2AAC00⣀2AAC00⣀53AC00⣀53AC00⣀53AC00⣼ACAC00⠀818100⠀AAAA00⠀ABAB00⠀54AB00⡿54AB00⢏54AB00⡹54AB00⢏54AB00⡹54AB00⢏54AB00⡹54AB00⢏54AB00⡹54AB00⢏54AB00⡹54AB00⢿ABAB00⠀818100⠀AAAA00⠀ABAB00⠀54AB00⣷54AB00⣎54AB00⣱54AB00⣎54AB00⣱54AB00⣎54AB00⣱54AB00⣎54AB00⣱54AB00⣎54AB00⣱54AB00⣾ABAB00⠀818100⠀AAAA00⠀AAAB00⠛AAAB00⠛AAAB00⠛AAAB00⠛AAAB00⠛AAAB00⠛81AB00⠛AAAB00⠛AAAB00⠛AAAB00⠛AAAB00⠛AAAB00⠛81AB00⠛81AB00⠛818100⠀"},
	{uniqueID = "IC2:blockMachine", id = "202:5", name = "Компрессор", price = 1.18, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:13", name = "Индукционная печь", price = 4.18, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:2", name = "Электропечь", price = 0.98, image = ""},
	{uniqueID = "IC2:blockMachine2", id = "203:3", name = "Термальная центрифуга", price = 11.32, image = ""},
	{uniqueID = "IC2:blockMachine2", id = "203:5", name = "Рудопромывочный механизм", price = 3.84, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:3", name = "Дробитель", price = 1.18, image = ""},
	{uniqueID = "IC2:blockElectric", id = "200:2", name = "МФЭХ", price = 35.56, image = ""},
	{uniqueID = "IC2:blockElectric", id = "200:1", name = "МФЭ", price = 8.48, image = ""},
	{uniqueID = "IC2:blockElectric", id = "200", name = "Энергохранилище", price = 1.02, image = ""},
	{uniqueID = "IC2:blockMachine2", id = "203:4", name = "Маталлоформовочный механизм", price = 2.7, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:6", name = "Жидкостниый/Твердотельный наполняющий механизм", price = 1.53, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:4", name = "Экстрактор", price = 1.18, image = ""},
	{uniqueID = "IC2:blockMachine2", id = "203:9", name = "Консервирующий механизм", price = 1.66, image = ""},
	{uniqueID = "IC2:blockKineticGenerator", id = "192", name = "Кинетический ветрогенератор", price = 2.5, image = ""},
	{uniqueID = "IC2:blockGenerator", id = "194:9", name = "Кинетический генератор", price = 3.5, image = ""},
	{uniqueID = "IC2:itemwcarbonrotor", id = "4296", name = "Углеволоконный ротор ветрогенератора", price = 16, image = ""},
	{uniqueID = "IC2:blockGenerator", id = "194", name = "Генератор", price = 0.98, image = ""},
	{uniqueID = "IC2:upgradeModule", id = "4270", name = "Улучшение \"Ускоритель\"", price = 15.94, image = ""},
	{uniqueID = "IC2:upgradeModule", id = "4270:2", name = "Улучшение \"Энергохранитель\"", price = 0.77, image = ""},
	{uniqueID = "IC2:itemArmorEnergypack", id = "4184", name = "Энергетический ранец", price = 12.09, image = ""},
	{uniqueID = "IC2:itemBatLamaCrystal", id = "4193:26", name = "Лазуротроновый кристалл", price = 3.95, image = ""},
	{uniqueID = "IC2:itemBatCrystal", id = "4192:27", name = "Энергетический кристалл", price = 1.89, image = ""},
	{uniqueID = "IC2:itemAdvBat", id = "4191:26", name = "Продвинутый аккумулятор", price = 0.61, image = ""},
	{uniqueID = "IC2:itemBatREDischarged", id = "4189", name = "Незаряженный аккумулятор", price = 0.33, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202", name = "Основной корпус механизма", price = 0.8, image = ""},
	{uniqueID = "IC2:blockMachine", id = "202:12", name = "Продвинутый корпус механизма", price = 2.5, image = ""},
	{uniqueID = "IC2:itemPartCircuit", id = "4125", name = "Элекстросхема", price = 0.38, image = ""},
	{uniqueID = "IC2:itemPartCircuitAdv", id = "4126", name = "Продвинутая элекстросхема", price = 0.88, image = ""},
	{uniqueID = "IC2:itemCable", id = "4199", name = "Изолированный медный провод", price = 0.03, image = ""},
	{uniqueID = "IC2:upgradeModule", id = "4270:6", name = "Pulling Upgrade", price = 1.5, image = ""},
	{uniqueID = "IC2:upgradeModule", id = "4270:3", name = "Улучшение \"Выталкиватель\"", price = 1.24, image = ""},
	{uniqueID = "IC2:upgradeModule", id = "4270:4", name = "Улучшение \"Выталкиватель жидкостей\"", price = 1.28, image = ""},
	{uniqueID = "IC2:itemPartCarbonPlate", id = "4130", name = "Углепластик", price = 0.4, image = ""},
	{uniqueID = "IC2:itemPartAlloy", id = "4127", name = "Композит", price = 0.45, image = ""},
	{uniqueID = "IC2:itemDust", id = "4111:13", name = "Серная пыль", price = 0.2, image = ""},
	{uniqueID = "IC2:itemCable", id = "4199:9", name = "Стекловолоконный провод", price = 0.52, image = ""},
	{uniqueID = "IC2:itemBatChargeAdv", id = "4196:26", name = "Продвинутый заряжающий аккумулятор", price = 10, image = ""},
	{uniqueID = "IC2:itemBatChargeLamaCrystal", id = "4198:26", name = "Заряжающий лазуротроновый кристалл", price = 53.36, image = ""},
	{uniqueID = "IC2:itemBatChargeCrystal", id = "4197:26", name = "Заряжающий энергетический кристалл", price = 23.88, image = ""},
	{uniqueID = "GraviSuite:advLappack", id = "4808", name = "Улучшенный лаппак", price = 20.96, image = ""},
	{uniqueID = "IC2:itemToolWrenchElectric", id = "4152:26", name = "Электроключ", price = 2.35, image = ""},
	{uniqueID = "GraviSuite:graviTool", id = "4811", name = "Гравитул", price = 31.16, image = ""},
	{uniqueID = "GraviSuite:advDDrill", id = "4812", name = "Улучшенный алмазный бур", price = 46.67, image = ""},
	{uniqueID = "IC2:itemArmorJetpackElectric", id = "4181", name = "Электрический реактивный ранец", price = 13.16, image = ""},
	{uniqueID = "IC2:itemArmorNanoHelmet", id = "4172", name = "Нано-шлем", price = 14.59, image = ""},
	{uniqueID = "GraviSuite:advNanoChestPlate", id = "4806:26", name = "Улучшенный наножилет", price = 67.07, image = ""},
	{uniqueID = "IC2:itemArmorNanoChestplate", id = "4173", name = "Нано-кираса", price = 7.33, image = ""},
	{uniqueID = "IC2:itemArmorNanoLegs", id = "4174", name = "Нано-поножи", price = 6.93, image = ""},
	{uniqueID = "IC2:itemArmorNanoBoots", id = "4175", name = "Нано-ботинки", price = 6.13, image = ""},
	{uniqueID = "IC2:itemNanoSaber", id = "4160", name = "Нано-сабля", price = 6.43, image = ""},
	{uniqueID = "IC2:blockMachine2", id = "203:2", name = "Автосадовник", price = 7.16, image = ""},
	{uniqueID = "IC2:blockMachine3", id = "204:7", name = "Сборщик урожая", price = 26.46, image = ""},
	{uniqueID = "IC2:itemIngot", id = "4113:3", name = "Слиток закалённого железа", price = 0.2, image = ""},
	{uniqueID = "IC2:reactorCoolantSix", id = "4217:1", name = "Охлаждающий стержень 60к", price = 7.3, image = ""},
	{uniqueID = "IC2:itemCellEmpty", id = "4200:9", name = "Капсула хладагента", price = 0.5, image = ""},

	--Реакторы
	{uniqueID = "IC2:reactorUraniumSimple", id = "4206:1", name = "Топливный стержень (Уран)", price = 1.6, image = ""},
	{uniqueID = "IC2:reactorUraniumQuad", id = "4208:1", name = "Счетверённый топливный стержень (Уран)", price = 6.9, image = ""},
	{uniqueID = "IC2:reactorPlatingHeat", id = "4219", name = "Теплоёмкая реакторная пластина", price = 1.35, image = ""},
	{uniqueID = "IC2:reactorHeatSwitch", id = "4221:1", name = "Теплообменник", price = 1.18, image = ""},
	{uniqueID = "IC2:reactorHeatSwitchDiamond", id = "4224:1", name = "Продвинутый теплообменник", price = 3.42, image = ""},
	{uniqueID = "IC2:reactorVentGold", id = "4227:1", name = "Разогнанный теплоотвод", price = 2.48, image = ""},
	{uniqueID = "IC2:reactorVentDiamond", id = "4229:1", name = "Алмазный теплоотвод", price = 2.96, image = ""},
	{uniqueID = "IC2:reactorHeatSwitchSpread", id = "4223:1", name = "Компонентный теплообменник", price = 1.58, image = ""},
	{uniqueID = "IC2:reactorVentSpread", id = "4228", name = "Компонентный теплоотвод", price = 1.68, image = ""},
	{uniqueID = "IC2:blockGenerator", id = "194:5", name = "Ядерный реактор", price = 36.06, image = ""},
	{uniqueID = "IC2:blockReactorChamber", id = "195", name = "Реакторная камера", price = 10.2, image = ""},
	{uniqueID = "IC2:blockReactorRedstonePort", id = "198", name = "Реакторный проводник красного сигнала", price = 0.7, image = ""},
	{uniqueID = "IC2:blockAlloy", id = "181", name = "Укреплённый камень", price = 0.5, image = ""},
	{uniqueID = "IC2:blockAlloyGlass", id = "183", name = "Укреплённое стекло", price = 0.13, image = ""},

	--Адвансед панельки
	{uniqueID = "AdvancedSolarPanel:BlockMolecularTransformer", id = "228", name = "Молекулярный преобразователь", price = 40.35, image = ""},
	{uniqueID = "IC2:blockGenerator", id = "194:3", name = "Солнечная панель", price = 1.89, image = "1008557E00⠕007E00⠛007E00⠛005500⠛005400⠛007E00⠛007F00⠛007F00⠛007E00⠛005500⠛007F00⠛007E00⠛007E00⠛007E00⠛007F00⠛287F00⢻545500⠛002900⡇000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀00A000⡇000000⠀000000⠀000000⠀000000⠀000000⠀000000⠀297E00⢸545500⡶002900⣇002900⣀002900⣀002900⣀002900⣀002900⣀002900⣀00A000⠃002900⣀002900⣀002900⣀002900⣀002900⣀002900⣀287E00⢸547E00⡿2A5500⠿2A7E00⠿547E00⠷557E00⢸557E00⡖537E00⡇0B1600⣬101B00⣥2A5500⠙2A7E00⠛2A5500⢻547E00⢿547E00⢷545400⠀545400⠀2A7E00⣛2A5500⣰535500⣾2A5400⣯2A7E00⡉535500⢉2A7E00⡁2A1600⠿2A1600⠿2A1600⠇535500⣾2A5500⣘2A5500⣛2A5500⣛2A5400⣛2A5400⣛547E00⣭535500⠿2A5500⠿295500⢩2A5500⣥535400⡌295500⣛2A5500⢸535400⣇2A5400⣸2A5500⠛2A5400⣟535500⠛2A5400⣛2A5400⣛2A5400⢿535500⣉2A5500⣸545500⢒2A7E00⡟2A5500⠛2A5400⣛2A5400⣘2A5500⢘295400⢻535400⡋2A5300⡃2A5400⡭2A5400⡟535500⠞2A5300⠟295300⣽2A5500⣭2A5500⣭2A7E00⠩2A5500⢥535400⢤535400⠿535400⢗535400⠴2A5300⢸535400⣶2A5400⡿2A5300⢻2A5300⡇2A5300⣉2A5300⣤2A5300⣄"},
	{uniqueID = "CompactSolars:CompactSolarBlock", id = "741", name = "Солнечная панель 2-го уровня", price = 15.52, image = ""},
	{uniqueID = "CompactSolars:CompactSolarBlock", id = "741:1", name = "Солнечная панель 3-го уровня", price = 125.02, image = ""},
	{uniqueID = "CompactSolars:CompactSolarBlock", id = "741:2", name = "Солнечная панель 4-го уровня", price = 1002.07, image = ""},
	{uniqueID = "AdvancedSolarPanel:asp_crafting_items", id = "4305:9", name = "Часть саннариума", price = 1, image = ""},
	{uniqueID = "AdvancedSolarPanel:asp_crafting_items", id = "4305", name = "Саннариум", price = 9, image = ""},
	{uniqueID = "AdvancedSolarPanel:asp_crafting_items", id = "4305:8", name = "Излучающая армированная пластина", price = 24.8, image = ""},
	{uniqueID = "AdvancedSolarPanel:asp_crafting_items", id = "4305:7", name = "Армированная железная пластина", price = 8, image = ""},
	{uniqueID = "AdvancedSolarPanel:asp_crafting_items", id = "4305:2", name = "Излучающий уран", price = 1.1, image = ""},
	{uniqueID = "AdvancedSolarPanel:asp_crafting_items", id = "4305:11", name = "Слиток урана", price = 0.7, image = ""},

	--Нуклиар контроль
	{uniqueID = "IC2NuclearControl:blockNuclearControlMain", id = "677:7", name = "Стационарный энергосчётчик", price = 2, image = ""},
	{uniqueID = "IC2NuclearControl:blockNuclearControlMain", id = "677:9", name = "Продвинутая информационная панель", price = 7, image = ""},
	{uniqueID = "IC2NuclearControl:ItemUpgrade", id = "4927:1", name = "Улучшение оЦветность", price = 1, image = ""},
	{uniqueID = "IC2NuclearControl:ItemUpgrade", id = "4927", name = "Улучшение оУсиление сигранап", price = 3, image = ""},
	{uniqueID = "IC2NuclearControl:ItemRemoteSensorKit", id = "4919", name = "Набор с дистанционным датчиком", price = 2, image = ""},
	{uniqueID = "IC2NuclearControl:ItemMultipleSensorKit", id = "4921", name = "Набор для счётчика энергии", price = 0.8, image = ""},
	{uniqueID = "IC2NuclearControl:blockNuclearControlMain", id = "677", name = "Датчик температуры", price = 1.7, image = ""},

	--Драконик эволюшн
	{uniqueID = "DraconicEvolution:energyInfuser", id = "1701", name = "Наполнитель энергии", price = 58, image = ""},
	{uniqueID = "DraconicEvolution:draconium", id = "1695", name = "Дракониевый блок", price = 23.94, image = ""},
	{uniqueID = "DraconicEvolution:infusedObsidian", id = "1707", name = "Заряженный драконием обсидиан", price = 26, image = ""},

	--Термал экспеншн
	{uniqueID = "PowerUtils:BlockMain", id = "656", name = "Силовой конвертер", price = 12.3, image = ""},
	{uniqueID = "ThermalExpansion:Frame", id = "667", name = "Рамка механизма (Основная)", price = 0.9, image = ""},
	{uniqueID = "ThermalExpansion:Frame", id = "667:1", name = "Рамка механизма (Усиленная)", price = 1.8, image = ""},
	{uniqueID = "ThermalExpansion:Frame", id = "667:2", name = "Рамка механизма (Укреплённая)", price = 2.62, image = ""},
	{uniqueID = "ThermalExpansion:Frame", id = "667:3", name = "Рамка механизма (Резонирующая)", price = 6.72, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:8", name = "Резонируюций водяной накопитель", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:11", name = "Резонирующий фитогенный светильник", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:7", name = "Резонирующий вулканический пресс", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:5", name = "Резонирующий распределитель жидкостей", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:3", name = "Резонирующая индукционная плавильня", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:2", name = "Резонирующая лесопилка", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:1", name = "Резонирующий измельчитель", price = 9, image = ""},
	{uniqueID = "ThermalExpansion:Machine", id = "657:4", name = "Резонирующий магмовый тигель", price = 9, image = ""},
	{uniqueID = "ThermalDynamics:filter", id = "6077:4", name = "Резонируюций фильтр", price = 0.9, image = ""},
	{uniqueID = "ThermalDynamics:filter", id = "6077", name = "Фильтр", price = 0.2, image = ""},
	{uniqueID = "ThermalDynamics:retriever", id = "6078:4", name = "Резонируюций поисковик", price = 0.9, image = ""},
	{uniqueID = "ThermalDynamics:servo", id = "6075:4", name = "Резонирующий сервомеханизм", price = 0.9, image = ""},
	{uniqueID = "ThermalExpansion:augment", id = "4802:128", name = "Расширение: Вторичная принимающая катушка", price = 0.7, image = ""},
	{uniqueID = "ThermalExpansion:augment", id = "4802:129", name = "Расширение: Разогнанный модульный редуктор", price = 1.1, image = ""},
	{uniqueID = "ThermalExpansion:augment", id = "4802:130", name = "Расширение: Пространственно-временной унификатор флакса", price = 2, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:76", name = "Слиток эндериума", price = 0.9, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:74", name = "Синаловый слиток", price = 0.13, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:72", name = "Инваровый слиток", price = 0.1, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:75", name = "Ламиумовый слиток", price = 0.2, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:71", name = "Электрумовый слиток", price = 0.1, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:513", name = "Пыль криотеума", price = 0.2, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:512", name = "Пыль пиротеума", price = 0.2, image = ""},
	{uniqueID = "ThermalExpansion:augment", id = "4802:312", name = "Расширение: Ускоренная экструзия", price = 0.9, image = ""},
	{uniqueID = "ThermalExpansion:augment", id = "4802:313", name = "Расширение: Вулканический катализатор", price = 0.9, image = ""},
	{uniqueID = "ThermalExpansion:augment", id = "4802:314", name = "Расширение: Пирокластическое генерирование", price = 0.9, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:68", name = "Никелевый слиток", price = 0.1, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:69", name = "Платиновый слиток", price = 1, image = ""},
	{uniqueID = "ThermalExpansion:capacitor", id = "4798:5", name = "Резонирующий флаксовый конденсатор", price = 4, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:1028", name = "Basalz Rod", price = 0.4, image = ""},
	{uniqueID = "ThermalFoundation:material", id = "4673:1024", name = "Бурановый стержень", price = 0.5, image = ""},
	{uniqueID = "ThermalFoundation:bucket", id = "4672:2", name = "Ведро резонирующего эндериума", price = 2.3, image = ""},
	{uniqueID = "ThermalFoundation:bucket", id = "4672", name = "Ведро дестабилизированного красного камня", price = 0.9, image = ""},
	{uniqueID = "ThermalFoundation:bucket", id = "4672:4", name = "Ведро ледяного кристеума", price = 2, image = ""},
	{uniqueID = "ThermalFoundation:bucket", id = "4672:1", name = "Ведро заряженного светящегося камня", price = 0.9, image = ""},
	{uniqueID = "ThermalFoundation:bucket", id = "4672:8", name = "Ведро тектонического петротеума", price = 1.5, image = ""},
	{uniqueID = "ThermalFoundation:bucket", id = "4672:3", name = "Ведро пылающего пиротеума", price = 1.2, image = ""},

	--Майнфактори
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833", name = "Сеятель", price = 2.5, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:1", name = "Рыболов", price = 2.8, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:2", name = "Комбайн", price = 3, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:3", name = "Фермер", price = 2.6, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:4", name = "Удобритель", price = 2.6, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:12", name = "Селекционер", price = 3.2, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:13", name = "Молотилка", price = 2.7, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.0", id = "833:15", name = "Сепаратор", price = 4, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.1", id = "836:13", name = "Бойня", price = 2.6, image = ""},
	{uniqueID = "MineFactoryReloaded:machine.2", id = "864:6", name = "Сборщик фруктов", price = 2.8, image = ""},
	{uniqueID = "MineFactoryReloaded:upgrade.radius", id = "5574:3", name = "Улучшение (Медь)", price = 0.5, image = ""},

	--Дварвен сити
	{uniqueID = "dwcity:Vis_materia", id = "6382", name = "Вис Материя", price = 3.85, image = ""},
	{uniqueID = "dwcity:Dark_materia", id = "6338", name = "Тёмная Материя", price = 2.7, image = ""},
	{uniqueID = "dwcity:Fire_materia", id = "6388", name = "Солнечная Материя", price = 3.11, image = ""},
	{uniqueID = "dwcity:Live_materia", id = "6380", name = "Живая Материя", price = 2.6, image = ""},
	{uniqueID = "dwcity:Sky_materia", id = "6406", name = "Ледяная Материя", price = 2.6, image = ""},
	{uniqueID = "dwcity:Thorium_ingot", id = "6683", name = "Ториевый слиток", price = 0.59, image = ""},
	{uniqueID = "dwcity:Flux_ingot", id = "6336", name = "Флаксовый слиток", price = 0.9, image = ""},
	{uniqueID = "dwcity:Powder11", id = "6397", name = "Трижды сжатый камень", price = 10, image = ""},
	{uniqueID = "dwcity:Powder7", id = "6355", name = "Дважды сжатый адский кирпич", price = 15, image = ""},
	{uniqueID = "dwcity:Potion_seal", id = "6776", name = "Печать алхимии", price = 10, image = ""},
	{uniqueID = "dwcity:Dnk_seal", id = "6687", name = "Печать ДНК", price = 125, image = ""},
	{uniqueID = "dwcity:Death_seal", id = "6791", name = "Печать смерти", price = 62.7, image = ""},
	{uniqueID = "dwcity:Cube_seal", id = "6817", name = "Кубическая печать", price = 70, image = ""},
	{uniqueID = "dwcity:Sword_seal", id = "6738", name = "Печать обороны", price = 20, image = ""},
	{uniqueID = "dwcity:Machine_seal", id = "6777", name = "Механическая печать", price = 28.04, image = ""},
	{uniqueID = "dwcity:Lamp_seal", id = "6698", name = "Печать света", price = 20, image = ""},
	{uniqueID = "dwcity:Flux_seal", id = "6787", name = "Флаксовая печать", price = 60, image = ""},
	{uniqueID = "dwcity:Grass_seal", id = "6820", name = "Печать жизни", price = 2.6, image = ""},
	{uniqueID = "dwcity:Module_seal", id = "6825", name = "Модульная печать", price = 16, image = ""},
	{uniqueID = "dwcity:Liquid_seal", id = "6785", name = "Жидкостная печать", price = 20, image = ""},
	{uniqueID = "dwcity:Armor_seal", id = "6748", name = "Печать защиты", price = 35, image = ""},
	{uniqueID = "dwcity:Ore_seal", id = "6710", name = "Печать удачи", price = 15, image = ""},
	{uniqueID = "dwcity:Chest_seal", id = "6815", name = "Печать безопасности", price = 40, image = ""},
	{uniqueID = "dwcity:Laser_seal", id = "6737", name = "Лазерная печать", price = 30, image = ""},

	--аплай
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:260", name = "МЭ шина экспорта", price = 0.7, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:240", name = "МЭ шина импорта", price = 0.7, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:16", name = "МЭ стеклянный кабель - Изменчивый", price = 0.12, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:56", name = "МЭ умный кабель - Изменчивый", price = 0.27, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:76", name = "МЭ плотный кабель - Изменчивый", price = 0.7, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:19", name = "Кремниевый пресс для высекателя", price = 8, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:15", name = "Логический пресс для высекателя", price = 8, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:14", name = "Инженерный пресс для высекателя", price = 8, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:13", name = "Вычислительный пресс для высекателя", price = 8, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:22", name = "Логический процессор", price = 0.15, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:24", name = "Инженерный процессор", price = 0.45, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:23", name = "Вычислительный процессор", price = 0.15, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockCraftingUnit", id = "427", name = "Блок создания", price = 1.09, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:39", name = "МЭ корпус ячейки хранения", price = 0.65, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:35", name = "1К МЭ компонент хранения", price = 0.75, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:36", name = "4К МЭ компонент хранения", price = 2.7, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:37", name = "16К МЭ компонент хранения", price = 9.05, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:38", name = "64К МЭ компонент хранения", price = 28.1, image = ""},
	{uniqueID = "extracells:storage.component", id = "7013", name = "256КБ МЭ компонент хранилища", price = 85.3, image = ""},
	{uniqueID = "extracells:storage.casing", id = "7020:1", name = "Жидкостный корпус хранилища", price = 3.7, image = ""},
	{uniqueID = "extracells:storage.casing", id = "7020", name = "Продвинутый корпус хранилища", price = 2.5, image = ""},
	{uniqueID = "extracells:storage.component", id = "7013:4", name = "1Кб МЭ жидкостный компонент хранилища", price = 0.75, image = ""},
	{uniqueID = "extracells:storage.component", id = "7013:5", name = "4Кб МЭ жидкостный компонент хранилища", price = 2.7, image = ""},
	{uniqueID = "extracells:storage.component", id = "7013:6", name = "16Кб МЭ жидкостный компонент хранилища", price = 8.55, image = ""},
	{uniqueID = "extracells:storage.component", id = "7013:7", name = "64Кб МЭ жидкостный компонент хранилища", price = 26.1, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:32", name = "2 пространственный компонент", price = 11.33, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:33", name = "16 пространственный компонент", price = 46.17, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:34", name = "128 пространственный компонент", price = 185.53, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockDenseEnergyCell", id = "425", name = "Плотная энергетическая ячейка", price = 15.35, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:400", name = "МЭ монитор хранения", price = 0.5, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:380", name = "МЭ терминал", price = 0.95, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:360", name = "МЭ терминал создания", price = 1.1, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:340", name = "МЭ терминал шаблонов", price = 1.55, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiPart", id = "4343:480", name = "МЭ терминал интерфейсов", price = 1.65, image = ""},
	{uniqueID = "extracells:part.base", id = "7011:3", name = "МЭ жидкостный терминал", price = 1.1, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:52", name = "Пустой шаблон", price = 0.9, image = ""},
	{uniqueID = "appliedenergistics2:item.ToolWirelessTerminal", id = "4321", name = "Беспроводной терминал", price = 19.32, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockWireless", id = "246", name = "МЭ беспроводная точка доступа", price = 3.3, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockSecurity", id = "249", name = "МЭ тепминал безопасности", price = 11.71, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:42", name = "Беспроводной усилитель", price = 1.5, image = ""},
	{uniqueID = "dwcity:blockUltimateDrive", id = "1917", name = "Совершенный МЭ накопитель", price = 55.12, image = ""},
	{uniqueID = "dwcity:blockHybridDrive", id = "2043", name = "Гибридный МЭ накопитель", price = 17.38, image = ""},
	{uniqueID = "dwcity:blockAdvancedDrive", id = "1925", name = "Улучшенный МЭ накопитель", price = 6.28, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockDrive", id = "409", name = "МЭ накопитель", price = 1.54, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockController", id = "255", name = "МЭ контроллер", price = 2.25, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockInterface", id = "411", name = "МЭ интерфейс", price = 0.98, image = ""},
	{uniqueID = "dwcity:blockUltimateInterface", id = "2135", name = "Совершенный МЭ интерфейс", price = 17, image = ""},
	{uniqueID = "dwcity:blockHybridInterface", id = "2027", name = "Гибридный МЭ интерфейс", price = 5.6, image = ""},
	{uniqueID = "dwcity:blockAdvancedInterface", id = "1982", name = "Улучшенный МЭ интерфейс", price = 2.56, image = ""},
	{uniqueID = "dwcity:blockAdvancedInterfaceDeliver", id = "2275", name = "Улучшенный МЭ интерфейс поставки", price = 3.1, image = ""},
	{uniqueID = "dwcity:blockHybridInterfaceDeliver", id = "2274", name = "Гибридный МЭ интерфейс поставки", price = 9, image = ""},
	{uniqueID = "dwcity:blockUltimateInterfaceDeliver", id = "2273", name = "Совершенный МЭ интерфейс поставки", price = 29, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockMolecularAssembler", id = "430", name = "Молекулярный сборщик", price = 1.18, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:7", name = "Изменчивый кристалл", price = 0.35, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockQuartzGlass", id = "236", name = "Кварцевое стекло", price = 0.1, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockQuartzGrowthAccelerator", id = "423", name = "Ускоритель роста кристаллов", price = 2.24, image = ""},
	{uniqueID = "appliedenergistics2:tile.BlockIOPort", id = "413", name = "МЭ порт ввода\\вывода", price = 3.5, image = ""},
	{uniqueID = "appliedenergistics2:item.ToolBiometricCard", id = "4322", name = "Биометрическая карта", price = 0.9, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:26", name = "Карта красного камня", price = 0.35, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:29", name = "Карта нечёткости", price = 0.65, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:27", name = "Карта ёмкости", price = 0.45, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:53", name = "Карта создания", price = 0.35, image = ""},
	{uniqueID = "appliedenergistics2:item.ItemMultiMaterial", id = "4342:30", name = "Карта ускорения", price = 0.83, image = ""},
}

for k, v in ipairs(items) do
    v.quantity = v.quantity or 1
    v.amount = 0
    local _, dmg = string.match(v.id, "(%d+):(%d+)")
    v.dmg = tonumber(dmg) or 0
end

return items