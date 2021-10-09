loadfile("../../scripts/lua/logging.lua")

lu = require("luaunit.luaunit")

Tests = {}
    function Tests:testAddPositive()
        local logInfo = log.info("test")
        lu.assertEquals("test", logInfo)
    end
os.exit(lu.LuaUnit.run())