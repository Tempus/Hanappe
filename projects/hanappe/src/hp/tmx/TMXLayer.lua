--------------------------------------------------------------------------------
-- Class is a layer of TMXMap.
-- @class table
-- @name TMXLayer
--------------------------------------------------------------------------------

local class = require("hp/lang/class")

local M = class()

--------------------------------------------------------------------------------
-- The constructor.
--------------------------------------------------------------------------------
function M:init(tmxMap)
    self.tmxMap = tmxMap
    self.name = ""
    self.x = 0
    self.y = 0
    self.width = 0
    self.height = 0
    self.opacity = 0
    self.visible = 1
    self.properties = {}
    self.tiles = {}
end

--------------------------------------------------------------------------------
-- Returns the property.
-- @param key key.
-- @return value.
--------------------------------------------------------------------------------
function M:getProperty(key)
    return self.properties[key]
end

--------------------------------------------------------------------------------
-- Returns the gid of the specified position. <br>
-- If is out of range, return nil.
-- @param x potision of x.
-- @param y potision of y.
-- @return gid.
--------------------------------------------------------------------------------
function M:getGid(x, y)
    if not self:checkBounds(x, y) then
        return nil
    end
    return self.tiles[(y - 1) * self.width + x]
end

--------------------------------------------------------------------------------
-- Sets gid of the specified position. <br>
-- If you set the position is out of range to error.
-- @param x potision of x.
-- @param y potision of y.
-- @param gid global id.
--------------------------------------------------------------------------------
function M:setGid(x, y, gid)
    if not self:checkBounds(x, y) then
        error("index out of bounds!")
    end
    self.tiles[(y - 1) * self.width + x] = gid
end

--------------------------------------------------------------------------------
-- Tests whether the position is within the range specified.
-- @param x potision of x.
-- @param y potision of y.
-- @return True if in the range.
--------------------------------------------------------------------------------
function M:checkBounds(x, y)
    if x < 1 or self.width < x then
        return false
    end
    if y < 1 or self.height < y then
        return false
    end
    return true
end

return M