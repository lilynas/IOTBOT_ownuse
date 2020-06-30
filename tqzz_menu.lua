local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
if string.find(data.Content, "天气之子") == 1 then
    luaRes =
    Api.Api_SendMsg(
					CurrentQQ,
					    {
					    toUser = data.FromGroupId, --回复当前消息的来源群ID
					    sendToType = 2, --2发送给群1发送给好友3私聊
					    sendMsgType = "TextMsg", --进行文本复读回复
					    groupid = 0, --不是私聊自然就为0咯
					    content = "如何使用天气之子？\n"..
                        "1.雷达图查询：华北、华中、华南、西北、西南、东北、东南雷达图\n"..
                        "2.气象云图\n"..
                        "2.1:太平洋真彩色\n"..
                        "2.2:太平洋红外图\n"..
                        "2.3:中国真彩色\n"..
                        "3.中国降水图\n"..
                        "4.待添加\n", --回复内容
					    atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
					)
		end
    return 1
end
