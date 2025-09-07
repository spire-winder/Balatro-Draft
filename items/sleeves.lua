if CardSleeves then
	local atlasSleeves = SMODS.Atlas({
		object_type = "Atlas",
		key = "draft_sleeve_atlas",
		path = "sleeves.png",
		px = 73,
		py = 95,
	})

	local draftsleeve = CardSleeves.Sleeve({
		key = "draftsleeve",
		name = "draft-draftsleeve",
		atlas = "draft_sleeve_atlas",
		pos = { x = 0, y = 0 },
		config = { num_packs = 10},
		unlocked = true,
		unlock_condition = { deck = "Draft Deck", stake = 1 },
		loc_vars = function(self)
			local key, vars
			if self.get_current_deck_key() == "b_draft_draftdeck" or self.get_current_deck_key() == "b_draft_sealeddeck" or self.get_current_deck_key() == "b_draft_evolvingdeck" then
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
			if self.get_current_deck_key() == "b_draft_draftdeck" or self.get_current_deck_key() == "b_draft_sealeddeck" or self.get_current_deck_key() == "b_draft_evolvingdeck" then
				G.E_MANAGER:add_event(Event({
					func = function()
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
						play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
						return true
					end
				}))
			end
		end,
	})
    local sealedsleeve = CardSleeves.Sleeve({
		key = "sealedsleeve",
		name = "draft-sealedsleeve",
		atlas = "draft_sleeve_atlas",
		pos = { x = 1, y = 0 },
		config = { num_packs = 1},
		unlocked = true,
		unlock_condition = { deck = "Sealed Deck", stake = 1 },
		loc_vars = function(self)
			local key, vars
			if self.get_current_deck_key() == "b_draft_draftdeck" or self.get_current_deck_key() == "b_draft_sealeddeck" or self.get_current_deck_key() == "b_draft_evolvingdeck" then
				vars = { self.config.num_packs }
				key = self.key .. "_alt"
			else
				vars = { self.config.num_packs }
				key = self.key
			end
			return { key = key, vars = vars }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			if self.get_current_deck_key() == "b_draft_draftdeck" or self.get_current_deck_key() == "b_draft_sealeddeck" or self.get_current_deck_key() == "b_draft_evolvingdeck" then
				G.E_MANAGER:add_event(Event({
					func = function()
						for i = 1, self.config.num_packs, 1 do
							add_tag(Tag('tag_draft_slimsealedtag'))
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
							add_tag(Tag('tag_draft_sealedtag'))
						end
						play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
						return true
					end
				}))
			end
		end,
	})
	local clippersleeve = CardSleeves.Sleeve({
		key = "clippersleeve",
		name = "draft-clippersleeve",
		atlas = "draft_sleeve_atlas",
		pos = { x = 3, y = 0 },
		config = { num_packs = 3},
		unlocked = true,
		unlock_condition = { deck = "Rending Deck", stake = 1 },
		loc_vars = function(self)
			local key, vars
			vars = { self.config.num_packs }
			key = self.key
			return { key = key, vars = vars }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = 1, self.config.num_packs do
						add_tag(Tag('tag_draft_clippertag'))
					end
					return true
				end
			}))
		end,
	})
	local evolvingsleeve = CardSleeves.Sleeve{
		key = "evolvingsleeve",
		name = "draft-evolvingsleeve",
		atlas = "draft_sleeve_atlas",
		pos = { x = 2, y = 0 },
		config = { num_packs = 1, evolution = 0},
		unlocked = true,
		unlock_condition = { deck = "Evolving Deck", stake = 1 },
		loc_vars = function(self)
			local key, vars
			if self.get_current_deck_key() == "b_draft_draftdeck" or self.get_current_deck_key() == "b_draft_sealeddeck" or self.get_current_deck_key() == "b_draft_evolvingdeck" then
				vars = { self.config.num_packs }
				key = self.key .. "_alt"
			else
				vars = { self.config.num_packs }
				key = self.key
			end
			return { key = key, vars = vars }
		end,
		apply = function(self)
			self.config.evolution = 0
			self.pos = {x = 2, y = self.config.evolution}  -- change sprite pos
			if self.get_current_deck_key() == "b_draft_draftdeck" or self.get_current_deck_key() == "b_draft_sealeddeck" or self.get_current_deck_key() == "b_draft_evolvingdeck" then
				
			else
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
			end
		end,
		load = function(self, card, card_table, other_card)
			self.pos = {x = 2, y = self.config.evolution}  -- change sprite pos
			G.deck.sleeve_sprite = nil  -- force cardsleeves to reload the sprite
		end,
		trigger_effect = function(self, args)
			if args.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
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
			self.pos = {x = 2, y = self.config.evolution}  -- change sprite pos
    		G.deck.sleeve_sprite = nil  -- force cardsleeves to reload the sprite
			end
		end,
	}
end