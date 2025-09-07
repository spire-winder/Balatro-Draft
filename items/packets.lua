SMODS.ConsumableType {
    object_type = "ConsumableType",
    key = 'Packet',
    collection_rows = { 5,5 },
    primary_colour = HEX("d7ba89"),
    secondary_colour = HEX("56342a"),
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

--skipcoupon
local skipcoupon = SMODS.Consumable {
    set = "Packet",
    name = "draft-skipcoupon",
    key = "skipcoupon",
    pos = {x = 4, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 0}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount } }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {nocards = true})
    end,
}
--slimpickings
local slimpickings = SMODS.Consumable {
    set = "Packet",
    name = "draft-slimpickings",
    key = "slimpickings",
    pos = {x = 0, y = 1},
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
        G.FUNCS.packet_effect(card, {})
    end,
}
--ol' reliable
local olreliable = SMODS.Consumable {
    set = "Packet",
    name = "draft-olreliable",
    key = "olreliable",
    pos = {x = 2, y = 0},
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
    config = {extra = {cost = 1, amount = 8}},
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
    config = {extra = {cost = 2, amount = 10}},
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
--pocketaces
local pocketaces = SMODS.Consumable {
    set = "Packet",
    name = "draft-pocketaces",
    key = "pocketaces",
    pos = {x = 1, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 2}},
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
--hackerman
local hackerman = SMODS.Consumable {
    set = "Packet",
    name = "draft-hackerman",
    key = "hackerman",
    pos = {x = 6, y = 0},
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
    pos = {x = 7, y = 0},
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
    pos = {x = 8, y = 0},
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
--Love Triangle
local lovetriangle = SMODS.Consumable {
    set = "Packet",
    name = "draft-lovetriangle",
    key = "lovetriangle",
    pos = {x = 8, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -1, amount = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {
            balanced=true,
            ranks=G.FUNCS.face_ranks()
        })
    end,
}
--turkey
local turkey = SMODS.Consumable {
    set = "Packet",
    name = "draft-turkey",
    key = "turkey",
    pos = {x = 4, y = 1},
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
        G.FUNCS.packet_effect(card, {onerank=true})
    end,
}
--even the odds
local eventheodds = SMODS.Consumable {
    set = "Packet",
    name = "draft-eventheodds",
    key = "eventheodds",
    pos = {x = 5, y = 1},
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
    pos = {x = 6, y = 1},
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
--perfectcurve
local perfectcurve = SMODS.Consumable {
    set = "Packet",
    name = "draft-perfectcurve",
    key = "perfectcurve",
    pos = {x = 5, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {
            balanced=true,
            ranks={SMODS.Ranks["Ace"], SMODS.Ranks["2"], SMODS.Ranks["3"], SMODS.Ranks["5"], SMODS.Ranks["8"]}
        })
    end,
}
--notaddingup
local notaddingup = SMODS.Consumable {
    set = "Packet",
    name = "draft-notaddingup",
    key = "notaddingup",
    pos = {x = 6, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {
            balanced=true,
            ranks={SMODS.Ranks["4"], SMODS.Ranks["6"], SMODS.Ranks["7"], SMODS.Ranks["9"], SMODS.Ranks["10"]}
        })
    end,
}
--abandonallhope
local abandonallhope = SMODS.Consumable {
    set = "Packet",
    name = "draft-abandonallhope",
    key = "abandonallhope",
    pos = {x = 7, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 2, amount = 0, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            if not value.face then
                local possibilities = {}
                for key, val in pairs(G.P_CARDS) do
                    if val.value == value.key then
                        table.insert(possibilities, val)
                    end
                end
                create_playing_card({
                    front = pseudorandom_element(possibilities, pseudoseed('abandonallhope')),
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Packet })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
    end,
}
--straightaway
local straightaway = SMODS.Consumable {
    set = "Packet",
    name = "draft-straightaway",
    key = "straightaway",
    pos = {x = 1, y = 1},
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
        G.FUNCS.packet_effect(card, {straight=true})
    end,
}
--stairwaytoheaven
local stairwaytoheaven = SMODS.Consumable {
    set = "Packet",
    name = "draft-stairwaytoheaven",
    key = "stairwaytoheaven",
    pos = {x = 3, y = 1},
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
--tradesecrets
local tradesecrets = SMODS.Consumable {
    set = "Packet",
    name = "draft-tradesecrets",
    key = "tradesecrets",
    pos = {x = 8, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 2, amount = 10, amount_remove = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_remove, card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_deck = {}
        for k, v in ipairs(G.deck.cards) do temp_deck[#temp_deck+1] = v end
        table.sort(temp_deck, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
        pseudoshuffle(temp_deck, pseudoseed('draft_tradesecrets'))

        for i = 1, card.ability.extra.amount_remove do destroyed_cards[#destroyed_cards+1] = temp_deck[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i=#destroyed_cards, 1, -1 do
                    local card = destroyed_cards[i]
                    if card.ability.name == 'Glass Card' then
                        card:shatter()
                    else
                        card:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true end }))
        delay(0.5)
        G.FUNCS.packet_effect(card, {})
    end,
	in_pool = function(self, args) return G.deck and #G.deck.cards >= self.config.extra.amount_remove end
}
--revolution
local revolution = SMODS.Consumable {
    set = "Packet",
    name = "draft-revolution",
    key = "revolution",
    pos = {x = 9, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 1, amount = 5, amount_remove = 3}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_remove, card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_deck = {}
        for k, v in ipairs(G.deck.cards) do
            if v:is_face() then temp_deck[#temp_deck+1] = v end
        end
        table.sort(temp_deck, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
        pseudoshuffle(temp_deck, pseudoseed('draft_revolution'))

        for i = 1, card.ability.extra.amount_remove do destroyed_cards[#destroyed_cards+1] = temp_deck[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i=#destroyed_cards, 1, -1 do
                    local card = destroyed_cards[i]
                    if card.ability.name == 'Glass Card' then
                        card:shatter()
                    else
                        card:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true end }))
        delay(0.5)
        G.FUNCS.packet_effect(card, {})
    end,
	in_pool = function(self, args)
        if not G.deck then
            return false
        end
        local temp_deck = {}
        for k, v in ipairs(G.deck.cards) do
            if v:is_face() then temp_deck[#temp_deck+1] = v end
        end
        return #temp_deck >= self.config.extra.amount_remove
    end
}
--suit up
local suitup = SMODS.Consumable {
    set = "Packet",
    name = "draft-suitup",
    key = "suitup",
    pos = {x = 5, y = 0},
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
        G.FUNCS.packet_effect(card, {onesuit=true})
    end,
}
--plunger
local plunger = SMODS.Consumable {
    set = "Packet",
    name = "draft-plunger",
    key = "plunger",
    pos = {x = 2, y = 1},
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
--Heavy Heart
local heavyheart = SMODS.Consumable {
    set = "Packet",
    name = "draft-heavyheart",
    key = "heavyheart",
    pos = {x = 11, y = 0},
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
        G.FUNCS.packet_effect(card, {suits={SMODS.Suits["Hearts"]}})
    end,
}
--in the rough
local diamondsareforever = SMODS.Consumable {
    set = "Packet",
    name = "draft-diamondsareforever",
    key = "diamondsareforever",
    pos = {x = 12, y = 0},
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
        G.FUNCS.packet_effect(card, {suits={SMODS.Suits["Diamonds"]}})
    end,
}
--Hit the club
local hittheclub = SMODS.Consumable {
    set = "Packet",
    name = "draft-hittheclub",
    key = "hittheclub",
    pos = {x = 13, y = 0},
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
        G.FUNCS.packet_effect(card, {suits={SMODS.Suits["Clubs"]}})
    end,
}
--In spades
local inspades = SMODS.Consumable {
    set = "Packet",
    name = "draft-inspades",
    key = "inspades",
    pos = {x = 14, y = 0},
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
        G.FUNCS.packet_effect(card, {suits={SMODS.Suits["Spades"]}})
    end,
}
--copycat
local copycat = SMODS.Consumable {
    set = "Packet",
    name = "draft-copycat",
    key = "copycat",
    pos = {x = 6, y = 2},
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
        G.FUNCS.packet_effect(card, {ranks=G.FUNCS.popular_rank(),onerank=true})
    end,
}
--alternative
local alternative = SMODS.Consumable {
    set = "Packet",
    name = "draft-alternative",
    key = "alternative",
    pos = {x = 7, y = 2},
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
        G.FUNCS.packet_effect(card, {ranks=G.FUNCS.not_popular_rank()})
    end,
}
--bandwagon
local bandwagon = SMODS.Consumable {
    set = "Packet",
    name = "draft-bandwagon",
    key = "bandwagon",
    pos = {x = 5, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -1, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {suits=G.FUNCS.popular_suit(),onesuit=true})
    end,
}
--roadnottaken
local roadnottaken = SMODS.Consumable {
    set = "Packet",
    name = "draft-roadnottaken",
    key = "roadnottaken",
    pos = {x = 9, y = 2},
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
        G.FUNCS.packet_effect(card, {suits=G.FUNCS.not_popular_suit()})
    end,
}
--anything goes
local anythinggoes = SMODS.Consumable {
    set = "Packet",
    name = "draft-anythinggoes",
    key = "anythinggoes",
    pos = {x = 15, y = 0},
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
        G.FUNCS.packet_effect(card, {enhancements=G.P_CENTER_POOLS["Enhanced"]})
    end,
}
--bonusround
local bonusround = SMODS.Consumable {
    set = "Packet",
    name = "draft-bonusround",
    key = "bonusround",
    pos = {x = 9, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -3, amount = 5}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_bonus}})
    end,
}
--multiplexer
local multiplexer = SMODS.Consumable {
    set = "Packet",
    name = "draft-multiplexer",
    key = "multiplexer",
    pos = {x = 10, y = 0},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -3, amount = 5}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_mult}})
    end,
}
--wildchild
local wildchild = SMODS.Consumable {
    set = "Packet",
    name = "draft-wildchild",
    key = "wildchild",
    pos = {x = 11, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
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
    pos = {x = 8, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_glass}})
    end,
}
--steelworker
local steelworker = SMODS.Consumable {
    set = "Packet",
    name = "draft-steelworker",
    key = "steelworker",
    pos = {x = 9, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {enhancements={G.P_CENTERS.m_steel}})
    end,
}
--totallybaked
local totallybaked = SMODS.Consumable {
    set = "Packet",
    name = "draft-totallybaked",
    key = "totallybaked",
    pos = {x = 7, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
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
    pos = {x = 10, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -3, amount = 2, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special, card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.amount_special, 1 do
            G.FUNCS.create_playing_card_in_deck_alt({ranks={SMODS.Ranks["6"]}, enhancements={G.P_CENTERS.m_gold}})
        end
        G.FUNCS.packet_effect(card, {ranks={SMODS.Ranks["6"]}, onerank=true})
    end,
}
--gamblersdream
local gamblersdream = SMODS.Consumable {
    set = "Packet",
    name = "draft-gamblersdream",
    key = "gamblersdream",
    pos = {x = 12, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -3, amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {ranks={SMODS.Ranks["7"]}, onerank=true, enhancements={G.P_CENTERS.m_lucky}})
    end,
}
--tarotreading
local tarotreading = SMODS.Consumable {
    set = "Packet",
    name = "draft-tarotreading",
    key = "tarotreading",
    pos = {x = 14, y = 1},
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
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'ali')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                return true end}))
    end,
}
--planetaryalignment
local planetaryalignment = SMODS.Consumable {
    set = "Packet",
    name = "draft-planetaryalignment",
    key = "planetaryalignment",
    pos = {x = 13, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 5}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_draft_miniortag" }
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        add_tag(Tag('tag_draft_miniortag'))
    end,
}
--spectralforce
local spectralforce = SMODS.Consumable {
    set = "Packet",
    name = "draft-spectralforce",
    key = "spectralforce",
    pos = {x = 15, y = 1},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                return true end}))
    end,
}
--keepemcoming
local keepemcoming = SMODS.Consumable {
    set = "Packet",
    name = "draft-keepemcoming",
    key = "keepemcoming",
    pos = {x = 10, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 2, amount = 5}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_draft_drafttag" }
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        add_tag(Tag('tag_draft_drafttag'))
    end,
}
--justriffin
local justriffin = SMODS.Consumable {
    set = "Packet",
    name = "draft-justriffin",
    key = "justriffin",
    pos = {x = 0, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -4, amount = 5}},
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
--menatwork
local menatwork = SMODS.Consumable {
    set = "Packet",
    name = "draft-menatwork",
    key = "menatwork",
    pos = {x = 2, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -2, amount = 20}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_blueprint
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_blueprint.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.packet_effect(card, {})
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_blueprint")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
    end,
}
--thewholeshebang
local thewholeshebang = SMODS.Consumable {
    set = "Packet",
    name = "draft-thewholeshebang",
    key = "thewholeshebang",
    pos = {x = 3, y = 3},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 20, amount = 0, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local cards = {}
        local suitset = {}
        for key, value in pairs(G.FUNCS.filter_suits({block_exotic = true})) do
            suitset[value.key] = true
        end
        for key, value in pairs(G.P_CARDS) do
            if suitset[value.suit] ~= nil then
            create_playing_card({
                front = value,
                center = G.P_CENTERS.c_base
                }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Packet })
            end
            cards[#cards + 1] = true
        end
        playing_card_joker_effects(cards)
        G.FUNCS.packet_effect(card, {nocards=true})
    end,
}
--wheelofdestiny
local wheelofdestiny = SMODS.Consumable {
    set = "Packet",
    name = "draft-wheelofdestiny",
    key = "wheelofdestiny",
    pos = {x = 4, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -1, amount = 5, amount_special = 1, odds = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), "" .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds , card.ability.extra.amount_special, card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local used_consumable = copier or card
        if pseudorandom("wheelofdestiny") < G.GAME.probabilities.normal / card.ability.extra.odds then
            for i = 1, card.ability.extra.amount_special, 1 do
                local _card = G.FUNCS.create_playing_card_in_deck_alt({})
                _card:set_edition(poll_edition("aura", nil, true, true), true)
                _card:set_seal(SMODS.poll_seal({guaranteed = true}), true)
            end
            G.FUNCS.packet_effect(card, {nocards=true})
        else
            G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function() --"borrowed" from Wheel Of Fortune
					attention_text({
						text = localize("k_nope_ex"),
						scale = 1.3,
						hold = 1.4,
						major = used_consumable,
						backdrop_colour = G.C.SECONDARY_SET.Planet,
						align = (
							G.STATE == G.STATES.TAROT_PACK
							or G.STATE == G.STATES.SPECTRAL_PACK
							or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
						)
								and "tm"
							or "cm",
						offset = {
							x = 0,
							y = (
								G.STATE == G.STATES.TAROT_PACK
								or G.STATE == G.STATES.SPECTRAL_PACK
								or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
							)
									and -0.2
								or 0,
						},
						silent = true,
					})
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound("tarot2", 0.76, 0.4)
							return true
						end,
					}))
					play_sound("tarot2", 1, 0.4)
					used_consumable:juice_up(0.3, 0.5)
					return true
				end,
			}))
            G.FUNCS.packet_effect(card, {})
        end
    end,
}
--myprecious
local myprecious = SMODS.Consumable {
    set = "Packet",
    name = "draft-myprecious",
    key = "myprecious",
    pos = {x = 1, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -3, amount = 4, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.amount_special, 1 do
            local _card = G.FUNCS.create_playing_card_in_deck_alt({})
            _card:set_edition(poll_edition("aura", nil, true, true), true)
        end
        G.FUNCS.packet_effect(card, {})
    end,
}
--sealthedeal
local sealthedeal = SMODS.Consumable {
    set = "Packet",
    name = "draft-sealthedeal",
    key = "sealthedeal",
    pos = {x = 2, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -3, amount = 4, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.amount_special, 1 do
            local _card = G.FUNCS.create_playing_card_in_deck_alt({})
            _card:set_seal(SMODS.poll_seal({guaranteed = true}), true)
        end
        G.FUNCS.packet_effect(card, {})
    end,
}
--chosenone
local chosenone = SMODS.Consumable {
    set = "Packet",
    name = "draft-chosenone",
    key = "chosenone",
    pos = {x = 3, y = 2},
    atlas = 'packet_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = -6, amount = 0, amount_special = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.amount_special, 1 do
            local _card = G.FUNCS.create_playing_card_in_deck_alt({})
            _card:set_edition(poll_edition("aura", nil, true, true), true)
            _card:set_seal(SMODS.poll_seal({guaranteed = true}), true)
        end
        G.FUNCS.packet_effect(card, {nocards=true})
    end,
}
if Draft.config.soul_cards then
--boon
SMODS.Consumable {
	set = "Spectral",
	name = "draft-boon",
	key = "boon",
	pos = { x = 0, y = 3 },
	soul_pos = { x = 1, y = 3 },
	hidden = true,
    cost=5,
	soul_set = "Packet",
	order = 21,
    config = {extra = {cost = -5, amount = 0, amount_special = 5}},
	atlas = "packet_atlas",
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, card)
        --if card then
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_special} }
        --else
        --    return { vars = {G.FUNCS.format_cost(self.config.extra.cost), self.config.extra.amount_special} }
        --end
	end,
	use = function(self, card, area, copier)
        for i = 1, card.ability.extra.amount_special, 1 do
            local _card = G.FUNCS.create_playing_card_in_deck_alt({})
            _card:set_edition(poll_edition("aura", nil, true, true), true)
            _card:set_seal(SMODS.poll_seal({guaranteed = true}), true)
        end
        G.FUNCS.packet_effect(card, {nocards=true})
	end,
}
end

