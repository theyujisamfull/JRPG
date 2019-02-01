
local Defeat = new 'state.base' {}

function Defeat:onEnter(battle)
	self.battle = battle;
    -- abstract method
end

function Defeat:onLeave()
    -- abstract method
end

function Defeat:onSuspend()
    -- abstract method
end

function Defeat:onResume()
    -- abstract method
end

function Defeat:onUpdate(dt)
    -- abstract method
end

return Defeat
