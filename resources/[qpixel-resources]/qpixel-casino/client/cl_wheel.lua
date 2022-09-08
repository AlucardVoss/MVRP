-- local _wheel = nil
-- local _lambo = nil
-- local _isShowCar = false
-- local _wheelPos = vector3(1109.76, 227.89, -49.64)
-- local _baseWheelPos = vector3(1111.05, 229.81, -50.38)

AddEventHandler("qpixel-casino:wheel:toggleEnable", function()
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "casino" } })
  if not jobAccess then
    TriggerEvent("DoLongHudText", "You cannot do that", 2)
    return
  end
  RPC.execute("qpixel-casino:wheel:toggleEnabled")
end)

AddEventHandler("qpixel-casino:wheel:spinWheel", function()
  print('SPIN WHEEL')
  if not hasMembership(false) then
    TriggerEvent("DoLongHudText", "You must have a membership", 2)
    return
  end
  -- local info = (exports["qpixel-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
  -- RPC.execute("qpixel-casino:wheel:spinWheel", false, json.decode(info.information).state_id)
  TriggerServerEvent("qpixel-luckywheel:getLucky")
end)

AddEventHandler("qpixel-casino:wheel:spinWheelTurbo", function()
  if not hasMembership(false) then
    TriggerEvent("DoLongHudText", "You must have a membership", 2)
    return
  end
  local info = (exports["qpixel-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
  RPC.execute("qpixel-casino:wheel:spinWheel", true, json.decode(info.information).state_id)
end)

