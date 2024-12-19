
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
	object_type = "Atlas",
	key = "tag_atlas",
	path = "tags.png",
	px = 34,
	py = 34,
}

SMODS.Atlas {
	object_type = "Atlas",
	key = "packet_atlas",
	path = "packets.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	object_type = "Atlas",
	key = "pack_atlas",
	path = "packs.png",
	px = 71,
	py = 95,
}

assert(SMODS.load_file("items/utility.lua"))()
assert(SMODS.load_file("items/packets.lua"))()
assert(SMODS.load_file("items/packs.lua"))()

SMODS.Back{
	name = "draft-draftdeck",
	key = "draftdeck",
	pos = {x = 0, y = 0},
	config = { num_packs = 10, dollars = 0},
	atlas = "packet_atlas",
	loc_vars = function(self)
		return { vars = { self.config.num_packs } }
	end,
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				for i = #G.playing_cards, 1, -1 do
					G.playing_cards[i]:remove()
				end
				G.GAME.starting_deck_size = #G.playing_cards
				for i = 1, self.config.num_packs, 1 do
					add_tag(Tag('tag_draft_drafttag'))
				end
				return true
			end
		}))
	end
}