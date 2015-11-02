# butt
A very simple button library for Love2D

## Usage

An example usage of butt could look like this:

```lua
require "butt" -- Require butt, so we can use it

function love.load()
	butt.new(20, 20, 100, 40, "Button", "print('test')", "examplebutton") -- Create a new button

	counter = 0

	-- Further initialisation here
end

function love.update(dt)
	butt.update(dt)

	-- Do other things here

	counter = counter + dt
	if counter > 10 then -- Just an example: remove the button after some time
		butt.remove("examplebutton") -- We use our earlier defined id here, to make sure only the button we want to remove gets removed
	end
end

function love.draw()
	-- Draw things below buttons here

	butt.draw()

	-- Draw things on top of buttons here
end
```

## License
butt is licensed under the GNU General Public License, version 3.