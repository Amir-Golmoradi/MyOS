function vpn-status
    nmcli -f NAME,TYPE,DEVICE connection show --active
end
