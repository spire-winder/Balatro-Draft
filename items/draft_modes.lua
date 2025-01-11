-- Draft Mode BASE CLASS & METHODS

Draft.Draft_Mode = SMODS.Center:extend {
    class_prefix = "mode",
    discovered = false,
    unlocked = true,
    set = "Draft_Mode",
    config = {},
    required_params = { "key" },
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

-- Draft Mode Object Declaration

Draft.Draft_Mode {
    key = "casl_none",
    name = "Standard Deck",
    atlas = "pack_atlas",
    pos = { x = 4, y = 3 },
    config = {},
}

Draft.Draft_Mode({
	key = "draft",
	name = "draft-mode-draft",
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

-- Local Functions

local function tprint(tbl, max_indent, _indent)
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

-- Global Functions

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
    G.viewed_mode = G.viewed_mode or "mode_draft_casl_none"

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
        output.draft_selected_mode = "mode_draft_casl_none"
    end
    return output
end

local old_uidef_run_setup_option = G.UIDEF.run_setup_option
function G.UIDEF.run_setup_option(_type)
    local output = old_uidef_run_setup_option(_type)
    if _type == "Continue" then
        G.viewed_mode = "mode_draft_casl_none"
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
        G.viewed_mode = G.PROFILES[G.SETTINGS.profile].MEMORY.draft_mode or G.viewed_mode or "mode_draft_casl_none"
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

local old_Back_apply_to_run = Back.apply_to_run
function Back:apply_to_run(...)
    local mode_center = Draft.Draft_Mode:get_obj(G.GAME.draft_selected_mode or "mode_draft_casl_none")
    old_Back_apply_to_run(self, ...)
    if mode_center.apply then
        mode_center:apply()
    end
end