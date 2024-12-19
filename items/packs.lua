--Draft pack
SMODS.Booster {
    object_type = "Booster",
    key = "draft_pack_1",
    kind = "Packet",
    atlas = "pack_atlas",
    pos = { x = 0, y = 0 },
    config = {extra = 3, choose = 1 },
    cost = 4,
    order = 1,
    weight = 0.96,
    create_card = function(self, card)
        return create_card("Packet", G.pack_cards, nil, nil, true, true, nil, "draft_packet")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Packet)
        ease_background_colour({ new_colour = G.C.SET.Packet, special_colour = G.C.WHITE, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_draft_draft_pack",
}

SMODS.Tag {
	object_type = "Tag",
	atlas = "tag_atlas",
	name = "draft-drafttag",
	order = 26,
	pos = { x = 0, y = 0 },
	config = { type = "new_blind_choice" },
	key = "drafttag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_draft_pack", specific_vars = { 1, 3 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Code, function()
				local key = "p_draft_pack_" .. math.random(1, 1)
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}