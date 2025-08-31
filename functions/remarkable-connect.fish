function remarkable-connect
  set -l the_iface (ip link show | cut -d" " -f2 | cut -d":" -f1 | grep "u") 
 
  if test -n "$the_iface" 
    echo "Found USB interface $the_iface"
    sudo ip link set $the_iface down 
    sudo dhclient -r $the_iface 
   
    sudo ip link set $the_iface up 
    sudo dhclient $the_iface 

    xdg-open "http://10.11.99.1"
  else 
    echo "Couldn't find USB network interface - is the Remarkable USB sharing on?" 
    return 1 
  end 
end
