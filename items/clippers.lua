SMODS.ConsumableType {
    object_type = "ConsumableType",
    key = 'Clipper',
    collection_rows = { 3,3 },
    primary_colour = HEX("d7ba89"),
    secondary_colour = HEX("56342a"),
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
        y = 0,
    }
}

--safetyscissors
local safetyscissors = SMODS.Consumable {
    set = "Clipper",
    name = "draft-safetyscissors",
    key = "safetyscissors",
    pos = {x = 1, y = 0},
    atlas = 'clipper_atlas',
    cost = 0,
    order = 1,
    config = {extra = {cost = 0, amount_selected = 2}},
    loc_vars = function(self, info_queue, card)
        return { vars = {G.FUNCS.format_cost(card.ability.extra.cost), card.ability.extra.amount_selected} }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.FUNCS.clipper_effect(card, {})
    end,
}