local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")
local hour = (os.date("%H",os.time())) - 9
local date = os.date("%Y%m%d",os.time())
if hour < 10 then
    hour = "0"..hour..""
end

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUserId == 1606270092 then
        return 1
    end
    if string.find(data.Content, "风云四号") then
        local img_url = "http://img.nsmc.org.cn/PORTAL/FY4/IMG/FY4A/AGRI/IMG/DISK/MTCC/NOM/FY4A-_AGRI--_N_DISK_1047E_L1C_MTCC_MULT_NOM_"..date..""..hour.."0000_"..date..""..hour.."1459_1000M_V0001.JPG"
        ApiRet = 
            Api.Api_SendMsg(--调用发消息的接口
                CurrentQQ,
                {
                    toUser = data.FromGroupId, --回复当前消息的来源群ID
                    sendToType = 2, --2发送给群1发送给好友3私聊
                    sendMsgType = "PicMsg", --进行文本复读回复
                    groupid = 0, --不是私聊自然就为0咯
                    content = "已获取"..date.."-"..min.."的红外线云图（数据来自向日葵8号）", --回复内容
                    picUrl = img_url,
                    picBase64Buf = "",
                    fileMd5 = "",
                    atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
                }
            )
end
    return 1
end