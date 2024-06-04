# TYPEIT

A simple plugin to type a content char by char.
I made it as sometimes I need to record a clip
of me writing something and that's it :)

## Demo
https://github.com/0xWaleed/typeit-nvim/assets/20063083/5435e470-52da-4900-bb7c-3252ff993572


## Installation
### Lazy
```lua
{
    "0xWaleed/typeit-nvim",
    init = function()
        vim.keymap.set("n", "<leader>Ty", function() 
            require("typeit").typeit({delay = 30})
        end, {desc = "Re-type what in current buffer"})
    end
}
```

## API
### `typeit(opt)`
* `opt.delay` is the delay in between each char in milliseconds
* `opt.content` the content to be written, when nil, it will fallback to the current buffer's content


