if unstb_global then
    SMODS.Joker:take_ownership('hack', {
        loc_vars = function(self, info_queue, card)
            
            local key = self.key
            if getPoolRankFlagEnable('unstb_0') or getPoolRankFlagEnable('unstb_1') then
                key = self.key..'_ex'
            end

            if card then
                return { key = key, vars = {card.ability.extra} }
            else
                return { key = key, vars = {self.config.extra} }
            end
        end
    }, true)
end

if (SMODS.Mods["Bunco"] or {}).can_load then
    SMODS.Suit:take_ownership('bunc_Fleurons', { exotic = true }, true)
    SMODS.Suit:take_ownership('bunc_Halberds', { exotic = true }, true)
end