emojiPal = {}

local json = require("hs.json")
local hotkey = require("hs.hotkey")
local alert = require("hs.alert")
local chooser = require("hs.chooser")
local pasteboard = require("hs.pasteboard")
local eventtap = require("hs.eventtap")

local emojiList = {}
local chooserRef = nil

function emojiPal.loadEmojis()
	local file = io.open(hs.configdir .. "/emojis.json", "r")
	if not file then
		alert.show("emojiPal: emojis.json not found!")
		return
	end

	local content = file:read("*a")
	file:close()

	local parsed = json.decode(content)
	for name, url in pairs(parsed) do
		table.insert(emojiList, {
			text = name,
			subText = url,
			url = url,
		})
	end
end

function emojiPal.activate()
	if #emojiList == 0 then
		emojiPal.loadEmojis()
	end

	chooserRef = chooser.new(function(choice)
		if not choice then
			return
		end
		pasteboard.setContents(choice.url)
		hs.eventtap.keyStroke({ "cmd" }, "v")
		hs.eventtap.keyStroke({}, "return")
	end)

	chooserRef:searchSubText(true)
	chooserRef:choices(emojiList)
	chooserRef:show()
end

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "E", function()
	emojiPal.activate()
end)
