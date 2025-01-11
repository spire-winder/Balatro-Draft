
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
	path = "packs.png",
	px = 71,
	py = 95,
}

Draft = SMODS.current_mod

assert(SMODS.load_file("items/utility.lua"))()
assert(SMODS.load_file("items/packets.lua"))()
assert(SMODS.load_file("items/packs.lua"))()


-- SLEEVE BASE CLASS & METHODS

Draft.Draft_Mode = SMODS.Center:extend {
    class_prefix = "draftmode",
    discovered = false,
    unlocked = true,
    set = "Draft_Mode",
    config = {},
    required_params = { "key", "atlas", "pos" },
    pre_inject_class = function(self)
        G.P_CENTER_POOLS[self.set] = {}
    end,
    get_obj = function(self, key)
        if key == nil then
            return nil
        end
        return self.obj_table[key] or SMODS.Center:get_obj(key)
    end
}

function Draft.Draft_Mode:get_name()
    if self:is_unlocked() then
        return localize{type = "name_text", set = self.set, key = self.key}
    else
        return localize('k_locked')
    end
end

function Draft.Draft_Mode:is_unlocked()
    -- Checks self.unlocked, Draft config, and basegame Unlock All. Use this to read self.unlocked unless you know what you're doing
    return self.unlocked or Draft.config.allow_any_draft_mode_selection or G.PROFILES[G.SETTINGS.profile].all_unlocked
end

function Draft.Draft_Mode:generate_ui(info_queue, card, desc_nodes, specific_vars, full_UI_table)
    if not self:is_unlocked() then
        local target = {
            type = 'descriptions',
            key = self.class_prefix .. "_locked",
            set = self.set,
            nodes = desc_nodes,
            vars = specific_vars or {}
        }
        if self.locked_loc_vars and type(self.locked_loc_vars) == 'function' then
            local res = self:locked_loc_vars(info_queue, card) or {}
            target.key = res.key or target.key
            target.vars = res.vars or target.vars
        end
        localize(target)
    else
        return SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end
end

SMODS.Back{
	name = "draft-draftdeck",
	key = "draftdeck",
	pos = {x = 0, y = 0},
	config = { num_packs = 10, dollars = 0},
	atlas = "deck_atlas",
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
			end}))
	end
}

--[[Draft.Draft_Mode {
    key = "mode_casl_none",
    name = "Standard Deck",
    atlas = "pack_atlas",
    pos = { x = 4, y = 3 },
    config = {},
}

Draft.Draft_Mode({
	key = "draft",
	name = "draft-draft",
	atlas = "pack_atlas",
	pos = { x = 0, y = 0 },
	config = { num_packs = 10, dollars = 0 },
	unlocked = true,
	loc_vars = function(self)
		return { key = self.key, vars = { self.config.num_packs } }
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
	end,
})

if CardSleeves then
	local atlasSleeves = SMODS.Atlas({
		object_type = "Atlas",
		key = "sleeve_atlas",
		path = "sleeves.png",
		px = 73,
		py = 95,
	})

	local draftsleeve = CardSleeves.Sleeve({
		key = "draftsleeve",
		name = "draft-draftsleeve",
		atlas = "sleeve_atlas",
		pos = { x = 0, y = 0 },
		config = { num_packs = 10, dollars = 0 },
		unlocked = true,
		unlock_condition = { deck = "Draft Deck", stake = 1 },
		loc_vars = function(self)
			local key, vars
			if self.get_current_deck_key() == "b_draft_draftdeck" then
				vars = { self.config.num_packs / 2 }
				key = self.key .. "_alt"
			else
				vars = { self.config.num_packs }
				key = self.key
			end
			return { key = key, vars = vars }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			if self.get_current_deck_key() == "b_draft_draftdeck" then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.starting_deck_size = #G.playing_cards
						for i = 1, self.config.num_packs, 2 do
							add_tag(Tag('tag_draft_megadrafttag'))
						end
						return true
					end
				}))
			else
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
		end,
	})
end]]