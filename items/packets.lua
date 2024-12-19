SMODS.ConsumableType {
    object_type = "ConsumableType",
    key = 'Packet',
    collection_rows = { 5,5 },
    primary_colour = HEX("42c8f5"),
    secondary_colour = HEX("636363"),
    loc_txt = {
        collection = 'Card Packets',
        name = 'Packet',
        label = 'Packet',
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
    key = "Packet",
    atlas = "packet_atlas",
    pos = {
        x = 0,
        y = 0,
    }
}

--slimpickings
local slimpickings = SMODS.Consumable {
    set = "Packet",
    name = "draft-slimpickings",
    key = "slimpickings",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
    end,
}
--Pocket Change
local pocketchange = SMODS.Consumable {
    set = "Packet",
    name = "draft-pocketchange",
    key = "pocketchange",
    pos = {x = 2, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 2, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
    end,
}
-- loan
local loan = SMODS.Consumable {
    set = "Packet",
    name = "draft-loan",
    key = "loan",
    pos = {x = 3, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 3, amount = 8}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
    end,
}
--capitalinvestment
local capitalinvestment = SMODS.Consumable {
    set = "Packet",
    name = "draft-capitalinvestment",
    key = "capitalinvestment",
    pos = {x = 4, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 4, amount = 10}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
    end,
}
--suit up
local suitup = SMODS.Consumable {
    set = "Packet",
    name = "draft-suitup",
    key = "suitup",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        --local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('draft_create'))
        G.FUNCS.packet_effect(card, {onesuit=true})
    end,
}
--hackerman
local hackerman = SMODS.Consumable {
    set = "Packet",
    name = "draft-hackerman",
    key = "hackerman",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local hacker = {}
        for _, v in ipairs(SMODS.Rank.obj_buffer) do
            local r = SMODS.Ranks[v]
            if r.nominal <= 5 and 
            r.nominal >= 2 then table.insert(hacker, r) end
        end
        G.FUNCS.packet_effect(card, {ranks=hacker})
    end,
}
--middleoftheroad
local middleoftheroad = SMODS.Consumable {
    set = "Packet",
    name = "draft-middleoftheroad",
    key = "middleoftheroad",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local middle = {}
        for _, v in ipairs(SMODS.Rank.obj_buffer) do
            local r = SMODS.Ranks[v]
            if r.nominal <= 10 and 
            r.nominal >= 6 then table.insert(middle, r) end
        end
        G.FUNCS.packet_effect(card, {ranks=middle})
    end,
}
--Face-Off
local faceoff = SMODS.Consumable {
    set = "Packet",
    name = "draft-faceoff",
    key = "faceoff",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -1, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local faces = {}
        for _, v in ipairs(SMODS.Rank.obj_buffer) do
            local r = SMODS.Ranks[v]
            if r.face then table.insert(faces, r) end
        end
        G.FUNCS.packet_effect(card, {ranks=faces})
    end,
}
--aceinthehole
local aceinthehole = SMODS.Consumable {
    set = "Packet",
    name = "draft-aceinthehole",
    key = "aceinthehole",
    pos = {x = 1, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -1, amount = 2}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {ranks={SMODS.Ranks.Ace}, onerank=true})
    end,
}
--turkey
local turkey = SMODS.Consumable {
    set = "Packet",
    name = "draft-turkey",
    key = "turkey",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {onerank=true})
    end,
}
--even the odds
local eventheodds = SMODS.Consumable {
    set = "Packet",
    name = "draft-eventheodds",
    key = "eventheodds",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local evens = {}
        for _, v in ipairs(SMODS.Rank.obj_buffer) do
            local r = SMODS.Ranks[v]
            if (r.id <= 10 and 
            r.id >= 0 and
            r.id%2 == 0) then table.insert(evens, r) end
        end
        G.FUNCS.packet_effect(card, {ranks=evens})
    end,
}
--oddoneout
local oddoneout = SMODS.Consumable {
    set = "Packet",
    name = "draft-oddoneout",
    key = "oddoneout",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local odds = {}
        for _, v in ipairs(SMODS.Rank.obj_buffer) do
            local r = SMODS.Ranks[v]
            if ((r.id <= 10 and 
            r.id >= 0 and
            r.id%2 == 1) or
            (r.id == 14)) then table.insert(odds, r) end
        end
        G.FUNCS.packet_effect(card, {ranks=odds})
    end,
}
--straightaway
local straightaway = SMODS.Consumable {
    set = "Packet",
    name = "draft-straightaway",
    key = "straightaway",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {straight=true})
    end,
}
--plunger
local plunger = SMODS.Consumable {
    set = "Packet",
    name = "draft-plunger",
    key = "plunger",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {straight=true,onesuit=true})
    end,
}
--fullgambit
local fullgambit = SMODS.Consumable {
    set = "Packet",
    name = "draft-fullgambit",
    key = "fullgambit",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 3, amount = 13}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {straight=true})
    end,
}
--multiplexer
local multiplexer = SMODS.Consumable {
    set = "Packet",
    name = "draft-multiplexer",
    key = "multiplexer",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_mult}})
    end,
}
--bonusround
local bonusround = SMODS.Consumable {
    set = "Packet",
    name = "draft-bonusround",
    key = "bonusround",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_bonus}})
    end,
}
--steelworker
local steelworker = SMODS.Consumable {
    set = "Packet",
    name = "draft-steelworker",
    key = "steelworker",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_steel}})
    end,
}
--wildchild
local wildchild = SMODS.Consumable {
    set = "Packet",
    name = "draft-wildchild",
    key = "wildchild",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_wild}})
    end,
}
--fragile
local fragile = SMODS.Consumable {
    set = "Packet",
    name = "draft-fragile",
    key = "fragile",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_glass}})
    end,
}
--totallybaked
local totallybaked = SMODS.Consumable {
    set = "Packet",
    name = "draft-totallybaked",
    key = "totallybaked",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_stone}})
    end,
}
--devilsnumber
local devilsnumber = SMODS.Consumable {
    set = "Packet",
    name = "draft-devilsnumber",
    key = "devilsnumber",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -6, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {ranks={SMODS.Ranks["6"]}, onerank=true, enhancements={G.P_CENTERS.m_gold}})
    end,
}
--gamblersdream
local gamblersdream = SMODS.Consumable {
    set = "Packet",
    name = "draft-gamblersdream",
    key = "gamblersdream",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {ranks={SMODS.Ranks["7"]}, onerank=true, enhancements={G.P_CENTERS.m_lucky}})
    end,
}
--planetaryalignment
local planetaryalignment = SMODS.Consumable {
    set = "Packet",
    name = "draft-planetaryalignment",
    key = "planetaryalignment",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            func = function() 
                local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'ali')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                return true end}))
    end,
}
--tarotreading
local tarotreading = SMODS.Consumable {
    set = "Packet",
    name = "draft-tarotreading",
    key = "tarotreading",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            func = function() 
                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'ali')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                return true end}))
    end,
}
--justriffin
local justriffin = SMODS.Consumable {
    set = "Packet",
    name = "draft-justriffin",
    key = "justriffin",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'rif')
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
    end,
}
--spectralforce
local spectralforce = SMODS.Consumable {
    set = "Packet",
    name = "draft-spectralforce",
    key = "spectralforce",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            func = function() 
                local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                return true end}))
    end,
}
--myprecious
local myprecious = SMODS.Consumable {
    set = "Packet",
    name = "draft-myprecious",
    key = "myprecious",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 4, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special, card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        local _card = G.FUNCS.create_playing_card_in_deck({})
        _card:set_edition(poll_edition("aura", nil, true, true), true)
    end,
}
--sealthedeal
local sealthedeal = SMODS.Consumable {
    set = "Packet",
    name = "draft-sealthedeal",
    key = "sealthedeal",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 4, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        local _card = G.FUNCS.create_playing_card_in_deck({})
        _card:set_seal(SMODS.poll_seal({guaranteed = true}), true)
    end,
}
--chosenone
local chosenone = SMODS.Consumable {
    set = "Packet",
    name = "draft-chosenone",
    key = "chosenone",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -5, amount = 0, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        local _card = G.FUNCS.create_playing_card_in_deck({})
        _card:set_edition(poll_edition("aura", nil, true, true), true)
        _card:set_seal(SMODS.poll_seal({guaranteed = true}), true)
    end,
}
--[[Heavy Heart
local heavyheart = SMODS.Consumable {
    set = "Packet",
    name = "draft-heavyheart",
    key = "heavyheart",
    pos = {x = 0, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {SMODS.Suits["Hearts"]}, SMODS.Ranks, nil)
    end,
}]]