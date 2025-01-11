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
        if not t.nocards then 
            t.amount = card.ability.extra.amount
            G.FUNCS.create_playing_cards_in_deck(t)
            if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
                G.GAME.starting_deck_size = #G.playing_cards
            end
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
      --[[if MagicTheJokering then
	    G.ARGS.LOC_COLOURS.Magic = G.C.SET.Magic
      end]]
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

--[[local function tprint(tbl, max_indent, _indent)
    if type(tbl) ~= "table" then return tostring(tbl) end

    max_indent = max_indent or 16
    _indent = _indent or 0
    local toprint = string.rep(" ", _indent) .. "{\r\n"

    _indent = _indent + 2
    for k, v in pairs(tbl) do
        local key_str, value_str
        if type(k) == "number" then
            key_str = "[" .. k .. "]"
        else
            key_str = tostring(k)
        end
        if type(v) == "string" then
            if k == "content" then
                value_str = "..."
            else
                value_str = '"' .. v .. '"'
            end
        elseif type(v) == "table" and _indent <= max_indent then
            value_str = tostring(v) .. tprint(v, max_indent, _indent)
        else
            value_str = tostring(v)
        end
        toprint = toprint .. string.rep(" ", _indent) .. key_str .. " = " .. value_str .. ",\r\n"
    end

    return toprint .. string.rep(" ", _indent - 2) .. "}"
end

Draft.game_args = {}

local old_Game_start_run = Game.start_run
function Game:start_run(args)
    -- because G.GAME.challenge only gets defined _after_ `:init_game_object`
    Draft.game_args = args
    old_Game_start_run(self, args)
end

local function find_draft_mode(area)
    -- return (index, card) or nil
    -- loop safeguard in case some other mod decides to modify this (which would be dumb, but we did it, so...)
    for i, v in pairs(area.cards) do
        if v.params.draft_mode then
            return i, v
        end
    end
end

local function get_draft_mode_win_sticker(mode_key)
    local profile = G.PROFILES[G.SETTINGS.profile]
    if profile.draft_mode_usage and profile.draft_mode_usage[mode_key] and profile.draft_mode_usage[mode_key].wins_by_key then
        local _stake = nil
		for key, _ in pairs(profile.draft_mode_usage[mode_key].wins_by_key) do
			if (G.P_STAKES[key] and G.P_STAKES[key].stake_level or 0) > (_stake and G.P_STAKES[_stake].stake_level or 0) then
				_stake = key
			end
		end
		if _stake then
            return G.sticker_map[_stake]
        end
    end
end

function G.FUNCS.change_draft_mode(args)
    local mode_center = G.P_CENTER_POOLS.Draft_Mode[args.to_key]
    G.viewed_mode = mode_center.key
    G.PROFILES[G.SETTINGS.profile].MEMORY.draft_mode = mode_center.key
    if mode_center["loc_vars"] then
        mode_center:loc_vars()
    end
end

function G.UIDEF.draft_mode_description(mode_key, minw)
    minw = minw or 5.5
    local mode_center = Draft.Draft_Mode:get_obj(mode_key)
    local ret_nodes = {}
    local mode_name = ""
    if mode_center then
        mode_name = mode_center:get_name()
        mode_center:generate_ui({}, nil, ret_nodes, nil, {name = {}})
    else
        mode_name = "ERROR"
        ret_nodes = {
            {{
                config = { scale= 0.32, colour = G.C.BLACK, text= localize('mode_not_found_error'), },
                n= 1,
            }},
            {{
                config = { scale= 0.32, colour = G.C.BLACK, text= "(DEBUG: key = '" .. tprint(G.viewed_mode) .. "')", },
                n= 1,
            }},
        }
    end

    local desc_t = {}
    for _, v in ipairs(ret_nodes) do
        for k2, v2 in pairs(v) do
            if v2["config"] ~= nil and v2["config"]["scale"] ~= nil then
                v[k2].config.scale = v[k2].config.scale / 1.2
            end
        end
        desc_t[#desc_t + 1] = { n = G.UIT.R, config = { align = "cm", maxw = 5.3 }, nodes = v }
    end

    return {
        n = G.UIT.C,
        config = { align = "cm", padding = 0.05, r = 0.1, colour = G.C.L_BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0 },
                nodes = {
                    { n = G.UIT.T, config = { text = mode_name, scale = 0.35, colour = G.C.WHITE } }
                }
            },
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.03, colour = G.C.WHITE, r = 0.1, minh = 1, minw = minw },
                nodes = desc_t
            }
        }
    }
end

