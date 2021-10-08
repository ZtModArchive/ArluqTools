--- Logger class
log = {}

--- Log debug to output
--- @param message string
function log.debug (message)
    print(os.date("[%Y-%m-%d %H:%M:%S] ") .. "[DEBUG] " .. message)
    io.flush()
end

--- Log error to output
--- @param message string
function log.error (message)
    print(os.date("[%Y-%m-%d %H:%M:%S] ") .. "[ERROR] " .. message)
    io.flush()
end

--- Log info to output
--- @param message string
function log.info (message)
    print(os.date("[%Y-%m-%d %H:%M:%S] ") .. "[INFO] " .. message)
    io.flush()
end

--- Log warning to output
--- @param message string
function log.warn (message)
    print(os.date("[%Y-%m-%d %H:%M:%S] ") .. "[WARN] " .. message)
    io.flush()
end