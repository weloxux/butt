# butt
A very simple button library for Love2D

## Usage

An example usage of butt could look like this:

```lua
require "butt" -- Require butt, so we can use it

function love.load()
    butt.new(20, 20, 100, 40, "Button", "print(\"test\")", "examplebutton") -- Create a new button

    counter = 0

    -- Further initialisation here
end

function love.update(dt)
    butt.update(dt)

    -- Do other things here

    counter = counter + dt
    if counter > 5 then -- Just an example: remove the button after some time
        butt.remove("examplebutton") -- We use our earlier defined id here, to make sure only the button we want to remove g
    end
end

function love.draw()
    -- Draw things below buttons here

    butt.draw()

    -- Draw things on top of buttons here
end

```

## To do

- [x] Make text get displayed on buttons
- [ ] Expand documentation
- [ ] Fix running function on click
- [x] Run tests

## Known bugs

- Functions don't get run on clicking

## License
butt is licensed under the GNU General Public License, version 3.
