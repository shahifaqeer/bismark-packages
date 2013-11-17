m = Map("sazo", "SAZO")
m.on_after_commit = function()
    --luci.sys.call("/tmp/etc/init.d/bismark-passive restart")
end

s = m:section(TypedSection, "devices", "")
s.anonymous = true
s:tab("devices", "Devices in Home")
en = s:taboption("devices", Flag, "enabled", "Enable redirection of devices", "If enabled, we will redirect all traffic from your device to Comcast's VPN if malware activity is detected. You may uncheck it to stop the redirection.")
en.rmempty = false
domain = s:taboption("devices", DynamicList, "MAC address", "Redirected")
domain.datatype = "host"

return m -- Returns the map
