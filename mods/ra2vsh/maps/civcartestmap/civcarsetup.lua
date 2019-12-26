xpos = 20
ypos = 15
ystartindex = 15
difference = 15
isticked = false

SpawnActorsWithTag = function(tag)
	civcars = ActorTag.ReturnActorTypes(tag)
	for _, name in ipairs(civcars) do
		Reinforcements.Reinforce(Player.GetPlayer("GDI"), {name}, {CPos.New(xpos, ypos), CPos.New(xpos + 1, ypos)}, 0)
		ypos = ypos - 1
		if ystartindex - ypos > difference then
			if xpos < 60 then
				ystartindex = ystartindex + 2
				difference = difference + 4
			else
				ystartindex = ystartindex - 2
				difference = difference - 4
			end
			ypos = ystartindex
			xpos = xpos + 2
		end
	end
	if xpos < 60 then
		ystartindex = ystartindex + 3
		difference = difference + 6
	else
		ystartindex = ystartindex - 3
		difference = difference - 6
	end
	xpos = xpos + 3
	ypos = ystartindex
end

Tick = function()
	if isticked == false then
		SpawnActorsWithTag("civilian-vehicle")
	end
isticked = true
end
