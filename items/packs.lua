--Draft pack
SMODS.Booster {
    object_type = "Booster",
    key = "draft_pack_1",
    kind = "Packet",
    atlas = "pack_atlas",
    pos = { x = 0, y = 0 },
    config = {extra = 3, choose = 1, skip_cost = -3},
    cost = 0,
    order = 1,
    weight = 0.96,
    create_card = function(self, card, i)
		if i == 1 and Draft.config.neutral_packet_collation then
        	return create_card("PacketNeutral", G.pack_cards, nil, nil, true, true, nil, "draft_packet")
		else
        	return create_card("Packet", G.pack_cards, nil, nil, true, true, nil, "draft_packet")
		end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Packet)
        ease_background_colour({ new_colour = G.C.BLACK, special_colour = G.C.SET.Packet, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_draft_draft_pack",
	in_pool = function(self, args) return Draft.config.include_in_run end,
	create_UIBox = function(self)
		local _size = SMODS.OPENED_BOOSTER.ability.extra
		G.pack_cards = CardArea(
			G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
			math.max(1,math.min(_size,5))*G.CARD_W*1.1,
			1.05*G.CARD_H, 
			{card_limit = _size, type = 'consumeable', highlight_limit = 1})

		local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
			{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
						{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
			{n=G.UIT.R, config={align = "cm"}, nodes={}},
			{n=G.UIT.R, config={align = "tm"}, nodes={
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
					{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_draft_booster', hover = true,shadow = true, func = 'can_skip_draft_booster'}, nodes = {
						{n=G.UIT.T, config={text = localize('b_skip')..": ".. G.FUNCS.format_cost(SMODS.OPENED_BOOSTER.ability.skip_cost), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}},
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
					}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
					UIBox_dyn_container({
						{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = localize(self.group_key or ('k_booster_group_'..self.key)), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
								{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
					}),}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				}}}}}}
		return t
	end,
}

--mega Draft pack
SMODS.Booster {
    object_type = "Booster",
    key = "mega_draft_pack_1",
    kind = "Packet",
    atlas = "pack_atlas",
    pos = { x = 0, y = 0 },
    config = {extra = 5, choose = 2, skip_cost = -5},
    cost = 0,
    order = 1,
    weight = 0.96,
    create_card = function(self, card, i)
		if i == 1 and Draft.config.neutral_packet_collation then
        	return create_card("PacketNeutral", G.pack_cards, nil, nil, true, true, nil, "draft_packet")
		else
        	return create_card("Packet", G.pack_cards, nil, nil, true, true, nil, "draft_packet")
		end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Packet)
        ease_background_colour({ new_colour = G.C.BLACK, special_colour = G.C.SET.Packet, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_draft_draft_pack",
	--in_pool = function(self, args) return false end,
	create_UIBox = function(self)
		local _size = SMODS.OPENED_BOOSTER.ability.extra
		G.pack_cards = CardArea(
			G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
			math.max(1,math.min(_size,5))*G.CARD_W*1.1,
			1.05*G.CARD_H, 
			{card_limit = _size, type = 'consumeable', highlight_limit = 1})

		local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
			{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
						{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
			{n=G.UIT.R, config={align = "cm"}, nodes={}},
			{n=G.UIT.R, config={align = "tm"}, nodes={
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
					{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_draft_booster', hover = true,shadow = true, func = 'can_skip_draft_booster'}, nodes = {
						{n=G.UIT.T, config={text = localize('b_skip')..": ".. G.FUNCS.format_cost(SMODS.OPENED_BOOSTER.ability.skip_cost), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}},
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
					}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
					UIBox_dyn_container({
						{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = localize(self.group_key or ('k_booster_group_'..self.key)), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
								{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
					}),}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				}}}}}}
		return t
	end,
}

--slim pack
SMODS.Booster {
    object_type = "Booster",
    key = "slim_sealed_pack_1",
    kind = "Parcel",
    atlas = "pack_atlas",
    pos = { x = 1, y = 0 },
    config = {extra = 5, choose = 1},
    cost = 4,
    order = 1,
    weight = 0.96,
    create_card = function(self, card, i)
		return create_card("Parcel", G.pack_cards, nil, nil, true, true, nil, "sealed_parcel")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Parcel)
        ease_background_colour({ new_colour = G.C.WHITE, special_colour = G.C.SET.Parcel, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_draft_sealed_pack",
	in_pool = function(self, args) return false end,
	create_UIBox = function(self)
		local _size = SMODS.OPENED_BOOSTER.ability.extra
		G.pack_cards = CardArea(
			G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
			math.max(1,math.min(_size,5))*G.CARD_W*1.1,
			1.05*G.CARD_H, 
			{card_limit = _size, type = 'consumeable', highlight_limit = 1})

		local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
			{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
						{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
			{n=G.UIT.R, config={align = "cm"}, nodes={}},
			{n=G.UIT.R, config={align = "tm"}, nodes={
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
					UIBox_dyn_container({
						{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = localize(self.group_key or ('k_booster_group_'..self.key)), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
								{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
					}),}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				}}}}}}
		return t
	end,
}

