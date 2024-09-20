atl_server_join_message = {}
atl_server_join_message.modpath = minetest.get_modpath("atl_server_join_message")
atl_server_join_message.join_msg_color = "#28b91c"
atl_server_join_message.leave_msg_color = "#e21717"

function atl_server_join_message.load_file(path)
    local status, err = pcall(dofile, path)
    if not status then
        minetest.log("error", "-!- Failed to load file: " .. path .. " - Error: " .. err)
    else
        minetest.log("action", "-!- Successfully loaded file: " .. path)
    end
end

if atl_server_join_message.modpath then
    local files_to_load = {
        "script/api.lua",
    }

    for _, file in ipairs(files_to_load) do
        atl_server_join_message.load_file(atl_server_join_message.modpath .. "/" .. file)
    end
else
    minetest.log("error", "-!- Files in " .. atl_server_join_message.modpath .. " mod are not set or valid.")
end
