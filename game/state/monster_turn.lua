
local Monster_turn = new 'state.base' {}

function Monster_turn:onEnter(battle)
    self.battle = battle
    self.targets = { unpack(self.battle[self.battle.PARTIES[self.battle.current_party%2+1]].characters) }
    math.randomseed(os.time())
    local target = math.random(#self.targets)
    --self.targets.chosen = self.targets[target]
    self.battle:setNextAction('attack', { target = self.targets[target] })
    self.stack:pop()
    --self.stack:push('execute_action', self.battle, self.battle.next_action)
end

return Monster_turn
