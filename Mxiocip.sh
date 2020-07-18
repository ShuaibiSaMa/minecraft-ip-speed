#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
?:?_menu.sh 錟]O踁酒库% 毙臝?乙n葜壂襏贛橺?G頁H﹉爡哃厧⒙F???柳薀駋挮齾垸j?胼,E?鐈?嘻>镢亊}I?qf >磕?糨?0掅[???)m圽z6捘qU忲?搨馺氼|e埡IU柖拴扁??JO6???鐪c僼y=F!幈fD鹴?U慪Q筶烛儤,J#栖墹"趇亴?|鈋f桩磷7o0?fvч捹M抷?檈J?r癟^虡鐩:Z瓧斛Ok砝Z蠎????K抰?卜儘鄣€O叁骋N毤xn?鮒Ng婄?菤g?jQ炦%O逃濃鯿嬷袍`0膓\(醷盔=$芔?饘x????戩Z芞蓫?賡?橌Z[光娌u紭5?耪]k>M;汃揠?i1!o?Ni$庭ZG摪返f凳'贊庢o9??u怣"	1餴唷?]麯鸈?憮U泊U??砠惤蹩?<??#
侫?$叀鮠 渀臊聤[?[▆昮妔
|"aQ?e
| €OQ?毆c嗦酘谾???禐?奴0t'帑禧駲唰?垭	?0悇Y<叐W{牚K?肗`拪舭z1粖?哞)s鎖?^瞊錧莧?gn?烍 倒z暋拈?齰Y2亝D?[N?N蜶漭驳摬桮荶II[X躿F.襹褫嬈攲ⅴ?ど踚?$鐽!艋缎T蜝綮_2p檏G弁衻誋Lc溇G?;I?巭CC(芌m?1.??崨?'?虳屬??,鷘懃+]?t慞E!聿=鷿<?潣苼s巇?質C璲W?G?NI2憴c牣??]?E|?t+O哰豉繅?权嬼u咅?!o┌J^?廜軴Co庥";\]v竑俦摪Ж?瓝?洒
5M摸p????;O璬狽逩d戵鸁嚡噊G?M是u囸?棥I虴?鳆?齧7?  