function G.UIDEF.draft_mode_option(_type)
    local middle = {
        n = G.UIT.R,
        config = { align = "cm", minh = 1.7, minw = 7.3 },
        nodes = {
            { n = G.UIT.O, config = { id = nil, func = 'RUN_SETUP_check_draft_mode2', object = Moveable() } },
        }
    }
    local current_draft_mode_index = 1
    local draft_options = {}
    for i, v in pairs(G.P_CENTER_POOLS.Draft_Mode) do
        -- if v.unlocked then
        table.insert(draft_options, v)
        if v.key == G.viewed_mode then
            current_draft_mode_index = i
        end
    end

    return {
        n = G.UIT.ROOT,
        config = { align = "tm", colour = G.C.CLEAR, minw = 8.5 },
        nodes = { _type == 'Continue' and middle or create_option_cycle({
            options = draft_options,
            opt_callback = 'change_draft_mode',
            current_option = current_draft_mode_index,
            colour = G.C.RED,
            w = 6,
            mid = middle
        }) }
    }
end

function G.UIDEF.viewed_draft_mode_option()
    G.viewed_mode = G.viewed_mode or "draft_mode_casl_none"

    return {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.BLACK, r = 0.1, minw = 7.23 },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "cm", padding = 0 },
                nodes = {
                    { n = G.UIT.T, config = { text = "Draft Mode", scale = 0.3, colour = G.C.L_BLACK } }
                }
            },
            {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.1 },
                nodes = {
                    G.UIDEF.draft_mode_description(G.viewed_mode, 5.5)
                }
            }
        }
    }
end

G.FUNCS.RUN_SETUP_check_draft_mode = function(e)
    if (G.GAME.viewed_back.name ~= e.config.id) then
        e.config.object:remove()
        e.config.object = UIBox {
            definition = G.UIDEF.draft_mode_option(G.SETTINGS.current_setup),
            config = { offset = { x = 0, y = 0 }, align = 'tmi', parent = e }
        }
        e.config.id = G.GAME.viewed_back.name
    end
end

G.FUNCS.RUN_SETUP_check_draft_mode2 = function(e)
    if (G.viewed_mode ~= e.config.id) then
        e.config.object:remove()
        e.config.object = UIBox {
            definition = G.UIDEF.viewed_draft_mode_option(),
            config = { offset = { x = 0, y = 0 }, align = 'cm', parent = e }
        }
        e.config.id = G.viewed_mode
    end
end

local old_Game_init_game_object = Game.init_game_object
function Game:init_game_object(...)
    local output = old_Game_init_game_object(self, ...)
    local is_challenge = Draft.game_args.challenge and Draft.game_args.challenge.id  -- HouseRules compat
    if not is_challenge then
        output.draft_selected_mode = G.viewed_mode or "draft_mode"
    elseif is_challenge and Draft.game_args.challenge.draft_mode then
        output.draft_selected_mode = Draft.game_args.challenge.draft_mode
    else
        output.draft_selected_mode = "draft_mode_casl_none"
    end
    return output
end

local old_uidef_run_setup_option = G.UIDEF.run_setup_option
function G.UIDEF.run_setup_option(_type)
    local output = old_uidef_run_setup_option(_type)
    if _type == "Continue" then
        G.viewed_mode = "draft_mode_casl_none"
        if G.SAVED_GAME ~= nil then
            G.viewed_mode = saved_game.GAME.draft_selected_mode or G.viewed_mode
        end
        table.insert(output.nodes, 2,
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.05, minh = 1.65 },
                nodes = {
                    {n=G.UIT.O,
                     config={id = nil, func = 'RUN_SETUP_check_draft_mode', insta_func = true, object = Moveable() }
                    }
                }
            })
    elseif _type == "New Run" then
        G.viewed_mode = G.PROFILES[G.SETTINGS.profile].MEMORY.draft_mode or G.viewed_mode or "draft_mode_casl_none"
        table.insert(output.nodes, 2,
            {
                n = G.UIT.R,
                config = { align = "cm", minh = 1.65, minw = 6.8 },
                nodes = {
                    {
                        n = G.UIT.O,
                        config = { id = nil, func = 'RUN_SETUP_check_draft_mode', insta_func = true, object = Moveable() }
                    }
                }
            })
    else
        print("Unexpected value for _type = " .. tprint(_type))
    end
    return output
end

SMODS.current_mod.config_tab = function()
    local scale = 5/6
    return {n=G.UIT.ROOT, config = {align = "cl", minh = G.ROOM.T.h*0.25, padding = 0.0, r = 0.1, colour = G.C.GREY}, nodes = {
        {n = G.UIT.R, config = { padding = 0.05 }, nodes = {
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, nodes = {
                create_toggle{ label = localize("allow_any_draft_mode_selection"), info = localize("allow_any_draft_mode_selection_desc"), active_colour = Draft.badge_colour, ref_table = Draft.config, ref_value = "allow_any_draft_mode_selection" }
            }}
        }}
    }}
end]]