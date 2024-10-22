util.AddNetworkString("Kieran.AddText")

Kieran = Kieran or {}

function Kieran.AddText(ply, ...)
    local args = {...}
    net.Start("Kieran.AddText")
    net.WriteUInt(#args, 4)
    for k, v in pairs(args) do
        if (k % 2) == 0 then
            net.WriteString(v)
        else
            net.WriteColor(v)
        end
    end
    if IsValid(ply) then
        net.Send(ply)
    else
        net.Broadcast()
    end
end