local PacketPositive = SMODS.ObjectType {
    key="PacketPositive",
    default = "c_draft_loan",
    cards={
        ["c_draft_loan"] = true,
        ["c_draft_capitalinvestment"] = true,
        ["c_draft_stairwaytoheaven"] = true,
        ["c_draft_alternative"] = true,
        ["c_draft_roadnottaken"] = true,
        ["c_draft_thewholeshebang"] = true,
        ["c_draft_keepemcoming"] = true,
        ["c_draft_abandonallhope"] = true,
        ["c_draft_tradesecrets"] = true,
        ["c_draft_revolution"] = true,
    }
}

local PacketNeutral = SMODS.ObjectType {
    key="PacketNeutral",
    default = "c_draft_olreliable",
    cards={
        ["c_draft_olreliable"] = true,
        ["c_draft_suitup"] = true,
        ["c_draft_hackerman"] = true,
        ["c_draft_middleoftheroad"] = true,
        ["c_draft_eventheodds"] = true,
        ["c_draft_oddoneout"] = true,
        ["c_draft_straightaway"] = true,
        ["c_draft_plunger"] = true,
        ["c_draft_heavyheart"] = true,
        ["c_draft_diamondsareforever"] = true,
        ["c_draft_hittheclub"] = true,
        ["c_draft_inspades"] = true,
        ["c_draft_perfectcurve"] = true,
        ["c_draft_notaddingup"] = true,
        ["c_draft_beinclover"] = true,
        ["c_draft_rainbow"] = true,
    }
}

