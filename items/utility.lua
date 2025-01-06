function dissect(var)
    for k, v in pairs(var) do
        print("--"..tostring(k).."--")
        if type(v) == "table" then
            for key, value in pairs(v) do
                print(tostring(key).."="..tostring(value))
            end
        else
            print(tostring(v))
        end
    end
end

G.FUNCS.format_cost = function(num)
    local str = "$"..tostring(math.abs(num))
    if num == 0 then
        return ""
    elseif num > 0 then
        str = "+"..str
    else
        str = "-"..str
    end
    return str
end

G.FUNCS.create_playing_card_in_deck = function(t)
    if not t.suits then t.suits = SMODS.Suits end
    if not t.ranks then t.ranks = SMODS.Ranks end
    local cards = {}
    cards[1] = true
    local _suit, _rank, _center
    _suit = pseudorandom_element(t.suits, pseudoseed('draft_create')).card_key
    _rank = pseudorandom_element(t.ranks, pseudoseed('draft_create')).card_key
    if t.enhancements then
        _center = pseudorandom_element(t.enhancements, pseudoseed('draft_create'))
    else
        _center = G.P_CENTERS.c_base
    end
    local _card = create_playing_card({
        front = G.P_CARDS[_suit .. '_' .. _rank],
        center = _center
    }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Packet })
    playing_card_joker_effects(cards)
    return _card
end

G.FUNCS.get_next_rank = function(rank)
	local behavior = rank.strength_effect or { fixed = 1, ignore = false, random = false }
	local new_rank
	if behavior.ignore or not next(rank.next) then
		return true
	elseif behavior.random then
		new_rank = pseudorandom_element(rank.next, pseudoseed('next_rank'))
	else
		local ii = (behavior.fixed and rank.next[behavior.fixed]) and behavior.fixed or 1
		new_rank = rank.next[ii]
	end
    return SMODS.Ranks[new_rank]
end

G.FUNCS.create_playing_cards_in_deck = function(t)
    if not t.amount then t.amount = 1 end
    if not t.suits then t.suits = SMODS.Suits end
    if not t.ranks then t.ranks = SMODS.Ranks end
    local current_rank
    local _suit, _rank, _center
    local cards = {}
    if t.onesuit then
        _suit = pseudorandom_element(t.suits, pseudoseed('draft_create')).card_key
    end
    if t.onerank then
        _rank = pseudorandom_element(t.ranks, pseudoseed('draft_create')).card_key
    end
    if t.straight then
        local valids = {}
        for _, v in pairs(t.ranks) do
            if (v.id <= 15 - t.amount) or v.id == 14 then table.insert(valids, v) end
        end
        t.ranks = valids
    end
    for i = 1, t.amount do
        cards[i] = true
        if not t.onesuit then
            _suit = pseudorandom_element(t.suits, pseudoseed('draft_create')).card_key
        end
        if t.straight then
            if i == 1 then
                current_rank = pseudorandom_element(t.ranks, pseudoseed('draft_create'))
                _rank = current_rank.card_key
            else
                current_rank = G.FUNCS.get_next_rank(current_rank)
                _rank = current_rank.card_key
            end
        elseif not t.onerank then
            _rank = pseudorandom_element(t.ranks, pseudoseed('draft_create')).card_key
        end
        if t.enhancements then
            _center = pseudorandom_element(t.enhancements, pseudoseed('draft_create'))
        else
            _center = G.P_CENTERS.c_base
        end
        create_playing_card({
                    front = G.P_CARDS[_suit .. '_' .. _rank],
                    center = _center
        }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Packet })
    end
    playing_card_joker_effects(cards)
    return cards
end

G.FUNCS.packet_effect = function(card, t)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        if card.ability.extra.cost ~= 0 then
            ease_dollars(card.ability.extra.cost)
        end
        t.amount = card.ability.extra.amount
        G.FUNCS.create_playing_cards_in_deck(t)
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            G.GAME.starting_deck_size = #G.playing_cards
        end
        return true end }))
    delay(0.6)
end

--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	  if not G.ARGS.LOC_COLOURS then
		  lc()
	  end
	  G.ARGS.LOC_COLOURS.heart = G.C.SUITS.Hearts
	  G.ARGS.LOC_COLOURS.diamond = G.C.SUITS.Diamonds
	  G.ARGS.LOC_COLOURS.spade = G.C.SUITS.Spades
	  G.ARGS.LOC_COLOURS.club = G.C.SUITS.Clubs
	  G.ARGS.LOC_COLOURS.packet = G.C.SET.Packet
	  return lc(_c, _default)
end

