butt = {} -- Table to store our functions
local buttons = {} -- Table to store buttons; invisible to the importer
butt.style = {borderwidth = 4,
		bordercolor = {220, 220, 220, 230}, -- {red, green, blue, alpha}
		bodycolor = {255, 255, 255, 255},
		textcolor = {10, 10, 10, 255},
		textoffset = 12,
		textsize = 1
		}

function butt.update(dt)
	local mx, my = love.mouse.getPosition()

	for k,button in pairs(buttons) do
		if mx >= button.px and mx <= button.px + button.width and my >= button.py and my <= button.py + button.height then
			if love.mouse.isDown("l") then
				loadstring(button.action)()
			end
		end
	end
end

function butt.new(px, py, width, height, text, action, id)
	--[[
	px and py are the locational coordinates
	width and height are the width and height of the button (duh)
	text is the text displayed on the button
	action is the function that clicking the button should run
	id is a unique name, used when moving or removing the button
	]]--
	local button = {px = px, py = py, width = width, height = height, text = text, action = action, id = id}
	table.insert(buttons, button)
end

function butt.draw()
	for k,button in pairs(buttons) do
		if butt.style.borderwidth ~= 0 then -- Draw the border
			love.graphics.setColor(butt.style.bordercolor)
			love.graphics.rectangle("fill", button.px, button.py, button.width, button.height)
		end
		
		love.graphics.setColor(butt.style.bodycolor) -- Draw the button body
		love.graphics.rectangle("fill", button.px + butt.style.borderwidth, button.py + butt.style.borderwidth, button.width - 2 * butt.style.borderwidth, button.height - 2 * butt.style.borderwidth)
		
		love.graphics.setColor(butt.style.textcolor) -- Draw the button text
		love.graphics.print(button.text, button.px + butt.style.textoffset, button.py + butt.style.textoffset, 0, butt.style.textsize, butt.style.textsize)
	end
end

function butt.move(id, nx, ny)
	for k,button in pairs(buttons) do
		if button.id == id then
			buttons[k].px = nx
			buttons[k].py = ny
		end
	end
end

function butt.remove(id)
	for k,button in pairs(buttons) do
		if button.id == id then -- Remove only button(s) with supplied id
			table.remove(buttons, k)
		end
	end
end
