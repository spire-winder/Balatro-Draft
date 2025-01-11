SMODS.current_mod.config_tab = function()
    local scale = 5/6
    return {n=G.UIT.ROOT, config = {align = "cl", minh = G.ROOM.T.h*0.25, padding = 0.0, r = 0.1, colour = G.C.GREY}, nodes = {
        {n = G.UIT.R, config = { padding = 0.05 }, nodes = {
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, nodes = {
                create_toggle{ label = localize("allow_any_draft_mode_selection"), info = localize("allow_any_draft_mode_selection_desc"), active_colour = Draft.badge_colour, ref_table = Draft.config, ref_value = "allow_any_draft_mode_selection" }
            }}
        }}
    }}
end