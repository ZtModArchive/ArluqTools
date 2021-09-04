--- Function for try-catching
--- @param func function
function try(func)
    -- Try
    local status, exception = pcall(func)
    -- Catch
    if not status then
        -- Show exception in the message panel in-game
        local increment =  50
        for i = 0, string.len(exception), increment
        do 
            displayZooMessageTextWithZoom(string.sub(exception, i, i+increment-1), 1, 30)
        end
    end
end

--- Function for try-catching with a custom callback
--- @param func function
--- @param callback function
function tryCatch(func, callback)
    -- Try
    local status, exception = pcall(func)
    -- Catch
    if not status then
        -- Call callback function
        callback(exception)
    end
end