local curl = require "cURL"
local json = require "cjson"

local M = {}

local function JsonResponseHandler(data) print(json.decode(data)[1].name) end

-- HTTP Get
local c = curl.easy {url = '', writefunction = JsonResponseHandler}:perform()

c:close()
return M
