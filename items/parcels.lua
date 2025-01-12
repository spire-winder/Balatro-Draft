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
    config = {extra = {cost = 0, amount = 0, amount_1 = 0}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        card.ability.extra.amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                card.ability.extra.amount = card.ability.extra.amount + 1
            end
            if value.suit == "Diamonds" then
                card.ability.extra.amount_1 = card.ability.extra.amount_1 + 1
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
            if value.suit == "Diamonds" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, amount_1 = 0}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        card.ability.extra.amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Clubs" then
                card.ability.extra.amount = card.ability.extra.amount + 1
            end
            if value.suit == "Spades" then
                card.ability.extra.amount_1 = card.ability.extra.amount_1 + 1
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Spades" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
            if value.suit == "Clubs" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, amount_1 = 0}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        card.ability.extra.amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                card.ability.extra.amount = card.ability.extra.amount + 1
            end
            if value.suit == "Spades" then
                card.ability.extra.amount_1 = card.ability.extra.amount_1 + 1
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
            if value.suit == "Spades" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, amount_1 = 0}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        card.ability.extra.amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Diamonds" then
                card.ability.extra.amount = card.ability.extra.amount + 1
            end
            if value.suit == "Clubs" then
                card.ability.extra.amount_1 = card.ability.extra.amount_1 + 1
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Diamonds" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
            if value.suit == "Clubs" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, amount_1 = 0}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        card.ability.extra.amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                card.ability.extra.amount = card.ability.extra.amount + 1
            end
            if value.suit == "Clubs" then
                card.ability.extra.amount_1 = card.ability.extra.amount_1 + 1
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Hearts" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
            if value.suit == "Clubs" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, amount_1 = 0}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        card.ability.extra.amount_1 = 0
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Diamonds" then
                card.ability.extra.amount = card.ability.extra.amount + 1
            end
            if value.suit == "Spades" then
                card.ability.extra.amount_1 = card.ability.extra.amount_1 + 1
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount, card.ability.extra.amount_1} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(G.P_CARDS) do
            if value.suit == "Diamonds" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
            if value.suit == "Spades" then
                create_playing_card({
                    front = value,
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_havealltheaces'))
            if value == SMODS.Ranks["Ace"] then
                for i = 1, card.ability.extra.ace_num, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            else
                for i = 1, card.ability.extra.else_num, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_reachforthestars'))
            if value.face then
                for i = 1, card.ability.extra.num_face, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            elseif value ~= SMODS.Ranks["Ace"] then
                for i = 1, card.ability.extra.num_rest, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, num = 2}},
    loc_vars = function(self, info_queue, card)
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            if not value.face then
                card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.num
            end
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_allalone'))
            if not value.face then
                for i = 1, card.ability.extra.num, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, num = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_charm" }
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.num
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_yourreadingis'))
            for i = 1, card.ability.extra.num, 1 do
                create_playing_card({
                    front = possibilities[i],
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, num = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_meteor" }
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.num
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_reachforthestars'))
            for i = 1, card.ability.extra.num, 1 do
                create_playing_card({
                    front = possibilities[i],
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, num = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_ethereal" }
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.num
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_spectralprocession'))
            for i = 1, card.ability.extra.num, 1 do
                create_playing_card({
                    front = possibilities[i],
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, num = 2}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_investment", specific_vars = {15}}
        card.ability.extra.amount = 0
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.num
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_investinyourself'))
            for i = 1, card.ability.extra.num, 1 do
                create_playing_card({
                    front = possibilities[i],
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
    config = {extra = {cost = 0, amount = 0, base_num = 1, num_additional = 7}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_draft_drafttag" }
        card.ability.extra.amount = card.ability.extra.num_additional
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_num
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local amount_per_rank = {}
        for key, val in pairs(SMODS.Ranks) do
            amount_per_rank[val] = card.ability.extra.base_num
        end
        local possibilities = {}
        for key, val in pairs(SMODS.Ranks) do
            table.insert(possibilities, val)
        end
        pseudoshuffle(possibilities, pseudoseed('draft_overdraft'))
        for i = 1, card.ability.extra.num_additional, 1 do
            amount_per_rank[possibilities[(i % #possibilities) + 1]] = amount_per_rank[possibilities[(i % #possibilities) + 1]] + 1
        end
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_overdraft'))
            for i = 1, amount_per_rank[value], 1 do
                create_playing_card({
                    front = possibilities[i],
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
        G.FUNCS.packet_effect(card, {nocards=true})
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
		info_queue[#info_queue + 1] = { set = "Joker", key = "j_hack" }
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
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_hackstarterpack'))
            if value == SMODS.Ranks["2"] or value == SMODS.Ranks["3"] or value == SMODS.Ranks["4"] or value == SMODS.Ranks["5"] then
                for i = 1, card.ability.extra.num_hack, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            else
                for i = 1, card.ability.extra.num_rest, 1 do
                    create_playing_card({
                        front = possibilities[(i % #possibilities) + 1],
                        _center = G.P_CENTERS.c_base
                        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                end
            end
        end
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
        G.FUNCS.packet_effect(card, {nocards=true})
    end,
}
--bananasmuggler
local bananasmuggler = SMODS.Consumable {
    set = "Parcel",
    name = "draft-bananasmuggler",
    key = "bananasmuggler",
    pos = {x = 11, y = 0},
    atlas = 'parcel_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount = 0, base_num = 2, num_additional = 4}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Joker", key = "j_gros_michel", specific_vars = {15, 1, 6} }
		card.ability.extra.amount = card.ability.extra.num_additional
        for key, value in pairs(SMODS.Ranks) do
            card.ability.extra.amount = card.ability.extra.amount + card.ability.extra.base_num
        end
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local amount_per_rank = {}
        for key, val in pairs(SMODS.Ranks) do
            amount_per_rank[val] = card.ability.extra.base_num
        end
        local possibilities = {}
        for key, val in pairs(SMODS.Ranks) do
            table.insert(possibilities, val)
        end
        pseudoshuffle(possibilities, pseudoseed('draft_bananasmuggler'))
        for i = 1, card.ability.extra.num_additional, 1 do
            amount_per_rank[possibilities[(i % #possibilities) + 1]] = amount_per_rank[possibilities[(i % #possibilities) + 1]] + 1
        end
        for key, value in pairs(SMODS.Ranks) do
            local possibilities = {}
            for key, val in pairs(G.P_CARDS) do
                if val.value == value.key then
                    table.insert(possibilities, val)
                end
            end
            pseudoshuffle(possibilities, pseudoseed('draft_bananasmuggler'))
            for i = 1, amount_per_rank[value], 1 do
                create_playing_card({
                    front = possibilities[i],
                    _center = G.P_CENTERS.c_base
                    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
            end
        end
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
        G.FUNCS.packet_effect(card, {nocards=true})
    end,
}