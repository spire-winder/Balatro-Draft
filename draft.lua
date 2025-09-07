
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
}):register()

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
	key = "parcel_atlas",
	path = "parcels.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	object_type = "Atlas",
	key = "clipper_atlas",
	path = "clippers.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	object_type = "Atlas",
	key = "cross_mod_packet_atlas",
	path = "cross_mod_packets.png",
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

SMODS.Atlas {
	object_type = "Atlas",
	key = "deck_atlas",
	path = "decks.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	object_type = "Atlas",
	key = "draft_evolving",
	path = "decks.png",
	px = 71,
	py = 95,
}

Draft = SMODS.current_mod

assert(SMODS.load_file("items/utility.lua"))()
assert(SMODS.load_file("items/packets.lua"))()
assert(SMODS.load_file("items/parcels.lua"))()
assert(SMODS.load_file("items/clippers.lua"))()
assert(SMODS.load_file("items/packs.lua"))()
--assert(SMODS.load_file("items/draft_modes.lua"))()
assert(SMODS.load_file("items/ui.lua"))()
assert(SMODS.load_file("items/decks.lua"))()
assert(SMODS.load_file("items/sleeves.lua"))()
assert(SMODS.load_file("items/compatible.lua"))()