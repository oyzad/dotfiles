-- Grid sizes per level
local keySets = {
  {'a','s','d','f','g','h','j','k','l',';'}, -- 10x10
  {'a','s','d','f','g'},                    -- 5x5                
}

local overlays, labels = {}, {}
local listener = nil
local input = ""
local depth = 0
local maxDepth = #keySets
local currentBounds = nil

-- Draw and clear overlay
local function clearAll()
  for _, d in ipairs(overlays) do d:delete() end
  for _, t in ipairs(labels) do t:delete() end
  overlays, labels = {}, {}
end

-- Bounds calculation
local function getCellBounds(bounds, col, row, gridSize)
  local cellW = bounds.w / gridSize
  local cellH = bounds.h / gridSize
  return {
    x = bounds.x + (col - 1) * cellW,
    y = bounds.y + (row - 1) * cellH,
    w = cellW,
    h = cellH
  }
end

-- Draw grid based on current key set
local function drawGrid(bounds, keySet)
  clearAll()
  local gridSize = #keySet
  local keyIndex = {}
  for i, k in ipairs(keySet) do keyIndex[k] = i end

  for col = 1, gridSize do
    for row = 1, gridSize do
      local x = bounds.x + (col - 1) * bounds.w / gridSize
      local y = bounds.y + (row - 1) * bounds.h / gridSize
      local code = keySet[col] .. keySet[row]

      local rect = hs.drawing.rectangle(hs.geometry.rect(x, y, bounds.w / gridSize, bounds.h / gridSize))
      rect:setStrokeColor({red=1, green=0, blue=0, alpha=0.5})
      rect:setFillColor({red=1, green=1, blue=1, alpha=0.05})
      rect:setStrokeWidth(1)
      rect:setLevel("overlay")
      rect:show()
      table.insert(overlays, rect)

      local label = hs.drawing.text(hs.geometry.rect(x + 5, y + 5, 50, 20), code)
      label:setTextColor({red=1, green=0, blue=0})
      label:setTextSize(16)
      label:setLevel("overlay")
      label:show()
      table.insert(labels, label)
    end
  end
end

-- Move mouse
local function clickAtCenter(bounds)
  local point = { x = bounds.x + bounds.w / 2, y = bounds.y + bounds.h / 2 }

  -- Move mouse
  hs.mouse.setAbsolutePosition(point)

  -- Simulate left click
  hs.eventtap.leftClick(point)

  -- Optional: visual indicator
  hs.alert.show("Clicked!")
end




-- Input handler
local function handleInput(char)
  local keySet = keySets[depth + 1]
  local keyIndex = {}
  for i, k in ipairs(keySet) do keyIndex[k] = i end

  if not keyIndex[char] then return end
  input = input .. char
  if #input == 2 then
    local col = keyIndex[input:sub(1,1)]
    local row = keyIndex[input:sub(2,2)]
    if col and row then
      currentBounds = getCellBounds(currentBounds, col, row, #keySet)
      depth = depth + 1
      if depth >= maxDepth then
        clickAtCenter(currentBounds)
        stopGridMode()
        return
      else
        drawGrid(currentBounds, keySets[depth + 1])
        input = ""
      end
    end
  end
end

-- Start grid mode
local function startGridMode()
  input = ""
  depth = 0
  currentBounds = hs.screen.mainScreen():frame()
  drawGrid(currentBounds, keySets[1])

  listener = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
    local char = e:getCharacters():lower()
    handleInput(char)
    return true
  end)
  listener:start()
end

-- Stop
function stopGridMode()
  if listener then listener:stop(); listener = nil end
  clearAll()
end

-- Hotkey to start: Ctrl + Alt + H
hs.hotkey.bind({"ctrl", "alt"}, "G", function()
  startGridMode()
end)
