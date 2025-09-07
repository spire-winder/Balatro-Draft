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

-- Debug message
function G.FUNCS.draftSay(message, level)
    message = message or "???"
    level = level or "DEBUG"
    sendMessageToConsole(level, "Drafting", message)
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

--[[G.FUNCS.create_playing_card_in_deck = function(t)
    if not t.suits then t.suits = G.FUNCS.filter_suits({not_fake = true}) end
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
end]]

G.FUNCS.create_playing_card_in_deck_alt = function(t)
    if not t.suits then
        t.suits = G.FUNCS.filter_suits(t)
    end
    if not t.ranks then t.ranks = SMODS.Ranks end
    local cards = {}
    cards[1] = true
    local suitset = {}
    local rankset = {}
    for key, value in pairs(t.suits) do
        suitset[value.key] = true
    end
    for key, value in pairs(t.ranks) do
        rankset[value.key] = true
    end
    local possibilities = {}
    for key, val in pairs(G.P_CARDS) do
        table.insert(possibilities, key)
    end
    pseudoshuffle(possibilities, pseudoseed('draft_create'))
    local i = 1
    while true do
        local front = G.P_CARDS[ possibilities[(i % #possibilities) + 1] ]
        if suitset[front.suit] ~= nil and rankset[front.value] ~= nil then
            local center
            if t.enhancements then
                center = pseudorandom_element(t.enhancements, pseudoseed('draft_enhancement'))
            else
                center = G.P_CENTERS.c_base
            end
            local _card = create_playing_card({
            front = front,
            center = center
            }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Packet })
            playing_card_joker_effects(cards)
            return _card
        end
        i = i + 1
    end
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

function compact(x)
    local value = pseudorandom_element(x, pseudoseed(tostring(x)))
    return { value }
end

G.FUNCS.filter_suits = function (t)
    t = t or {}
    local ret = {}
    for key, value in pairs(SMODS.Suits) do
        local valid = true
        if t.only_vanilla then
            if key ~= "Spades" and key ~= "Hearts" and key ~="Clubs" and key ~= "Diamonds" then
                valid = false
                --G.FUNCS.draftsay(key.." excluded: Not vanilla", "TRACE")
            end
        end
        if not t.allow_hidden and not t.only_exotic and value.hidden then
            valid = false
            --G.FUNCS.draftsay(key.." excluded: Hidden", "TRACE")
        end
        if not t.allow_fake and value.fake then
            valid = false
            --G.FUNCS.draftsay(key.." excluded: Fake", "TRACE")
        end
        if t.block_exotic and value.exotic then
            valid = false
            --G.FUNCS.draftsay(key.." excluded: Exotic", "TRACE")
        end
        if t.only_exotic and not value.exotic then
            valid = false
            --G.FUNCS.draftsay(key.." excluded: Not exotic", "TRACE")
        end
        if not t.ignore_pool and not (value.in_pool == nil or value.in_pool()) then --Vanilla suits don't have an in_pool
            valid = false
            --G.FUNCS.draftsay(key.." excluded: Not in pool", "TRACE")
        end
        if valid and t.exclude then
            for xkey, xvalue in pairs(t.exclude) do
                if key == xkey then valid = false end
                --G.FUNCS.draftsay(key.." excluded: Explicitly excluded", "TRACE")
            end
        end
        if valid then ret[key] = value end
    end
    if ret == {} then
        G.FUNCS.draftSay("Please check your filter_suits arguments; no valid suits remain! Returning vanilla suits.", "ERROR")
        ret = {
            SMODS.Suits["Hearts"],
            SMODS.Suits["Diamonds"],
            SMODS.Suits["Clubs"],
            SMODS.Suits["Spades"],
        }
    end
    return ret
end

G.FUNCS.not_hidden_suits = function ()
    G.FUNCS.draftSay("not_hidden_suits is deprecated, use filter_suits instead!", "WARN ")
    local ret = {}
    for key, value in pairs(SMODS.Suits) do
        if not value.hidden then
            ret[key] = value
        end
    end
    return ret
end

--[[G.FUNCS.create_playing_cards_in_deck = function(t)
    if not t.amount then t.amount = 1 end
    if not t.suits then t.suits = G.FUNCS.filter_suits({not_fake = true}) end
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
end]]

G.FUNCS.create_playing_cards_in_deck_alt = function(t)
    if not t.amount then t.amount = 1 end
    if not t.suits then
        t.suits = G.FUNCS.filter_suits(t)
    end
    if not t.ranks then t.ranks = SMODS.Ranks end
    if t.onesuit then t.suits = compact(t.suits) end
    if t.onerank then t.ranks = compact(t.ranks) end
    local cards = {}
    local actual_cards = {}
    local suitset = {}
    local rankset = {}
    for key, value in pairs(t.suits) do
        suitset[value.key] = true
    end
    for key, value in pairs(t.ranks) do
        rankset[value.key] = true
    end
    local current_amount = 0
    local possibilities = {}
    for key, val in pairs(G.P_CARDS) do
        table.insert(possibilities, key)
    end
    pseudoshuffle(possibilities, pseudoseed('draft_create'))
    local i = 1
    while current_amount < t.amount do
        local front = G.P_CARDS[ possibilities[(i % #possibilities) + 1] ]
        if suitset[front.suit] ~= nil and rankset[front.value] ~= nil then
            local center
            if t.enhancements then
                center = pseudorandom_element(t.enhancements, pseudoseed('draft_enhancement'))
            else
                center = G.P_CENTERS.c_base
            end
            if t.one_per_suit then
                suitset[front.suit] = nil
            end
            current_amount = current_amount + 1
            actual_cards[current_amount] = create_playing_card({
            front = front,
            center = center
            }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Packet })
            cards[current_amount] = true
        end
        i = i + 1
    end
    playing_card_joker_effects(cards)
    return actual_cards
end

G.FUNCS.create_playing_cards_in_deck_balanced = function(t)
    t = t or {}
    if not t.base_amount then t.base_amount = 1 end
    if not t.suits then
        t.suits = G.FUNCS.filter_suits(t)
    end
    if not t.ranks then t.ranks = SMODS.Ranks end
    if t.onesuit then t.suits = compact(t.suits) end
    if t.onerank then t.ranks = compact(t.ranks) end
    local actual_cards = {}
    local cards = {}
    local suitset = {}
    for key, value in pairs(t.suits) do
        suitset[value.key] = true
    end
    local special_rankset = {}
    if t.special_ranks then
        for key, value in pairs(t.special_ranks) do
            special_rankset[value] = true
        end
    end
    local banned_rankset = {}
    if t.banned_ranks then
        for key, value in pairs(t.banned_ranks) do
            banned_rankset[value] = true
        end
    end
    local amount_per_rank = {}
    for key, val in pairs(t.ranks) do
        if t.banned_ranks and banned_rankset[val] ~= nil then
            amount_per_rank[val] = 0
        elseif t.special_ranks and special_rankset[val] ~= nil then
            amount_per_rank[val] = t.special_amount
        else
            amount_per_rank[val] = t.base_amount
        end
    end
    if t.additional_amount then
        local possibilities = {}
        for key, val in pairs(t.ranks) do
            if t.special_ranks and special_rankset[val] ~= nil then
                
            else
                table.insert(possibilities, val)
            end
        end
        pseudoshuffle(possibilities, pseudoseed('draft_create'))
        for i = 1, t.additional_amount, 1 do
            amount_per_rank[possibilities[(i % #possibilities) + 1]] = amount_per_rank[possibilities[(i % #possibilities) + 1]] + 1
        end
    end
    for key, value in pairs(t.ranks) do
        local possibilities = {}
        for key, val in pairs(G.P_CARDS) do
            if val.value == value.key then
                table.insert(possibilities, key)
            end
        end
        pseudoshuffle(possibilities, pseudoseed('draft_create'))
        local current_amount = 0
        local i = 1
        while current_amount < amount_per_rank[value] do
            local front = G.P_CARDS[ possibilities[(i % #possibilities) + 1] ]
            if suitset[front.suit] ~= nil then
                local center
                if t.enhancements then
                    center = pseudorandom_element(t.enhancements, pseudoseed('draft_enhancement'))
                elseif t.special_enhancements and special_rankset[value] ~= nil then
                    center = pseudorandom_element(t.special_enhancements, pseudoseed('draft_enhancement'))
                else
                    center = G.P_CENTERS.c_base
                end
                if t.one_per_suit then
                    suitset[front.suit] = nil
                end
                current_amount = current_amount + 1
                actual_cards[current_amount] = create_playing_card({
                front = front,
                center = center
                }, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Parcel })
                cards[current_amount] = true
            end
            i = i + 1
        end
    end
    playing_card_joker_effects(cards)
    return actual_cards
end

G.FUNCS.create_playing_cards_in_deck_straight = function(t)
    if not t.amount then t.amount = 1 end
    if not t.suits then
        t.suits = G.FUNCS.filter_suits(t)
    end
    if not t.ranks then t.ranks = SMODS.Ranks end
    if t.onesuit then t.suits = compact(t.suits) end
    local actual_cards = {}
    local cards = {}
    local suitset = {}
    local current_rank
    for key, value in pairs(t.suits) do
        suitset[value.key] = true
    end
    local valids = {}
    for _, v in pairs(t.ranks) do
        if (v.id <= 15 - t.amount) or v.id == 14 then table.insert(valids, v) end
    end
    t.ranks = valids
    for i = 1, t.amount do
        if i == 1 then
            current_rank = pseudorandom_element(t.ranks, pseudoseed('draft_create'))
        else
            current_rank = G.FUNCS.get_next_rank(current_rank)
        end
        local possibilities = {}
        for key, val in pairs(G.P_CARDS) do
            if val.value == current_rank.key then
                table.insert(possibilities, key)
            end
        end
        pseudoshuffle(possibilities, pseudoseed('draft_create'))
        local current_amount = 0
        local j = 1
        while current_amount < 1 do
            local front = G.P_CARDS[ possibilities[(j % #possibilities) + 1] ]
            if suitset[front.suit] ~= nil then
                local center
                if t.enhancements then
                    center = pseudorandom_element(t.enhancements, pseudoseed('draft_enhancement'))
                else
                    center = G.P_CENTERS.c_base
                end
                if t.one_per_suit then
                    suitset[front.suit] = nil
                end
                current_amount = current_amount + 1
                actual_cards[current_amount] = create_playing_card({
                    front = front,
                    center = center
                }, G.deck, nil, j ~= 1, { G.C.SECONDARY_SET.Packet })
                cards[current_amount] = true
            end
            j = j + 1
        end
    end
    playing_card_joker_effects(cards)
    return actual_cards
end

G.FUNCS.packet_effect = function(card, t)
    local created_cards
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        if card.ability.extra.cost ~= 0 then
            ease_dollars(card.ability.extra.cost)
        end
        if not t.nocards then 
            t.amount = card.ability.extra.amount
            if t.straight then
                t.base_amount = card.ability.extra.amount
                created_cards = G.FUNCS.create_playing_cards_in_deck_straight(t)
            elseif t.balanced then
                created_cards = G.FUNCS.create_playing_cards_in_deck_balanced(t)
            else
                created_cards = G.FUNCS.create_playing_cards_in_deck_alt(t)
            end
            if t.link then
                link_cards(created_cards, card.key)
            end
        end
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            G.GAME.starting_deck_size = #G.playing_cards
        end
        return true end }))
    delay(0.6)
end

G.FUNCS.parcel_effect = function(card, t)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        if card.ability.extra.cost ~= 0 then
            ease_dollars(card.ability.extra.cost)
        end
        if not t.nocards then
            G.FUNCS.create_playing_cards_in_deck_balanced(t)
        end
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            G.GAME.starting_deck_size = #G.playing_cards
        end
        return true end }))
    delay(0.6)
end

G.FUNCS.destroy_cards = function(cards)
	for i=1, #cards do
		if cards[i].ability.name == 'Glass Card' then 
			cards[i]:shatter()
		else
			cards[i]:start_dissolve(nil, i == 1)
		end
	end
	for i=1, #G.jokers.cards do
		G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = cards})
	end
end

G.FUNCS.destroy_cards_in_hand = function(t)
	local targets = {}
    if t.amount_selected then
        for index, value in ipairs(G.hand.highlighted) do
            if not value.ability.eternal then
                targets[value] = true
            end
        end
    end
    if t.amount_random then
        local temp_hand = {}
        if t.only_unselected then
            local selected = {}
            for index, value in ipairs(G.hand.highlighted) do
                selected[value] = true
            end
            for index, value in ipairs(G.hand.cards) do
                if not selected[value] then
                    temp_hand[#temp_hand+1] = value
                end
            end
        else
            for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
        end
        table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
        pseudoshuffle(temp_hand, pseudoseed('draft_destroy'))

        local total_added = 0
        local i = 1
        while total_added < t.amount_random do
            if i > #temp_hand then
                break
            end
            if not temp_hand[i].ability.eternal and not targets[temp_hand[i]] then
                if t.no_face and temp_hand[i]:is_face() then
                    goto continue
                end
                targets[temp_hand[i]] = true
                total_added = total_added + 1
            end
            ::continue::
            i = i + 1
        end
    end
    if t.all_cards then
        for index, value in ipairs(G.hand.cards) do
            targets[value] = true
        end
    end
    if t.all_selected then
        for index, value in ipairs(G.hand.highlighted) do
            if not value.ability.eternal then
                targets[value] = true
            end
        end
    end
    if t.all_unselected then
        local selected = {}
        for index, value in ipairs(G.hand.highlighted) do
            selected[value] = true
        end
        for index, value in ipairs(G.hand.cards) do
            if not value.ability.eternal and not selected[value] then
                targets[value] = true
            end
        end
    end
    if t.all_face then
        for index, value in ipairs(G.hand.cards) do
            if not value.ability.eternal and value:is_face() then
                targets[value] = true
            end
        end
    end
    if t.all_below then
        for index, value in ipairs(G.hand.cards) do
            if not value.ability.eternal and value.base.nominal <= t.all_below then
                targets[value] = true
            end
        end
    end
    local cards_to_destroy = {}
    for key, value in pairs(targets) do
        cards_to_destroy[#cards_to_destroy+1] = key
    end
    G.FUNCS.destroy_cards(cards_to_destroy)
end

G.FUNCS.clipper_effect = function(card, t)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        if card.ability.extra.cost ~= 0 then
            ease_dollars(card.ability.extra.cost)
        end
        G.FUNCS.destroy_cards_in_hand(t)
        G.hand:unhighlight_all()
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
      --[[if MagicTheJokering then
        if MagicTheJokering.config.include_clover_suit then
            G.ARGS.LOC_COLOURS.clover = G.C.SUITS[suit_clovers.key]
        end
	    G.ARGS.LOC_COLOURS.Magic = G.C.SET.Magic
      end]]
	  G.ARGS.LOC_COLOURS.packet = G.C.SET.Packet
	  G.ARGS.LOC_COLOURS.parcel = G.C.SET.Parcel
	  G.ARGS.LOC_COLOURS.clipper = G.C.SET.Clipper
	  return lc(_c, _default)
end

G.FUNCS.suit_dist = function (t)
    local suit_table = G.FUNCS.filter_suits(t)
    local suits = {}
    for key, value in pairs(suit_table) do
        suits[value] = 0
    end
    for i = 1, #G.playing_cards do
        for key, value in pairs(suit_table) do
            if G.playing_cards[i]:is_suit(key) then
                suits[value] = suits[value] + 1
            end
        end
    end
    return suits
end

G.FUNCS.popular_suit = function(t)
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
        ret = G.FUNCS.filter_suits(t)
        return ret
    end
end

G.FUNCS.not_popular_suit = function(allow_hidden)
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
        ret = G.FUNCS.filter_suits(t)
    end
    return ret
end

G.FUNCS.least_popular_suit = function(allow_hidden)
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
        if not t.suits then
            t.suits = G.FUNCS.filter_suits(t)
        end
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

G.FUNCS.face_ranks = function()
    local faces = {}
    for _, v in ipairs(SMODS.Rank.obj_buffer) do
        local r = SMODS.Ranks[v]
        if r.face then table.insert(faces, r) end
    end
    return faces
end

enable_exotics = enable_exotics or function()
    if G.GAME then G.GAME.Exotic = true end
end

disable_exotics = disable_exotics or function()
    if G.GAME then G.GAME.Exotic = false end
end
