local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
	function ReceiveFriendMsg(CurrentQQ, data)
		return 1
	end
    if string.find(data.Content, "向日葵8号") then
        response, error_message =
            http.request(
            "GET",
            "http://gps.spianmo.com/api/index.php" --从官方json接口获取图像列表
        )
        local html = response.body
        local image = json.decode(html)
        local img_url = image["image_url"]

    ApiRet = 
		Api.Api_SendMsg(--调用发消息的接口
		    CurrentQQ,
		    {
		        toUser = data.FromGroupId, --回复当前消息的来源群ID
		        sendToType = 2, --2发送给群1发送给好友3私聊
		        sendMsgType = "PicMsg", --进行文本复读回复
		        groupid = 0, --不是私聊自然就为0咯
		        content = "欢迎欣赏地球", --回复内容
				picUrl = img_url,
				picBase64Buf = "",
				fileMd5 = "",
		        atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
		    }
        )
end
if string.find(data.Content, "太平洋水温") then
    local day = os.date("%d",os.time())
    local img_url = "https://weather-models.info/latest/images/sea/"..day.."/wpac-sst.png"
    ApiRet = 
		Api.Api_SendMsg(--调用发消息的接口
		    CurrentQQ,
		    {
		        toUser = data.FromGroupId, --回复当前消息的来源群ID
		        sendToType = 2, --2发送给群1发送给好友3私聊
		        sendMsgType = "PicMsg", --进行文本复读回复
		        groupid = 0, --不是私聊自然就为0咯
		        content = "已获取今天份的水温图（每日15时更新，过早获取将获得上月的水温图）", --回复内容
				picUrl = img_url,
				picBase64Buf = "",
				fileMd5 = "",
		        atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
		    }
        )
end
    return 1
end
