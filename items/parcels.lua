SMODS.ConsumableType {
    object_type = "ConsumableType",
    key = 'Parcel',
    collection_rows = { 4,4 },
    primary_colour = HEX("d78989"),
    secondary_colour = HEX("562a2a"),
    loc_txt = {
        collection = 'Card Parcels',
        name = 'Parcel',
        label = 'Parcel',
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
    key = "Parcel",
    atlas = "parcel_atlas",
    pos = {
        x = 0,
        y = 0,
    }
}

--betterredthandead
local betterredthandead = SMODS.Consumable {
    set = "Parcel",
    name = "draft-betterredthandead",
    key = "betterredthandead",
    pos = {x = 1, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        local amount = 0
        local amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                amount = amount + card.ability.extra.base_amount / 2
            end
            if value.suit == "Diamonds" then
                amount_1 = amount_1 + card.ability.extra.base_amount / 2
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount, amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            suits={SMODS.Suits["Hearts"],SMODS.Suits["Diamonds"]}
        })
    end,
}
--thedarkside
local thedarkside = SMODS.Consumable {
    set = "Parcel",
    name = "draft-thedarkside",
    key = "thedarkside",
    pos = {x = 2, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        local amount = 0
        local amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Clubs" then
                amount = amount + card.ability.extra.base_amount / 2
            end
            if value.suit == "Spades" then
                amount_1 = amount_1 + card.ability.extra.base_amount / 2
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount, amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            suits={SMODS.Suits["Spades"],SMODS.Suits["Clubs"]}
        })
    end,
}
--checkered
local checkered = SMODS.Consumable {
    set = "Parcel",
    name = "draft-checkered",
    key = "checkered",
    pos = {x = 1, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        local amount = 0
        local amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                amount = amount + card.ability.extra.base_amount / 2
            end
            if value.suit == "Spades" then
                amount_1 = amount_1 + card.ability.extra.base_amount / 2
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount, amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            suits={SMODS.Suits["Hearts"],SMODS.Suits["Spades"]}
        })
    end,
}
--chessboard
local chessboard = SMODS.Consumable {
    set = "Parcel",
    name = "draft-chessboard",
    key = "chessboard",
    pos = {x = 2, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        local amount = 0
        local amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Diamonds" then
                amount = amount + card.ability.extra.base_amount / 2
            end
            if value.suit == "Clubs" then
                amount_1 = amount_1 + card.ability.extra.base_amount / 2
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount, amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            suits={SMODS.Suits["Clubs"],SMODS.Suits["Diamonds"]}
        })
    end,
}
--bloodandiron
local bloodandiron = SMODS.Consumable {
    set = "Parcel",
    name = "draft-bloodandiron",
    key = "bloodandiron",
    pos = {x = 3, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        local amount = 0
        local amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                amount = amount + card.ability.extra.base_amount / 2
            end
            if value.suit == "Clubs" then
                amount_1 = amount_1 + card.ability.extra.base_amount / 2
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount, amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            suits={SMODS.Suits["Hearts"],SMODS.Suits["Clubs"]}
        })
    end,
}
--digginanddrillin
local digginanddrillin = SMODS.Consumable {
    set = "Parcel",
    name = "draft-digginanddrillin",
    key = "digginanddrillin",
    pos = {x = 4, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        local amount = 0
        local amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Diamonds" then
                amount = amount + card.ability.extra.base_amount / 2
            end
            if value.suit == "Spades" then
                amount_1 = amount_1 + card.ability.extra.base_amount / 2
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount, amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            suits={SMODS.Suits["Spades"],SMODS.Suits["Diamonds"]}
        })
    end,
}
--have all the aces
local havealltheaces = SMODS.Consumable {
    set = "Parcel",
    name = "draft-havealltheaces",
    key = "havealltheaces",
    pos = {x = 10, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, ace_num = 6, else_num = 2}},
    loc_vars = function(self, info_queue, card)
		local amount_ace = 0
        local amount_else = 0
        for key, value in pairs(SMODS.Ranks) do
            if value == SMODS.Ranks["Ace"] then
                amount_ace = amount_ace + card.ability.extra.ace_num
            elseif value ~= SMODS.Ranks["Ace"] then
                amount_else = amount_else + card.ability.extra.else_num
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount_ace, amount_else} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.else_num,
            special_ranks={SMODS.Ranks["Ace"]},
            special_amount=card.ability.extra.ace_num
        })
    end,
}
--facethemusic
local facethemusic = SMODS.Consumable {
    set = "Parcel",
    name = "draft-facethemusic",
    key = "facethemusic",
    pos = {x = 5, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, num_face = 4, num_rest = 2}},
    loc_vars = function(self, info_queue, card)
        local amount_face = 0
        local amount_else = 0
        for key, value in pairs(SMODS.Ranks) do
            if value.face then
                amount_face = amount_face + card.ability.extra.num_face
            elseif value ~= SMODS.Ranks["Ace"] then
                amount_else = amount_else + card.ability.extra.num_rest
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount_face, amount_else} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.num_rest,
            special_ranks=G.FUNCS.face_ranks(),
            special_amount=card.ability.extra.num_face,
            banned_ranks={SMODS.Ranks["Ace"]}
        })
    end,
}
--allalone
local allalone = SMODS.Consumable {
    set = "Parcel",
    name = "draft-allalone",
    key = "allalone",
    pos = {x = 6, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            if not value.face then
                card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            banned_ranks=G.FUNCS.face_ranks()
        })
    end,
}
--your reading is...
local yourreadingis = SMODS.Consumable {
    set = "Parcel",
    name = "draft-yourreadingis",
    key = "yourreadingis",
    pos = {x = 3, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_charm" }
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount
        })
        add_tag(Tag("tag_charm"))
    end,
}
--reachforthestars
local aimforthestars = SMODS.Consumable {
    set = "Parcel",
    name = "draft-aimforthestars",
    key = "aimforthestars",
    pos = {x = 4, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_meteor" }
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount
        })
        add_tag(Tag("tag_meteor"))
    end,
}
--spectral Procession
local spectralprocession = SMODS.Consumable {
    set = "Parcel",
    name = "draft-spectralprocession",
    key = "spectralprocession",
    pos = {x = 5, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_ethereal" }
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount
        })
        add_tag(Tag("tag_ethereal"))
    end,
}
--investinyourself
local investinyourself = SMODS.Consumable {
    set = "Parcel",
    name = "draft-investinyourself",
    key = "investinyourself",
    pos = {x = 7, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_investment", specific_vars = {15}}
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount
        })
        add_tag(Tag("tag_investment"))
    end,
}
--overdraft
local overdraft = SMODS.Consumable {
    set = "Parcel",
    name = "draft-overdraft",
    key = "overdraft",
    pos = {x = 8, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 1, additional_amount = 7}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_draft_drafttag" }
        card.ability.extra.amount = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount
        })
        add_tag(Tag("tag_draft_drafttag"))
    end,
}
--hackstarterpack
local hackstarterpack = SMODS.Consumable {
    set = "Parcel",
    name = "draft-hackstarterpack",
    key = "hackstarterpack",
    pos = {x = 9, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, num_hack = 3, num_rest = 2}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_hack
		local amount_hack = 0
        local amount_else = 0
        for key, value in pairs(SMODS.Ranks) do
            if value == SMODS.Ranks["2"] or value == SMODS.Ranks["3"] or value == SMODS.Ranks["4"] or value == SMODS.Ranks["5"] then
                amount_hack = amount_hack + card.ability.extra.num_hack
            else
                amount_else = amount_else + card.ability.extra.num_rest
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount_hack, amount_else} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_hack.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_hack")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.num_rest,
            special_ranks={SMODS.Ranks["2"] , SMODS.Ranks["3"] , SMODS.Ranks["4"] , SMODS.Ranks["5"]},
            special_amount=card.ability.extra.num_hack
        })
    end,
}
--thefutureismeow
local thefutureismeow = SMODS.Consumable {
    set = "Parcel",
    name = "draft-thefutureismeow",
    key = "thefutureismeow",
    pos = {x = 6, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2, special_amount = 3, additional_amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_lucky_cat
		local amount_seven = 0
        local amount_else = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            if value == SMODS.Ranks["7"] then
                amount_seven = amount_seven + card.ability.extra.special_amount
            else
                amount_else = amount_else + card.ability.extra.base_amount
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount_seven, amount_else} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_lucky_cat.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_lucky_cat")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount,
            special_ranks={SMODS.Ranks["7"]},
            special_amount=card.ability.extra.special_amount,
            special_enhancements={G.P_CENTERS.m_lucky}
        })
    end,
}
--stowaway
local stowaway = SMODS.Consumable {
    set = "Parcel",
    name = "draft-stowaway",
    key = "stowaway",
    pos = {x = 7, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2, additional_amount = 6}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.j_riff_raff
        local amount = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            amount = amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_riff_raff.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_riff_raff")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount
        })
    end,
}
--psychichex
local psychichex = SMODS.Consumable {
    set = "Parcel",
    name = "draft-psychichex",
    key = "psychichex",
    pos = {x = 8, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2, special_amount = 3, additional_amount = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_sixth_sense
		local amount_six = 0
        local amount_else = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            if value == SMODS.Ranks["6"] then
                amount_six = amount_six + card.ability.extra.special_amount
            else
                amount_else = amount_else + card.ability.extra.base_amount
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount_six, amount_else} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_sixth_sense.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_sixth_sense")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount,
            special_ranks={SMODS.Ranks["6"]},
            special_amount=card.ability.extra.special_amount,
            special_enhancements=G.P_CENTER_POOLS["Enhanced"]
        })
    end,
}
--whoyougonnacall
local whoyougonnacall = SMODS.Consumable {
    set = "Parcel",
    name = "draft-whoyougonnacall",
    key = "whoyougonnacall",
    pos = {x = 9, y = 1},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2, special_amount = 3, additional_amount = 2}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_walkie_talkie
		local amount_tenfour = 0
        local amount_else = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            if value == SMODS.Ranks["4"] or value == SMODS.Ranks["10"] then
                amount_tenfour = amount_tenfour + card.ability.extra.special_amount
            else
                amount_else = amount_else + card.ability.extra.base_amount
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount_tenfour, amount_else} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_walkie_talkie.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_walkie_talkie")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount,
            special_ranks={SMODS.Ranks["4"],SMODS.Ranks["10"]},
            special_amount=card.ability.extra.special_amount
        })
    end,
}
--illicitshipment
local illicitshipment = SMODS.Consumable {
    set = "Parcel",
    name = "draft-illicitshipment",
    key = "illicitshipment",
    pos = {x = 11, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 2, additional_amount = 4}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_gros_michel
		card.ability.extra.amount = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_gros_michel.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_gros_michel")
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
            end}))
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount
        })
    end,
}

