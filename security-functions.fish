function amap
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full amap $argv
end

function arpspoof
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full arpspoof -i eth0 $argv
end 

function assetfinder
  docker run --rm -i heywoodlh/tomnomnom-tools:latest assetfinder $argv
end

function bettercap
  docker run -it --privileged --net=host bettercap/bettercap $argv
end

function blackwidow
    docker run -it blackwidow $argv
end

function commix
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full commix $argv
end

function dirb
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dirb $argv
end

function dnschef
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host booyaabes/kali-linux-full dnschef
end

function dnsenum
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dnsenum $argv
end

function dnsmap
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dnsmap $argv
end

function dnsrecon
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full dnsrecon $argv
end

function dnswalk
  docker run -it --rm booyaabes/kali-linux-full dnswalk $argv
end

function fsociety
  set working_dir (pwd)
  git clone https://github.com/Manisso/fsociety ~/.fsociety
  cd ~/.fsociety
  docker-compose build
  docker-compose up -d
  docker-compose exec fsociety fsociety
  cd "$working_dir"
end

function fsociety-poweroff
  set working_dir (pwd)
  cd ~/.fsociety
  docker-compose down
  cd "$working_dir"
end

function geoiplookup
    curl ipinfo.io/"$argv[1]"
end

function gf
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | gf $argv"
end

function gobuster
  set secListDir ~/git/seclists
  if test ! -d $secListDir
    mkdir -p $secListDir
    git clone https://github.com/danielmiessler/SecLists $secListDir
  end
  docker run --rm -i -w /data -v $secListDir:/data nateysmith/bugbountytools:latest bash -c "gobuster $argv"
end

function gron
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "gron $argv"
end

function gscript
  mkdir -p ~/Documents/gscript
  docker run -it -v /tmp:/tmp -v ~/Documents/gscript:/root/share gen0cide/gscript:v1 $argv
end

function hping3
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full hping3 $argv
end

function httping
  docker run --rm bretfisher/httping $argv
end

function httprobe
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | httprobe $argv"
end

function hydra
  docker run --rm --net host -v (pwd):/data -v /tmp:/tmp --privileged booyaabes/kali-linux-full hydra $argv
end

function inception
  docker run  --rm -i -w /data -v (pwd):/data -v /tmp:/tmp nateysmith/bugbountytools:latest bash -c "inception $argv"
end

function openvas
  docker run -d -p 443:443 -p 9390:9390 --name openvas mikesplain/openvas
end

function kali
  docker run -it --rm --net host --privileged -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority booyaabes/kali-linux-full /bin/bash $argv
end

function masscan
  docker run --rm --net host -v (pwd):/data -v /tmp:/tmp --privileged heywoodlh/telnet masscan $argv
end

function medusa
  docker run -i --rm booyaabes/kali-linux-full medusa
end

function meg
  if test -z $argv[1]; or test -z $argv[2]
    echo 'meg [path|pathsFile] [hostsFile] [outputDir]'
  else
    set pathsFile $argv[1]
    set hostsFile $argv[2]
    if test -z $argv[3]
      set outDir 'out'
      if test ! -f $outDir
        mkdir -p $outDir
      end
    else
      set outDir $argv[3]
    end
    if test -f $pathsFile
      docker run -v $pathsFile:/tmp/paths -v $hostsFile:/tmp/hosts -v $outDir:/tmp/outDir --rm -i heywoodlh/tomnomnom-tools:latest meg /tmp/paths /tmp/hosts /tmp/outDir $argv[4..20]
    else
      docker run -v $hostsFile:/tmp/hosts -v $outDir:/tmp/outDir --rm -i heywoodlh/tomnomnom-tools:latest meg $pathsFile /tmp/hosts /tmp/outDir $argv[4..20]
    end
  end
end

function msfconsole
  docker run -it --rm --net host  -v ~/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data booyaabes/kali-linux-full msfconsole $argv
end

function msfvenom
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full msfvenom $argv
end

function nc
  docker run --rm -i --net host heywoodlh/telnet nc $argv
end

function ndiff
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full ndiff $argv
end

function netcat
  docker run --rm -i --net host heywoodlh/telnet nc $argv
end

function netdiscover
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full netdiscover $argv
end

function nikto
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full nikto $argv
end

function nmap
  docker run --rm --net host --privileged booyaabes/kali-linux-full nmap $argv
end

function padbuster
  docker run -it --rm booyaabes/kali-linux-full padbuster $argv
end

function reaver
  docker run -it --rm --net host --privileged -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full reaver $argv
end

function responder
  docker run -it --rm --net host booyaabes/kali-linux-full responder $argv
end

function searchsploit
  docker run --rm booyaabes/kali-linux-full searchsploit $argv
end

function setoolkit
  docker run -it --rm --net host -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full setoolkit $argv
end

function sniper
  docker run --rm -ti menzo/sn1per-docker sniper $argv
end

function sqlmap
  docker run -it --rm --net host -w /data -v ~/.sqlmap:/root/.sqlmap -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full sqlmap $argv
end

function socat
  docker run --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host booyaabes/kali-linux-full socat $argv
end

function telnet
  docker run --rm -i heywoodlh/telnet telnet $argv
end

function theharvester
  docker run --rm -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full theharvester $argv
end

function tshark
  docker run --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host --privileged booyaabes/kali-linux-full tshark $argv
end

function unfurl
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | unfurl $argv"
end

function urlscan
  docker run --rm -i -v ~/.urlscan:/root/.urlscan heywoodlh/urlscan-py:latest urlscan $argv
end

function volafox
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full volafox $argv
end

function volatility
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full volatility $argv
end

function vulnscan
  docker run --rm --net host --privileged booyaabes/kali-linux-full nmap -sV --script=vulscan/vulscan.nse $argv
end

function wash
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp --net host --privileged booyaabes/kali-linux-full wash $argv
end

function waybackurls
  docker run --rm -i heywoodlh/tomnomnom-tools:latest bash -c "cat | waybackurls $argv"
end

function webscarab
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host booyaabes/kali-linux-full java -jar /usr/bin/webscarab $argv
end

function whatismyip
  curl 'https://api.ipify.org?format=text'
end

function wpscan
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full wpscan $argv
end

function yersinia
  docker run -it --rm -w /data -v (pwd):/data -v /tmp:/tmp booyaabes/kali-linux-full yersinia $argv
end

function zaproxy
  docker run -it --rm -v ~/.ZAP:/root/.ZAP -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host booyaabes/kali-linux-full zaproxy $argv
end
