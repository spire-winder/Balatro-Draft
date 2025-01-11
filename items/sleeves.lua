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
end