if Draft.config.soul_cards then
--godsend
SMODS.Consumable {
	set = "Spectral",
	name = "draft-godsend",
	key = "godsend",
	pos = { x = 0, y = 1 },
	soul_pos = { x = 1, y = 3 },
	hidden = true,
    cost=5,
	soul_set = "Parcel",
	atlas = 'parcel_atlas',
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_amount = 1, additional_amount = 3, blessed_amount = 10}},
    loc_vars = function(self, info_queue, card)
		card.ability.extra.amount = card.ability.extra.additional_amount
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.blessed_amount, card.ability.extra.amount} }
    end,
	in_pool = function(self, args) return G.P_CENTERS.j_gros_michel.unlocked end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.blessed_amount, 1 do
            local _card = G.FUNCS.create_playing_card_in_deck_alt({})
            _card:set_edition(poll_edition("aura", nil, true, true), true)
        end
        G.FUNCS.parcel_effect(card, {
            base_amount=card.ability.extra.base_amount,
            additional_amount=card.ability.extra.additional_amount
        })
    end,
}
end

if BUNCOMOD then
    --exoticshipment
    local exoticshipment = SMODS.Consumable {
        set = "Parcel",
        name = "draft-exoticshipment",
        key = "exoticshipment",
        pos = {x = 3, y = 0},
        atlas = 'cross_mod_packet_atlas',
        cost = 0,
        order = 1,
        config = {extra = {cost = 0, base_amount = 1}},
        loc_vars = function(self, info_queue, card)
            local amount = 0
            for key, value in pairs(SMODS.Ranks) do
                amount = amount + card.ability.extra.base_amount
            end
            return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), amount} }
        end,
        can_use = function(self, card)
            return true
        end,
        use = function(self, card, area, copier)
            enable_exotics()
            local exoticsuits = G.FUNCS.filter_suits({only_exotic = true})
                assert(exoticsuits and exoticsuits ~= {}, "No exotic suits!")
            G.FUNCS.create_playing_cards_in_deck_balanced({
                base_amount=card.ability.extra.base_amount,
                suits=exoticsuits
            })
            local validsuits = G.FUNCS.filter_suits({block_exotic = true})
            --local othersuit = pseudorandom_element(validsuits, pseudoseed("exoticshipment"))
                --Disabling this for now on the assumption that the other 13 not all being one suit is intentional
            G.FUNCS.create_playing_cards_in_deck_balanced({
                base_amount=card.ability.extra.parcel_amount,
                suits=validsuits
            })
        end,
    }
    --polymer chains
    local polymerchains = SMODS.Consumable {
        set = "Parcel",
        name = "draft-polymerchains",
        key = "polymerchains",
        pos = {x = 3, y = 1},
        atlas = 'cross_mod_packet_atlas',
        cost = 0,
        order = 1,
        config = {extra = {cost = 0, amount = 0, base_amount = 2, additional_amount=4}},
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = { set = "Tag", key = "tag_bunc_arcade" }
            card.ability.extra.amount = 0
            for key, value in pairs(SMODS.Ranks) do
                card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_amount
            end
            return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
        end,
        can_use = function(self, card)
            return true
        end,
        use = function(self, card, area, copier)
            G.FUNCS.parcel_effect(card, {
                base_amount=card.ability.extra.base_amount,
                additional_amount=card.ability.extra.additional_amount
            })
            add_tag(Tag("tag_bunc_arcade"))
        end,
    }
end