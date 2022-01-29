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