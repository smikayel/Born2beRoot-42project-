# the architecture of computer and kernel versionl
echo "	#Architecture:"`uname -a` | wall -n
echo "	#CPU phisical: "`cat /proc/cpuinfo |grep cpu\ cores |uniq | cut -d" " -f3` | wall -n
echo "	#vCPU : "`cat /proc/cpuinfo | grep "processor" | wc -l` | wall -n 
echo "	#Memory Usage:" `free -m | grep Mem | awk -F' '   '{print $3 "/" $2 "MB" " " "("$3/$2*100"%"")"}'` |wall -n
echo "	#Disk Usage:" `df -h --total | grep total | awk -F' ' '{print $3 "/" $2 " (" $5  ")"}'` | wall -n
echo "	#CPU load:" `grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'` | wall -n
echo "	#Last boot:" `uptime | perl -ne '/.*up +(?:(\d+) days?,? +)?(\d+):(\d+),.*/; $total=((($1*24+$2)*60+$3)*60);$now=time(); $now-=$total; $now=localtime($now); print $now,"\n";'i | awk -F' ' '{print $4 " " $5}'` | wall -n
echo "	#LVM use:" `pvdisplay | grep Allocatable | awk -F' ' '{print $2 }'` | wall -n
echo "	#Connection TCP: " `netstat -ant | grep ESTABLISHED | wc -l` | wall -n
echo "	#User log: " `who | wc -l` | wall -n
echo "	#Network: " `hostname -I | awk '{print $1}'` `ifconfig | grep ether | awk -F' ' '{print $2}'` | wall -n
echo "	#Sudo:" `journalctl _COMM=sudo | grep COMMAND | wc -l | awk '{print $1 " cmd"}'` | wall -n