local PacketNegative = SMODS.ObjectType {
    key="PacketNegative",
    default = "c_draft_skipcoupon",
    cards={
        ["c_draft_skipcoupon"] = true,
        ["c_draft_slimpickings"] = true,
        ["c_draft_faceoff"] = true,
        ["c_draft_pocketaces"] = true,
        ["c_draft_turkey"] = true,
        ["c_draft_lovetriangle"] = true,
        ["c_draft_copycat"] = true,
        ["c_draft_bandwagon"] = true,
        ["c_draft_anythinggoes"] = true,
        ["c_draft_multiplexer"] = true,
        ["c_draft_bonusround"] = true,
        ["c_draft_steelworker"] = true,
        ["c_draft_wildchild"] = true,
        ["c_draft_fragile"] = true,
        ["c_draft_totallybaked"] = true,
        ["c_draft_devilsnumber"] = true,
        ["c_draft_gamblersdream"] = true,
        ["c_draft_planetaryalignment"] = true,
        ["c_draft_tarotreading"] = true,
        ["c_draft_spectralforce"] = true,
        ["c_draft_justriffin"] = true,
        ["c_draft_wheelofdestiny"] = true,
        ["c_draft_menatwork"] = true,
        ["c_draft_myprecious"] = true,
        ["c_draft_sealthedeal"] = true,
        ["c_draft_chosenone"] = true,
        ["c_draft_thegathering"] = true,
        ["c_draft_codemonkey"] = true,
        ["c_draft_polytheism"] = true,
        ["c_draft_bridgethegap"] = true,
        ["c_draft_fleuronfighters"] = true,
        ["c_draft_halberdsninek"] = true,
    }
}

