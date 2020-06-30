local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")
local unrealtime = os.time()-1800
local min = (math.floor((os.date("%M",unrealtime)/10)))*10
local date = os.date("%Y-%m-%d-%H",unrealtime)

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUserId == 1606270092 then
        return 1
    end
    if string.find(data.Content, "太平洋红外线") then
        local img_url = "https://www.cwb.gov.tw/Data/satellite/FDK_IR1_CR_2750/FDK_IR1_CR_2750-"..date.."-"..min..".jpg"
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
    if string.find(data.Content, "太平洋真彩色") then
        local img_url_2 = "https://www.cwb.gov.tw/Data/satellite/FDK_VIS_TRGB_2750/FDK_VIS_TRGB_2750-"..date.."-"..min..".jpg"
         ApiRet = 
         Api.Api_SendMsg(--调用发消息的接口
            CurrentQQ,
            {
                toUser = data.FromGroupId, --回复当前消息的来源群ID
                sendToType = 2, --2发送给群1发送给好友3私聊
                sendMsgType = "PicMsg", --进行文本复读回复
                groupid = 0, --不是私聊自然就为0咯
                content = "已获取"..date.."-"..min.."的真彩色云图（数据来自向日葵8号）", --回复内容
                picUrl = img_url_2,
                picBase64Buf = "",
                fileMd5 = "",
                atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
            }
        )
     end
    return 1
end