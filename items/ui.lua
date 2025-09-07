SMODS.current_mod.config_tab = function()
    local scale = 5/6
    return {n=G.UIT.ROOT, config = {align = "cl", minh = G.ROOM.T.h*0.25, padding = 0.0, r = 0.1, colour = G.C.GREY}, nodes = {
        {n = G.UIT.R, config = { padding = 0.05 }, nodes = {
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, nodes = {
                create_toggle{ label = localize("neutral_packet_collation"), info = localize("neutral_packet_collation_desc"), active_colour = Draft.badge_colour, ref_table = Draft.config, ref_value = "neutral_packet_collation" },
                create_toggle{ label = localize("soul_cards"), info = localize("soul_cards_desc"), active_colour = Draft.badge_colour, ref_table = Draft.config, ref_value = "soul_cards" },
                create_toggle{ label = localize("include_in_run"), info = localize("include_in_run_desc"), active_colour = Draft.badge_colour, ref_table = Draft.config, ref_value = "include_in_run" }
            }}
        }}
    }}
end