--Sealed pack
SMODS.Booster {
    object_type = "Booster",
    key = "sealed_pack_1",
    kind = "Parcel",
    atlas = "pack_atlas",
    pos = { x = 1, y = 0 },
    config = {extra = 5, choose = 2},
    cost = 4,
    order = 1,
    weight = 0.96,
    create_card = function(self, card, i)
		return create_card("Parcel", G.pack_cards, nil, nil, true, true, nil, "sealed_parcel")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Parcel)
        ease_background_colour({ new_colour = G.C.WHITE, special_colour = G.C.SET.Parcel, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_draft_sealed_pack",
	in_pool = function(self, args) return false end,
	create_UIBox = function(self)
		local _size = SMODS.OPENED_BOOSTER.ability.extra
		G.pack_cards = CardArea(
			G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
			math.max(1,math.min(_size,5))*G.CARD_W*1.1,
			1.05*G.CARD_H, 
			{card_limit = _size, type = 'consumeable', highlight_limit = 1})

		local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
			{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
						{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
			{n=G.UIT.R, config={align = "cm"}, nodes={}},
			{n=G.UIT.R, config={align = "tm"}, nodes={
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
					UIBox_dyn_container({
						{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = localize(self.group_key or ('k_booster_group_'..self.key)), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
								{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
					}),}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				}}}}}}
		return t
	end,
}

--Clipper pack
SMODS.Booster {
    object_type = "Booster",
    key = "clipper_pack_1",
    kind = "Clipper",
    atlas = "pack_atlas",
    pos = { x = 2, y = 0 },
    config = {extra = 3, choose = 1},
    cost = 4,
    order = 1,
    weight = 0.96,
    create_card = function(self, card, i)
		return create_card("Clipper", G.pack_cards, nil, nil, true, true, nil, "draft_clipper")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Clipper)
        ease_background_colour({ new_colour = G.C.BLACK, special_colour = G.C.SET.Clipper, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_draft_clipper_pack",
	draw_hand = true,
	in_pool = function(self, args) return Draft.config.include_in_run end,
}

--Draft tag
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
			tag:yep("+", G.C.SECONDARY_SET.Packet, function()
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
	in_pool = function(self, args) return false end
}

--mega tag
SMODS.Tag {
	object_type = "Tag",
	atlas = "tag_atlas",
	name = "draft-megadrafttag",
	order = 26,
	pos = { x = 2, y = 0 },
	config = { type = "new_blind_choice" },
	key = "megadrafttag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_draft_pack", specific_vars = { 2, 5 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Packet, function()
				local key = "p_draft_mega_draft_pack_" .. math.random(1, 1)
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
	in_pool = function(self, args) return false end
}

--slim sealed tag
SMODS.Tag {
	object_type = "Tag",
	atlas = "tag_atlas",
	name = "draft-slimsealedtag",
	order = 26,
	pos = { x = 3, y = 0 },
	config = { type = "new_blind_choice" },
	key = "slimsealedtag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_draft_sealed_pack", specific_vars = { 1, 5 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Packet, function()
				local key = "p_draft_slim_sealed_pack_" .. math.random(1, 1)
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
	in_pool = function(self, args) return false end
}

--sealed tag
SMODS.Tag {
	object_type = "Tag",
	atlas = "tag_atlas",
	name = "draft-sealedtag",
	order = 26,
	pos = { x = 3, y = 0 },
	config = { type = "new_blind_choice" },
	key = "sealedtag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_draft_sealed_pack", specific_vars = { 2, 5 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Packet, function()
				local key = "p_draft_sealed_pack_" .. math.random(1, 1)
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
	in_pool = function(self, args) return false end
}

--Clipper tag
SMODS.Tag {
	object_type = "Tag",
	atlas = "tag_atlas",
	name = "draft-clippertag",
	order = 26,
	pos = { x = 4, y = 0 },
	config = { type = "new_blind_choice" },
	key = "clippertag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_draft_clipper_pack", specific_vars = { 1, 3 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Packet, function()
				local key = "p_draft_clipper_pack_" .. math.random(1, 1)
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
	in_pool = function(self, args) return Draft.config.include_in_run end
}

--minior tag (used for planetary alignment)
SMODS.Tag {
	object_type = "Tag",
	atlas = "tag_atlas",
	name = "draft-miniortag",
	order = 26,
	pos = { x = 1, y = 0 },
	config = { type = "new_blind_choice" },
	key = "miniortag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_celestial_normal_1
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Code, function()
				local key = "p_celestial_normal_" .. math.random(1, 4)
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
	in_pool = function(self, args) return false end
}