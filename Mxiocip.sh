#!/bin/sh
# ====================================================
#	System Request:CentOS 6+ 
#	Author:	Angasky
#	Dscription: 加速IP管理脚本
#	Version: 2.1
#	Blog: https://blog.wcaonm.cn
# ====================================================
mkdir mcip
cd mcip
function menu ()
{
 cat << EOF
----------------------------------------
|***************加速IP管理菜单***************|
请尊重作者:Angasky
更新日志
v2.0
1.加入了菜单
v2.1
1.加入了加速IP的安装和一键重新配置
2.优化了部分代码
QQ群1142224663
----------------------------------------
`echo -e "\033[35m 1)获取连接IP\033[0m"`
`echo -e "\033[35m 2)查看流量使用情况\033[0m"`
`echo -e "\033[35m 3)Banip\033[0m"`
`echo -e "\033[35m 4)安装加速ip脚本\033[0m"`
`echo -e "\033[35m 5)一键重新配置加速IP端口\033[0m"`
`echo -e "\033[35m 6)退出\033[0m"`
EOF
read -p "请输入对应功能的数字：" num1
case $num1 in
 1)
  echo "欢迎使用Angasky的IP管理"
  script -c 'tcpdump -i eth0 -nn -A port 25565 -c 100' ip.log
  grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ip.log  > seit.txt
  cat seit.txt | sort | uniq
  echo -e "${Green}以上是连接中的IP${Font}" 
  ;;
 2)
  echo "欢迎使用Angasky的IP管理!"
  yum install iftop -y
  echo -e "${Green}开始检测IP流量使用情况请等待3秒${Font}" 
  sleep 3s
  iftop 
  ;;
 3)
  clear
  car_menu
  ;;
 4)
 echo -e "${Green}开始安装请稍等${Font}"
 sleep 3s
	git clone https://github.com/ginuerzh/gost.git
	cd gost/cmd/gost
	yum install go -y
	go build
  	 ;;
 5)
 cd
 cd /etc/rc.d
 rm -rf rc.local 
 echo -e "${Green}已删除重新安装加速IP脚本即可${Font}" 
 sleep 3s
;;
 6)
  exit 0
esac
}
 
function eleproduct_menu ()
{
 cat << EOF
----------------------------------------
|***************Angasky的IP管理****************|
----------------------------------------
`echo -e "\033[35m 1)name\033[0m"`
`echo -e "\033[35m 2)name\033[0m"`
`echo -e "\033[35m 3)name\033[0m"`
`echo -e "\033[35m 4)返回主菜单\033[0m"`
EOF
read -p "请输入对应的数字：" num2
case $num2 in
 1)
  echo "name"
  eleproduct_menu
  ;;
 2)
  echo "name"
  eleproduct_menu
  ;;
 3)
  echo "name"
  eleproduct_menu
  ;;
 4)
  clear
  menu
  ;;
 *)
  echo "the is fail!!"
  eleproduct_menu
esac
}
 
function car_menu ()
{
 cat << EOF
----------------------------------------
|***************Banip****************|
----------------------------------------
`echo -e "\033[35m 1)name\033[0m"`
`echo -e "\033[35m 2)name\033[0m"`
`echo -e "\033[35m 3)name\033[0m"`
`echo -e "\033[35m 4)返回主菜单\033[0m"`
EOF
read -p "请输入对应的数字：" num3
case $num3 in
 1)
  echo "name!"
  car_menu
  ;;
 2)
  echo "name!"
  car_menu
  ;;
 3)
  echo "name!"
  car_menu
  ;;
 4)
  clear
  menu
  ;;
 *)
  echo "the is fail!!"
  car_menu
esac
}
menu
