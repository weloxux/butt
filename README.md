# butt
butt (short for _button_) is a very simple button library for LÖVE.

## Features
* Some simple styling: fonts, borders, colours
* Execute any function on click
* Easily add and remove buttons while the game is running

## Usage

The first thing you need to use butt, is require it, like this:
```lua
require "butt"
```

To make sure butt can work properly, you need to execute `butt.update(dt)` and `butt.draw()` in `love.update(dt)` and `love.draw()` respectively.

### Adding buttons
Next of, you'll want to make some buttons. Buttons are created like this:
```lua
butt.new( x-location, y-location, width, height, label, function, id)
```

An example button could look a little like this:
```lua
butt.new(20, 20, 100, 40, "Button", "print(\"Hello butt!\")", "examplebutton")
```

Some of these might need some explaining:
* x- and y-location are the position of the button's top-left corner
* width and height are the buttons, wait for it, width and height. woah!
* label is the text displayed on the button
* function is the function that gets executed when the button is clicked
* id is a unique identifier for the button that can be used to remove it

### Moving buttons
Moving buttons is done pretty easily: simply call `butt.move` with the button id, a new x position, and a new y position.
```lua
butt.move("examplebutton", 120, 90)
```

### Deleting buttons
To delete a button, simply call `butt.remove` with a string containing the id of the button you want to delete:
```lua
butt.remove("examplebutton")
```

## Example

Piecing these things together, an example usage of butt could look like this:

```lua
require "butt" -- Require butt, so we can use it (duh)

function love.load()
    butt.new(20, 20, 100, 40, "Button", "print(\"Hello butt!\")", "examplebutton") -- Create a new button, with id examplebutton. It triggers the print function when clicked.
    butt.new(500, 23, 36, 36, "M", "butt.move(\"examplebutton\", 0, 0)", "mvbutton") -- Create another button, that moves the first one.
    butt.new(300, 20, 36, 36, "X", "butt.remove(\"examplebutton\")", "rmbutton") -- Create yet another button, that removes the first one when clicked.

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

When you run this file, you'll see the following (old screenshot without mvbutton):

![butt](https://raw.githubusercontent.com/weloxux/butt/master/scrot.png)

In this screenshot, the examplebutton has been clicked once, resulting in "Hello butt!" being printed to the stdout. If you'd click the rmbutton, the examplebutton would disappear.

## To do

- [x] Make text get displayed on buttons
- [x] Fix running function on click
- [x] Run tests
- [x] Expand documentation
- [x] Make buttons easily moveable (butt.move, butt.edit, something like that)


## Known bugs

- Button actions get repeated over and over while the mouse button is down, because LÖVE doesn't offer checking for presses in functions other than love.keypressed; this should however be not much of a problem in most practical cases.

## License
butt is licensed under the GNU General Public License, version 3.
