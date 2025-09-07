SMODS.Back{
	name = "draft-draftdeck",
	key = "draftdeck",
	pos = {x = 0, y = 0},
	config = { num_packs = 10},
	atlas = "deck_atlas",
	loc_vars = function(self)
		return { vars = { self.config.num_packs }}
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
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
				return true
			end}))
	end
}

SMODS.Back{
	name = "draft-sealeddeck",
	key = "sealeddeck",
	pos = {x = 1, y = 0},
	config = { num_packs = 1},
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
					add_tag(Tag('tag_draft_sealedtag'))
				end
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
				return true
			end
		}))
	end,
}

SMODS.Back{
	name = "draft-clipperdeck",
	key = "clipperdeck",
	pos = {x = 3, y = 0},
	config = { num_packs = 3},
	atlas = "deck_atlas",
	loc_vars = function(self)
		return { vars = { self.config.num_packs }}
	end,
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				for i = 1, self.config.num_packs, 1 do
					add_tag(Tag('tag_draft_clippertag'))
				end
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
				return true
			end}))
	end
}

local evolvingdeck = SMODS.Back{
	name = "draft-evolvingdeck",
	key = "evolvingdeck",
	pos = {x = 2, y = 0},
	config = { num_packs = 1, evolution = 0},
	atlas = "draft_evolving",
	loc_vars = function(self)
		return { vars = { self.config.num_packs } }
	end,
	apply = function(self)
		draft_evolution_state = 0
		G.E_MANAGER:add_event(Event({
			func = function()
				for i = #G.playing_cards, 1, -1 do
					G.playing_cards[i]:remove()
				end
				G.GAME.starting_deck_size = #G.playing_cards
				for i = 1, self.config.num_packs, 1 do
					add_tag(Tag('tag_draft_slimsealedtag'))
				end
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
				return true
			end
		}))
	end,
	calculate = function(self, card, context)
		if context.end_of_round and G.GAME.blind.boss and not context.individual and not context.repetition then
        local add_draft_tag_event = Event({
            func = (function()
                add_tag(Tag('tag_draft_drafttag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                return true
            end)
        })
        G.E_MANAGER:add_event(add_draft_tag_event)
		if draft_evolution_state < 3 then
			draft_evolution_state = draft_evolution_state + 1
		end
		end
    end,
	
}

--evolving deck patches
local upd = Game.update
draft_evolution_state = 0
function Game:update(dt)
	upd(self, dt)
	for k, v in pairs(G.I.CARD) do
		if v.children.back and v.children.back.atlas.name == "draft_evolving" then
			v.children.back:set_sprite_pos({x=2, y=draft_evolution_state})
		end
	end
end