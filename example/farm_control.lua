os.loadAPI("button")
m = peripheral.wrap("left")
m.clear()
signal = 0

function initButton(name, signal_id, callback, x, y)
  button.setTable(name, callback, x, x + 10, y, y + 2)
  button.setUserData(name, "signal_id", signal_id)
end

function initAll()
  button.initMonitor("left")
  button.heading("Farms control")

  initButton("wool", 1, onButton, 10, 3)
  initButton("ink sacks", 2, onButton, 22, 3)
  initButton("fish", 4, onButton, 10, 8)
  initButton("f&l-eather", 8, onButton, 22, 8)
  initButton("fert & xp", 16, onButton, 10, 12)

  button.screen()
end

function onButton(name)
  button.toggleButton(name)
  updateSignal(button.isActive(name), button.userData(name, "signal_id"))
  redstone.setBundledOutput("back", signal)
end
 
function updateSignal(bool, signal_id)
  if bool then
    signal = signal + signal_id
  else
    signal = signal - signal_id
  end
end

initAll()
button.mainLoop()
