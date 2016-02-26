hs.hotkey.bind({"shift", "alt", "ctrl"}, "A", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt", "cmd"}, "A", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt", "ctrl"}, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt", "cmd"}, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)



























-- Keyboard shortcuts
hs.hotkey.bind({"shift", "alt"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt"}, "A", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt"}, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt"}, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- f.x = max.x + (max.w / 6.8)
  f.x = max.x + (max.w / 6.9)
  f.y = max.y + (max.h / 10)
  -- f.w = max.w * 0.7058823529
  f.w = max.w * 0.7101449275
  f.h = max.h * 0.8
  win:setFrame(f)
end)

hs.hotkey.bind({"shift", "alt"}, "M", function()
  hs.notify.new({title=hs.spotify.getCurrentTrack(), informativeText=hs.spotify.getCurrentArtist()}):send():release()
end)


-- autonom functions
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/dotfiles/hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send():release()

local homeWifiWatcher = nil
local homeSSID = "UxMKhjCAgTfv"
local lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(50)
        hs.brightness.set(50)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
		    hs.brightness.set(75)
    end

    lastSSID = newSSID
end

homeWifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
homeWifiWatcher:start()


-- Caffeine
local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setIcon("caffeine-on.pdf")
    else
        caffeine:setIcon("caffeine-off.pdf")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end


local usbWatcher = nil
function usbDeviceCallback(data)
    hs.applescript.applescript('delay 2')
    hs.applescript.applescript('tell application "Finder" to if disk "STORE N GO" exists then do shell script "open ~/school/3EHIF/POS; open /Volumes/ENHANCED" activate')
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()


function mysqlworkbenchTerminated(app, eventtype, appObject)
    if (app == "MySQLWorkbench") then
        if (eventtype == hs.application.watcher.terminated) then
            hs.applescript.applescript('do shell script "sudo /Applications/XAMPP/xamppfiles/bin/mysql.server stop" with administrator privileges')
            hs.notify.new({title="Server", informativeText="MySQL server has been stopped"}):send():release()
        elseif (eventtype == hs.application.watcher.launching) then
            hs.applescript.applescript('do shell script "sudo /Applications/XAMPP/xamppfiles/bin/mysql.server start" with administrator privileges')
            hs.notify.new({title="Server", informativeText="MySQL server has been started"}):send():release()
        end
    end
end

local appTerminated = hs.application.watcher.new(mysqlworkbenchTerminated)
appTerminated:start()





--not working yet
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
	local pages = hs.appfinder.appFromName("Pages")

	local pages_default = {"File", "Export To", "PDF..."}
	local default = pages:findMenuItem(pages_default)

	pages:selectMenuItem(pages_default)
	hs.alert.show("done")
end)