if MagicTheJokering then
    --beinclover
    if MagicTheJokering.config.include_clover_suit then
    local beinclover = SMODS.Consumable {
        set = "Packet",
        name = "draft-beinclover",
        key = "beinclover",
        pos = {x = 0, y = 0},
        atlas = 'cross_mod_packet_atlas',
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
            G.FUNCS.packet_effect(card, {suits={SMODS.Suits["mtg_Clovers"]}})
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_mtj'), MagicTheJokering.badge_colour, MagicTheJokering.badge_text_colour, 1 )
        end,
    }
    end
    --thegathering
    local thegathering = SMODS.Consumable {
        set = "Packet",
        name = "draft-thegathering",
        key = "thegathering",
        pos = {x = 0, y = 1},
        atlas = 'cross_mod_packet_atlas',
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
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                        local card = create_card('Magic',G.consumeables, nil, nil, nil, nil, nil, 'gather')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                    return true end}))
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_mtj'), MagicTheJokering.badge_colour, MagicTheJokering.badge_text_colour, 1 )
        end,
    }
end

if Cryptid then
    --codemonkey
    local codemonkey = SMODS.Consumable {
        set = "Packet",
        name = "draft-codemonkey",
        key = "codemonkey",
        pos = {x = 1, y = 0},
        atlas = 'cross_mod_packet_atlas',
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
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                        local card = create_card('Code',G.consumeables, nil, nil, nil, nil, nil, 'monk')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                    return true end}))
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_cryptid'), HEX('708b91'), G.C.WHITE, 1 )
        end,
    }