G.FUNCS.suit_dist = function ()
    local suits = {}
    for key, value in pairs(SMODS.Suits) do
        suits[value] = 0
    end
    for i = 1, #G.playing_cards do
        for key, value in pairs(SMODS.Suits) do
            if G.playing_cards[i]:is_suit(key) then
                suits[value] = suits[value] + 1
            end
        end
    end
    return suits
end

G.FUNCS.popular_suit = function()
    local suits = G.FUNCS.suit_dist()
    local max = 0
    local ret = {}
    for key, value in pairs(suits) do
        if suits[key] > max then
            max = suits[key]
        end
    end
    for key, value in pairs(suits) do
        if suits[key] == max then
            table.insert(ret, key)
        end
    end
    if next(ret) == nil then
        ret = SMODS.Suits
    end
    return ret
end

G.FUNCS.not_popular_suit = function()
    local suits = G.FUNCS.suit_dist()
    local max = 0
    local ret = {}
    for key, value in pairs(suits) do
        if suits[key] > max then
            max = suits[key]
        end
    end
    for key, value in pairs(suits) do
        if suits[key] ~= max then
            table.insert(ret, key)
        end
    end
    if next(ret) == nil then
        ret = SMODS.Suits
    end
    return ret
end

G.FUNCS.least_popular_suit = function()
    local suits = G.FUNCS.suit_dist()
    local min
    local ret = {}
    for key, value in pairs(suits) do
        if not min or suits[key] < min then
            min = suits[key]
        end
    end
    for key, value in pairs(suits) do
        if suits[key] == min then
            table.insert(ret, key)
        end
    end
    if next(ret) == nil then
        ret = SMODS.Suits
    end
    return ret
end

G.FUNCS.rank_dist = function ()
    local ranks = {}
    for key, value in pairs(SMODS.Ranks) do
        ranks[value] = 0
    end
    for i = 1, #G.playing_cards do
        for key, value in pairs(SMODS.Ranks) do
            if G.playing_cards[i].base.value == key then
                ranks[value] = ranks[value] + 1
            end
        end
    end
    return ranks
end

G.FUNCS.popular_rank = function()
    local ranks = G.FUNCS.rank_dist()
    local max = 0
    local ret = {}
    for key, value in pairs(ranks) do
        if ranks[key] > max then
            max = ranks[key]
        end
    end
    for key, value in pairs(ranks) do
        if ranks[key] == max then
            table.insert(ret, key)
        end
    end
    if next(ret) == nil then
        ret = SMODS.Ranks
    end
    return ret
end

G.FUNCS.not_popular_rank = function()
    local ranks = G.FUNCS.rank_dist()
    local max = 0
    local ret = {}
    for key, value in pairs(ranks) do
        if ranks[key] > max then
            max = ranks[key]
        end
    end
    for key, value in pairs(ranks) do
        if ranks[key] ~= max then
            table.insert(ret, key)
        end
    end
    if next(ret) == nil then
        ret = SMODS.Ranks
    end
    return ret
end

G.FUNCS.least_popular_rank = function()
    local ranks = G.FUNCS.rank_dist()
    local min
    local ret = {}
    for key, value in pairs(ranks) do
        if not min or ranks[key] < min then
            min = ranks[key]
        end
    end
    for key, value in pairs(ranks) do
        if ranks[key] == min then
            table.insert(ret, key)
        end
    end
    if next(ret) == nil then
        ret = SMODS.Ranks
    end
    return ret
end


G.FUNCS.can_skip_draft_booster = function(e)
    if G.pack_cards and
    (G.STATE == G.STATES.SMODS_BOOSTER_OPENED or G.STATE == G.STATES.PLANET_PACK or G.STATE == G.STATES.STANDARD_PACK or G.STATE == G.STATES.BUFFOON_PACK or (G.hand and (G.hand.cards[1] or (G.hand.config.card_limit <= 0)))) then 
        e.config.colour = G.C.RED
        e.config.button = 'skip_draft_booster'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.skip_draft_booster = function(e)
    ease_dollars(SMODS.OPENED_BOOSTER.ability.skip_cost)
    for i = 1, #G.jokers.cards do
      G.jokers.cards[i]:calculate_joker({skipping_booster = true})
    end
    G.FUNCS.end_consumeable(e)
  end

function G.FUNCS.get_current_deck()
    if Galdur and Galdur.config.use and Galdur.run_setup.choices.deck then
        return Galdur.run_setup.choices.deck.effect.center
    elseif G.GAME.viewed_back then
        return G.GAME.viewed_back.effect.center
    elseif G.GAME.selected_back then
        return G.GAME.selected_back.effect.center
    end
    return nil
end