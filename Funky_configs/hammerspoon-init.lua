-------------------------------------------------------------------
-- Globals
-------------------------------------------------------------------
-- This controls all window animations.
hs.window.animationDuration = 0

-------------------------------------------------------------------
-- Window Layouts
-------------------------------------------------------------------

local function calculateAxesForFloaters(widthAndHeight)
    return {
        x = (
            ((1000 - widthAndHeight.w) / 2) / 1000
        ),
        y = (
            ((1000 - widthAndHeight.h) / 2) / 1000
        ),
        w = (widthAndHeight.w / 1000),
        h = (widthAndHeight.h / 1000)
    }
end

-- These are just convenient names for layouts. We can use numbers
-- between 0 and 1 for defining 'percentages' of screen real estate
-- so 'right50' is the window on the right of the screen where the
-- vertical split (x-axis) starts at 50% of the screen from the
-- left, and is 50% wide.
--
-- And so on...
units = {

    --[[
        Sequences!
        These use exact decimal arguments because
        no calculation is necessary. They are
        just a plan iteration sequence.
    ]]
    left33 = {
        x = 0.000,
        y = 0.000,
        w = 0.330,
        h = 1.000
    },
    left50 = {
        x = 0.000,
        y = 0.000,
        w = 0.500,
        h = 1.000
    },
    left67 = {
        x = 0.000,
        y = 0.000,
        w = 0.670,
        h = 1.000
    },

    right33 = {
        x = 1.000,
        y = 0.000,
        w = 0.330,
        h = 1.000
    },
    right50 = {
        x = 1.000,
        y = 0.000,
        w = 0.500,
        h = 1.000
    },
    right67 = {
        x = 1.000,
        y = 0.000,
        w = 0.670,
        h = 1.000
    },

    middle34 = {
        x = 0.330,
        y = 0.000,
        w = 0.340,
        h = 1.000
    },

    --[[
        The following sizes involve calculations,
        and due to the oddities in floating
        point arithmetic, they are done
        at a '* 1000' level, and then
        divided back to the decimal
        level before being used.
    ]]
    maximum = calculateAxesForFloaters(
        {
            w = 1000,
            h = 1000
        }
    ),
    centerLarge = {
        w = 800,
        h = 950
    },
    centerSmall = {
        w = 350,
        h = 500
    }

}

local function combineTables(...)
    local combinedTable = {}
    local arg = {...}

    for k, v in pairs(arg) do
        if type(v) == 'table' then
            for tk, tv in pairs(v) do
                table.insert(combinedTable, tv)
            end
        end
    end

    return combinedTable
end

-- All of the mappings for moving the window of the
-- 'current' application to the right spot.
mash = {
    'alt',
    'ctrl',
    'cmd'
}
mashPlus = combineTables(
    mash,
    {
        'shift'
    }
)

-- Useful for debugging your Spoons.
local hsPrint = function(...)
    hs.rawprint(...)
    hs.console.printStyledtext(...)
end

local function bindIt(...)
    local arg = {...}
    for ignore, bindTable in pairs(arg) do
        if type(bindTable) == 'table' then
            local sequenceIndex = 1
            hs.hotkey.bind(
                bindTable.start,
                bindTable.mod,
                function()
                    if bindTable.push then
                        return hs.grid['pushWindow' .. bindTable.push .. 'Screen']
                    elseif bindTable.single then
                        return hs.window.focusedWindow():move(
                            bindTable.single,
                            nil,
                            true
                        )
                    elseif bindTable.sequence then
                        hs.window.focusedWindow():move(
                            bindTable.sequence[sequenceIndex],
                            nil,
                            true
                        )
                        sequenceIndex = sequenceIndex + 1
                        if sequenceIndex > #bindTable.sequence then
                            sequenceIndex = 1
                        end
                        return sequenceIndex
                    else
                        local win = hs.window.focusedWindow()
                        local frame = win:screen():toUnitRect(win:frame())

                        frame.w = frame.w * 1000
                        frame.h = frame.h * 1000

                        if bindTable.max then
                            if (frame.w + bindTable.change) > bindTable.max.w then
                                frame.w = bindTable.max.w
                            else
                                frame.w = frame.w + bindTable.change
                            end

                            if (frame.h + bindTable.change) > bindTable.max.h then
                                frame.h = bindTable.max.h
                            else
                                frame.h = frame.h + bindTable.change
                            end
                        elseif bindTable.min then
                            if (frame.w - bindTable.change) < bindTable.min.w then
                                frame.w = bindTable.min.w
                            else
                                frame.w = frame.w - bindTable.change
                            end

                            if (frame.h - bindTable.change) < bindTable.min.h then
                                frame.h = bindTable.min.h
                            else
                                frame.h = frame.h - bindTable.change
                            end
                        end

                        local calcedFrame = calculateAxesForFloaters(
                            {
                                w = frame.w,
                                h = frame.h
                            }
                        )

                        return win:move(
                            calcedFrame,
                            nil,
                            true
                        )
                    end
                end
            )
        end
    end
end


bindIt(

    {
        start = mash,
        mod = 'left',
        sequence = {
            units.left33,
            units.left50,
            units.left67
        }
    },
    {
        start = mash,
        mod = 'right',
        sequence = {
            units.right33,
            units.right50,
            units.right67
        }
    },
    {
        start = mash,
        mod = 'up',
        change = 150,
        max = {
            h = units.centerLarge.h,
            w = units.centerLarge.w
        }
    },
    {
        start = mash,
        mod = 'down',
        change = 150,
        min = {
            h = units.centerSmall.h,
            w = units.centerSmall.w
        }
    },

    {
        start = mash,
        mod = 'a',
        single = units.maximum
    },

    {
        start = mash,
        mod = 'z',
        single = units.middle34
    },

    {
        start = mash,
        mod = 'p',
        push = 'Prev'
    },
    {
        start = mashPlus,
        mod = 'left',
        push = 'Prev'
    },
    {
        start = mash,
        mod = 'n',
        push = 'Next'
    },
    {
        start = mashPlus,
        mod = 'right',
        push = 'Next'
    }

)
