function atl_server_join_message.get_player_count()
    return #minetest.get_connected_players()
end

function atl_server_join_message.send_colored_chat_message(color, message)
    minetest.chat_send_all(minetest.colorize(color, message))
end

function atl_server_join_message.format_join_message(player_name, player_count)
    return string.format("*** %s joined the game | Clients: (%d)", player_name, player_count)
end

function atl_server_join_message.format_leave_message(player_name, reason, player_count)
    return string.format("*** %s left the game %s | Clients: (%d)", player_name, reason, player_count)
end

function minetest.send_join_message(player_name)
    if not core.is_singleplayer() then
        local player_count = atl_server_join_message.get_player_count()
        local message = atl_server_join_message.format_join_message(player_name, player_count)
        atl_server_join_message.send_colored_chat_message(atl_server_join_message.join_msg_color, message)
    end
end

function minetest.send_leave_message(player_name, timed_out)
    local player_count = atl_server_join_message.get_player_count() - 1
    local reason = timed_out and " (Timed out)" or ""
    local message = atl_server_join_message.format_leave_message(player_name, reason, player_count)
    atl_server_join_message.send_colored_chat_message(atl_server_join_message.leave_msg_color, message)
end