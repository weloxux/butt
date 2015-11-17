# butt
butt (short for _button_) is a very simple button library for LÖVE.

## Features
* Some simple styling: fonts, borders, colours
* Execute any function on click
* Easily add and remove buttons while the game is running

## Usage

An example usage of butt could look like this:

```lua
require "butt" -- Require butt, so we can use it (duh)

function love.load()
    butt.new(20, 20, 100, 40, "Button", "print(\"Hello butt!\")", "examplebutton") -- Create a new button, with id examplebutton. It triggers the print function when clicked.
    butt.new(300, 20, 36, 36, "X", "butt.remove(\"examplebutton\")", "rmbutton") -- Create another button, that removes the first one when clicked.

    -- Further initialisation here
end

function love.update(dt)
    butt.update(dt) -- Check if buttons get clicked

    -- Do other things here
end

function love.draw()
    -- Draw things below buttons here

    butt.draw() -- Draw all current buttons

    -- Draw things on top of buttons here
end

```

## To do

- [x] Make text get displayed on buttons
- [ ] Expand documentation
- [x] Fix running function on click
- [x] Run tests

## Known bugs

- Button actions get repeated over and over while the mouse button is down, because LÖVE doesn't offer checking for presses in functions other than love.keypressed; this should however be not much of a problem in most practical cases.

## License
butt is licensed under the GNU General Public License, version 3.
