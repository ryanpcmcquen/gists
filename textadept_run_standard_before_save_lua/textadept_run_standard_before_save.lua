--[[
JavaScript:
--]]
standard = '/usr/local/bin/node /usr/local/bin/standard --fix '

-- Format JavaScript with the 'Compile' command.
textadept.run.compile_commands.javascript = standard .. ' "%f"'

-- Format JavaScript before save:
events.connect(
    events.FILE_BEFORE_SAVE,
    function()
        if buffer:get_lexer() == 'javascript' then
            return textadept.editing.filter_through(
                standard .. '--stdin'
            )
        else
            return
        end
    end
)