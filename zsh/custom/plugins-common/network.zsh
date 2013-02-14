### Networking

alias dns-flush="sudo killall -HUP mDNSResponder"

alias vpn-gap="sshuttle -r ecomsoa@10.27.15.23 --dns 0/0"

VPNMAC="a4:ba:db:04:eb:ee"

function vpn-mac-hijack()
{
    iface="${1:-en0}"
    sudo ifconfig $iface ether $VPNMAC
}

function swap-mac()
{
    en0=$(ifconfig en0 | grep ether | cut -d " " -f 2)
    en1=$(ifconfig en1 | grep ether | cut -d " " -f 2)
    sudo ifconfig en0 ether $en1
    sudo ifconfig en1 ether $en0

    echo "New en0: $en1"
    echo "New en1: $en0"
}

