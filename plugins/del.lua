﻿--Start
local function delmsg (arg,data)
    for k,v in pairs(data.messages_) do
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
    end
end
local function run(msg, matches)
    local chat_id = msg.chat_id_
    local msg_id = msg.id_
    if matches[1] == 'del' then
        if tostring(chat_id):match("^-999") then 
            if is_owner(msg) then
                if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
                    return  '🚫 *999*> _تعداد پیام های قابل حذف هر دفعه_ >*1* 🚫'
                else
                    tdcli.getChatHistory(chat_id, msg_id, 0, tonumber(matches[2]), delmsg, nil)
                    return '*'..matches[2]..'* _ @sudo_wolf پیام اخیر پاک شدند ساخته شده توسط  _'
                end
            end
        else
            return '_ ساخته شده توسط @@sudo_wolf در سوپرگروه ممکن است ساخته شده توسط _'
        end
    end
end

return {
    patterns = {
        '^[!#/]([Dd][Ee][Ll]) (%d*)$',
    },
    run = run
}
--End
--Channel @LuaError
