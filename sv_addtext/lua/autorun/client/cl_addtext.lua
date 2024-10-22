net.Receive("Kieran.AddText", function(len)
    local args = {}
    local amt = net.ReadUInt(4)
    for i = 1, amt do
        table.insert(args, net.ReadColor())
        table.insert(args, net.ReadString())
    end
    chat.AddText(unpack(args))
    --print("Network string length in bits: " .. tostring(len))
end)