end

if BUNCOMOD then
    --fleuronfighters
    local fleuronfighters = SMODS.Consumable {
        set = "Packet",
        name = "draft-fleuronfighters",
        key = "fleuronfighters",
        pos = {x = 2, y = 0},
        atlas = 'cross_mod_packet_atlas',
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
            enable_exotics()
            G.FUNCS.packet_effect(card, {suits={SMODS.Suits["bunc_Fleurons"]}})
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_bunco'), HEX('666665'), G.C.WHITE, 1 )
        end,
    }
    --halberdsninek
    local halberdsninek = SMODS.Consumable {
        set = "Packet",
        name = "draft-halberdsninek",
        key = "halberdsninek",
        pos = {x = 2, y = 1},
        atlas = 'cross_mod_packet_atlas',
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
            enable_exotics()
            G.FUNCS.packet_effect(card, {suits={SMODS.Suits["bunc_Halberds"]}})
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_bunco'), HEX('666665'), G.C.WHITE, 1 )
        end,
    }
    --polytheism
    local polytheism = SMODS.Consumable {
        set = "Packet",
        name = "draft-polytheism",
        key = "polytheism",
        pos = {x = 2, y = 3},
        atlas = 'cross_mod_packet_atlas',
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
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                        local card = create_card('Polymino',G.consumeables, nil, nil, nil, nil, nil, 'gather')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                    return true end}))
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_bunco'), HEX('666665'), G.C.WHITE, 1 )
        end,
    }
    --bridgethegap
    local bridgethegap = SMODS.Consumable {
        set = "Packet",
        name = "draft-bridgethegap",
        key = "bridgethegap",
        pos = {x = 2, y = 4},
        atlas = 'cross_mod_packet_atlas',
        cost = 0,
        order = 1,
        config = {extra = {cost = -2, amount = 4}},
        loc_vars = function(self, info_queue, card)
            return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
        end,
        can_use = function(self, card)
            return true
        end,
        use = function(self, card, area, copier)
            G.FUNCS.packet_effect(card, {link=true})
        end,
        set_badges = function(self, card, badges)
            badges[#badges+1] = create_badge(localize('k_bunco'), HEX('666665'), G.C.WHITE, 1 )
        end,
    }
end

Draft.suitmods = {
    "Bunco",
    "magic_the_jokering",
    "MintysSillyMod",
    "paperback",
    "SixSuits",
    "InkAndColor",
    "MusicalSuit",
    "rcbalatro",
    "sigil",
    "Wzone",
    nil, --Stop ipairs from counting past here
    count = 0,
    id = "",
    badge = "None"
}

Draft.suitmod = function()
    Draft.suitmods.count = 0
    for _, v in ipairs(Draft.suitmods) do
        if (SMODS.Mods[v] or {}).can_load then
            Draft.suitmods.count = Draft.suitmods.count + 1
            if Draft.suitmods.count == 1 then Draft.suitmods.id = v end
            if Draft.suitmods.count == 2 then Draft.suitmods.id = "multisuitmods" break end
        end
    end
    return Draft.suitmods.count > 0
end

if Draft.suitmod() then
    --rainbow
    local rainbow = SMODS.Consumable {
        set = "Packet",
        name = "draft-rainbow",
        key = "rainbow",
        pos = {x = 2, y = 2},
        atlas = 'cross_mod_packet_atlas',
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
            enable_exotics()
            G.FUNCS.packet_effect(card, {one_per_suit=true,allow_hidden=true})
        end,
        set_badges = function(self, card, badges)
            if Draft.suitmods.badge == "None" or Draft.suitmods.badge == "ERROR" then --Localization doesn't exist yet on initial loading, so double-check this 
                if Draft.suitmods.id == "multisuitmods" then
                    Draft.suitmods.badge = localize('k_multisuitmods')
                else
                    Draft.suitmods.badge = SMODS.Mods[Draft.suitmods.id].display_name
                end
            end
            badges[#badges+1] = create_badge(Draft.suitmods.badge, HEX('666665'), G.C.WHITE, 1 )
        end,
    }
end