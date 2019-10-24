alias amap="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full amap $@"

alias arpspoof="docker run -it --rm --net host -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full arpspoof -i eth0 $@"

alias assetfinder="docker run --rm -i heywoodlh/tomnomnom-tools:latest assetfinder $@"

alias bettercap="docker run -it --privileged --net=host bettercap/bettercap $@"

alias blackwidow="docker run -it blackwidow $@"

alias commix="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full commix $@"

alias dirb="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dirb $@"

alias dnschef="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp --net host booyaabes/kali-linux-full dnschef"

alias dnsenum="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dnsenum $@"

alias dnsmap="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dnsmap $@"

alias dnsrecon="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dnsrecon $@"

alias dnswalk="docker run -it --rm booyaabes/kali-linux-full dnswalk $@"

alias gf="docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c \"cat | gf $@\""

alias gron="docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c \"gron $@\""

alias gscript="mkdir -p ~/Documents/gscript && docker run -it -v /tmp:/tmp -v ~/Documents/gscript:/root/share gen0cide/gscript:v1 $@"

alias hping3="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full hping3 $@"

alias httping="docker run --rm bretfisher/httping $@"

alias httprobe="docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c \"cat | httprobe $@\""

alias hydra="docker run --rm --net host -v $(pwd):/data -v /tmp:/tmp --privileged booyaabes/kali-linux-full hydra $@"

alias inception="docker run  --rm -i -w /data -v $(pwd):/data -v /tmp:/tmp nateysmith/bugbountytools:latest bash -c \"inception $@\""

alias openvas="docker run -d -p 443:443 -p 9390:9390 --name openvas mikesplain/openvas"

alias kali="docker run -it --rm --net host --privileged -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority booyaabes/kali-linux-full /bin/bash $@"

alias masscan="docker run --rm --net host -v $(pwd):/data -v /tmp:/tmp --privileged heywoodlh/telnet masscan $@"

alias medusa="docker run -i --rm booyaabes/kali-linux-full medusa $@"

alias msfconsole="docker run -it --rm --net host  -v ~/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data booyaabes/kali-linux-full msfconsole $@"

alias msfvenom="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full msfvenom $@"

alias nc="docker run --rm -i --net host heywoodlh/telnet nc $@"

alias ndiff="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full ndiff $@"

alias netcat="docker run --rm -i --net host heywoodlh/telnet nc $@"

alias netdiscover="docker run -it --rm --net host -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full netdiscover $@"

alias nikto="docker run -it --rm --net host -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full nikto $@"

alias nmap="docker run --rm --net host --privileged booyaabes/kali-linux-full nmap $@"

alias padbuster="docker run -it --rm booyaabes/kali-linux-full padbuster $@"

alias reaver="docker run -it --rm --net host --privileged -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full reaver $@"

alias responder="docker run -it --rm --net host booyaabes/kali-linux-full responder $@"

alias searchsploit="docker run --rm booyaabes/kali-linux-full searchsploit $@"

alias setoolkit="docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full setoolkit $@"

alias sniper="docker run --rm -ti menzo/sn1per-docker sniper $@"

alias sqlmap="docker run -it --rm --net host -w /data -v ~/.sqlmap:/root/.sqlmap -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full sqlmap $@"

alias socat="docker run --rm -w /data -v $(pwd):/data -v /tmp:/tmp --net host booyaabes/kali-linux-full socat $@"

alias telnet="docker run --rm -i heywoodlh/telnet telnet $@"

alias theharvester="docker run --rm -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full theharvester $@"

alias tshark="docker run --rm -w /data -v $(pwd):/data -v /tmp:/tmp --net host --privileged booyaabes/kali-linux-full tshark $@"

alias unfurl="docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c \"cat | unfurl $@\""

alias urlscan="docker run --rm -i -v ~/.urlscan:/root/.urlscan heywoodlh/urlscan-py:latest urlscan $@"

alias volafox="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full volafox $@"

alias volatility="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full volatility $@"

alias vulnscan="docker run --rm --net host --privileged booyaabes/kali-linux-full nmap -sV --script=vulscan/vulscan.nse $@"

alias wash="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp --net host --privileged booyaabes/kali-linux-full wash $@"

alias waybackurls="docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c \"cat | waybackurls $@\""

alias webscarab="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host booyaabes/kali-linux-full java -jar /usr/bin/webscarab $@"

alias wpscan="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full wpscan $@"

alias yersinia="docker run -it --rm -w /data -v $(pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full yersinia $@"

alias zaproxy="docker run -it --rm -v ~/.ZAP:/root/.ZAP -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host booyaabes/kali-linux-full zaproxy $@"
