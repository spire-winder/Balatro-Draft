SMODS.ConsumableType {
    object_type = "ConsumableType",
    key = 'Clipper',
    collection_rows = { 2,2 },
    primary_colour = HEX("ababab"),
    secondary_colour = HEX("636363"),
    loc_txt = {
        collection = 'Card Clippers',
        name = 'Clipper',
        label = 'Clipper',
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            },
        },
    },
}

SMODS.UndiscoveredSprite {
    object_type = "UndiscoveredSprite",
    key = "Clipper",
    atlas = "clipper_atlas",
    pos = {
        x = 0,
        y = 1,
    }
}

--safetyscissors
local safetyscissors = SMODS.Consumable {
    set = "Clipper",
    name = "draft-safetyscissors",
    key = "safetyscissors",
    pos = {x = 0, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 2}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--embroideryscissors
local embroideryscissors = SMODS.Consumable {
    set = "Clipper",
    name = "draft-embroideryscissors",
    key = "embroideryscissors",
    pos = {x = 2, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 2, amount_random=1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected, card.ability.extra.amount_random} }
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected,
            amount_random=card.ability.extra.amount_random
        })
    end,
}

--chainsaw
local chainsaw = SMODS.Consumable {
    set = "Clipper",
    name = "draft-chainsaw",
    key = "chainsaw",
    pos = {x = 1, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_random=4}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_random} }
    end,
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_random=card.ability.extra.amount_random
        })
    end,
}

--cleaver
local cleaver = SMODS.Consumable {
    set = "Clipper",
    name = "draft-cleaver",
    key = "cleaver",
    pos = {x = 7, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3, max_rank = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected, card.ability.extra.max_rank} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.highlighted) do
            if not (value.base.nominal <= card.ability.extra.max_rank) then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--club
local club = SMODS.Consumable {
    set = "Clipper",
    name = "draft-club",
    key = "club",
    pos = {x = 3, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3, required_suit = "Clubs"}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.highlighted) do
            if not value:is_suit(card.ability.extra.required_suit) then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--spade
local spade = SMODS.Consumable {
    set = "Clipper",
    name = "draft-spade",
    key = "spade",
    pos = {x = 4, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3, required_suit = "Spades"}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.highlighted) do
            if not value:is_suit(card.ability.extra.required_suit) then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--diamond cutter
local diamondcutter = SMODS.Consumable {
    set = "Clipper",
    name = "draft-diamondcutter",
    key = "diamondcutter",
    pos = {x = 5, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3, required_suit = "Diamonds"}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.highlighted) do
            if not value:is_suit(card.ability.extra.required_suit) then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--scalpel
local scalpel = SMODS.Consumable {
    set = "Clipper",
    name = "draft-scalpel",
    key = "scalpel",
    pos = {x = 6, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3, required_suit = "Hearts"}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.highlighted) do
            if not value:is_suit(card.ability.extra.required_suit) then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--axe
local axe = SMODS.Consumable {
    set = "Clipper",
    name = "draft-axe",
    key = "axe",
    pos = {x = 8, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.highlighted) do
            if not value:is_face() then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--scythe
local scythe = SMODS.Consumable {
    set = "Clipper",
    name = "draft-scythe",
    key = "scythe",
    pos = {x = 9, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, max_rank = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.max_rank} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.cards) do
            if (value.base.nominal <= card.ability.extra.max_rank) then
                return true
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            all_below=card.ability.extra.max_rank
        })
    end,
}

--pizza cutter
local pizzacutter = SMODS.Consumable {
    set = "Clipper",
    name = "draft-pizzacutter",
    key = "pizzacutter",
    pos = {x = 1, y = 1},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_random=3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_random} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.cards) do
            if not (value:is_face()) then
                return true
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_random=card.ability.extra.amount_random,
            no_face=true
        })
    end,
}

--sharktooth
local sharktooth = SMODS.Consumable {
    set = "Clipper",
    name = "draft-sharktooth",
    key = "sharktooth",
    pos = {x = 2, y = 1},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_random_min=2, amount_random_max=5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_random_min, card.ability.extra.amount_random_max} }
    end,
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_random=pseudorandom('sharktooth', card.ability.extra.amount_random_min, card.ability.extra.amount_random_max)
        })
    end,
}

--sword
local sword = SMODS.Consumable {
    set = "Clipper",
    name = "draft-sword",
    key = "sword",
    pos = {x = 4, y = 1},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_random=4}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_random} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.cards) do
            if (value:is_face()) then
                return true
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_random=card.ability.extra.amount_random,
            no_face=true
        })
    end,
}

--lasercutter
local lasercutter = SMODS.Consumable {
    set = "Clipper",
    name = "draft-lasercutter",
    key = "lasercutter",
    pos = {x = 5, y = 1},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 then return false end
        local target_rank = G.hand.highlighted[1].base.nominal
        for key, value in pairs(G.hand.highlighted) do
            if not (value.base.nominal == target_rank) then
                return false
            end
        end
        return #G.hand.highlighted <= card.ability.extra.amount_selected
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected
        })
    end,
}

--guillotine
local guillotine = SMODS.Consumable {
    set = "Clipper",
    name = "draft-guillotine",
    key = "guillotine",
    pos = {x = 6, y = 1},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost)} }
    end,
    can_use = function(self, card)
        for key, value in pairs(G.hand.cards) do
            if (value:is_face()) then
                return true
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            all_face=true
        })
    end,
}

--butterknife
local butterknife = SMODS.Consumable {
    set = "Clipper",
    name = "draft-butterknife",
    key = "butterknife",
    pos = {x = 7, y = 1},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 1, amount_random=2}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected, card.ability.extra.amount_random} }
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= card.ability.extra.amount_selected and #G.hand.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            amount_selected=card.ability.extra.amount_selected,
            amount_random=card.ability.extra.amount_random
        })
    end,
}

if Draft.config.soul_cards then
--atroposshears
SMODS.Consumable {
	set = "Spectral",
	name = "draft-atroposshears",
	key = "atroposshears",
	pos = { x = 3, y = 1 },
	hidden = true,
    cost=5,
	soul_set = "Clipper",
	order = 21,
    config = {extra = {cost = 0}},
	atlas = "clipper_atlas",
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost)} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {
            all_selected=true
        })
    end,
}
end