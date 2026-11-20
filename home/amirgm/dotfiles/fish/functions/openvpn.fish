function vpn-on
    nmcli connection up id "amir" --ask
end

function vpn-off
    nmcli connection down id "amir"
end

function vpn-status
    nmcli -f NAME,TYPE,DEVICE connection show --active
end
