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
	name = "draft-evolvingdeck",
	key = "evolvingdeck",
	pos = {x = 2, y = 0},
	config = { num_packs = 1, evolution = 0},
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
					add_tag(Tag('tag_draft_slimsealedtag'))
				end
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
				return true
			end
		}))
	end,
    load = function(self, card, card_table, other_card)
        for k, v in pairs(G.I.CARD) do
			if v.children.back then
				v.children.back:set_sprite_pos({x=2, y=card.ability.evolution})
			end
		end
    end,
	calculate = function(self, card, context) 
		if context.end_of_round and G.GAME.blind.boss and not context.other_card then
        local add_draft_tag_event = Event({
            func = (function()
                add_tag(Tag('tag_draft_drafttag'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                return true
            end)
        })
        G.E_MANAGER:add_event(add_draft_tag_event)
		if self.config.evolution < 3 then
			self.config.evolution = self.config.evolution + 1
		end
		for k, v in pairs(G.I.CARD) do
			if v.children.back then
				v.children.back:set_sprite_pos({x=2, y=self.config.evolution})
			end
		end
		end
    end,
}