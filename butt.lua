butt = {} -- Table to store our functions
local buttons = {} -- Table to store buttons; invisible to the importer
local style = {borderwidth = 2,
		bordercolor = {170, 170, 170, 255}, -- {red, green, blue, alpha}
		bodycolor = {200, 200, 200, 255},
		textcolor = {10, 10, 10, 255},
		textoffset = 5,
		textsize = 1
		}

function butt.update(dt)
	local mx, my = love.mouse.getPosition()
	
	for button in buttons do
		if mx >= button.px and mx <= button.px + button.width and my >= button.py and my <= button.py + button.height then
			_G[button.action]()
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
	local button = {px = px, py = py, width = width, text = text, action = action, id = id}
	table.insert(buttons, button)
end

function butt.draw()
	for button in buttons do
		if style.borderwidth ~= 0 then -- Draw the border
			love.graphics.setColor(style.bordercolor)
			love.graphics.rectangle("fill", button.px, button.py, button.width, button.height)
		end
		
		love.graphics.setColor(style.bodycolor) -- Draw the button body
		love.graphics.rectangle("fill", button.px + style.borderwidth, button.py + style.borderwidth, button.width - style.borderwidth, button.height - style.borderheight)
		
		love.graphics.setColor(style.textcolor) -- Draw the button text
		love.graphics.print(button.text, button.px + style.textoffset, button.py + style.textoffset, 0, style.textsize, style.textsize)
	end
end

function butt.remove(id)
	for button in buttons do
		if button.id == id then -- Remove only button(s) with supplied id
			table.remove(buttons, button)
		end
	end
end