Sunlib = {}

-- linear interpolation formula
function lerp(a, b, t)
    return a + (b - a) * t
end
-- return sign of a value 
function sign(n)
	if n > 0 then
	    return 1 
	elseif n < 0 then
	    return -1 
	elseif n == 0 then 
	    return 0 
	end
end
-- return true if a is divisible by b with no remainder
function mod(a, b)
	if a/b == math.floor(a/b) then
		return true
	else 
		return false
	end
end
-- create new vector
function newVector(x, y)
	local vec = {
		x = x,
		y = y 
	}
	return vec
end
-- get position of the object on grid 
function getGridPosition(what, grid_size)
	local GRID = grid_size or 1
    return math.floor(what.x/GRID), math.floor(what.y/GRID)
end
-- move an object somewhere
function moveToPoint(start, goal, dt)
	local deltaX, deltaY = goal.x - start.x, goal.y - start.y 
	local dist = math.sqrt( deltaX*deltaX + deltaY*deltaY )
	local spd = dt 
	local moveX, moveY = spd*deltaX, spd*deltaY

	local newX = start.x + moveX
  	local newY = start.y + moveY 

  	start.x = newX 
  	start.y = newY
end

-- create an alarm that returns true when finishes counting
Alarm = {}

function Alarm:new(n)
	-- create new times
	local new = {}
	new.DEF_TIMER = n 
	new.timer = new.DEF_TIMER 
	setmetatable(new, {__index = Alarm})
	return new
end

function Alarm:isZero()
	-- return true when the timer reaches 0
	if self.timer == 0 then
		self.timer = self.DEF_TIMER 
		return true 
	end 
	self.timer = self.timer - 1
end

return Sunlib