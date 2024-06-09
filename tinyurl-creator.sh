#!/usr/bin/env bash
  #================================================
  # Project: TINYURL-CREATOR.sh
  # Author:  ConzZah / ©️ 2024
  # Last Modification: 09.06.2024 / 18:27 [v1.1.1]
  #================================================
function main {
clear; c1="============================="
baseurl="https://tinyurl.com/api-create.php?url="
sav="tinyurl-creator_save.txt"
echo "ENTER URL"; echo ""; read raw_link
curl -s -o x.txt "$baseurl$raw_link"; shortlink=$(<x.txt); rm x.txt
echo ""; echo "$c1$c1"; echo ""; echo "shortlink:"; echo ""; echo "$shortlink"; echo ""; echo ""
echo "original_url:"; echo ""; echo "$raw_link"; echo ""; echo "$c1$c1"
ask2save
}
# ask2save
function ask2save {
yes="SAVING RESULTS TO: $sav"
no="YOU CHOSE NOT TO SAVE."
echo ""; echo "DO YOU WANT TO SAVE THE RESULT TO $sav?"; echo ""
echo "Y) YES"
echo "N) NO"
read ask2save
case $ask2save in
	y) echo ""; echo "$yes"; save;;
	Y) echo ""; echo "$yes"; save;;
	n) echo ""; echo "$no"; ask2repeat_main;;
	N) echo ""; echo "$no"; ask2repeat_main;;
	*) ask2save
esac
}
# save
function save {
echo "$c1$c1">> $sav; echo "">> $sav; echo "shortlink:">> $sav; echo "">> $sav
echo "$shortlink">> $sav; echo "">> $sav; echo "">> $sav
echo "original_url:">> $sav; echo "">> $sav
echo "$raw_link">> $sav; echo "">> $sav
echo ""; echo "DONE"; echo "" 
ask2repeat_main
}

function ask2repeat_main {
echo ""; echo "DO YOU WANT TO SHORTEN MORE LINKS?"; echo ""
echo "Y) YES"
echo "Q) NO (EXIT)"
read ask2repeat_main
case $ask2repeat_main in
	y) clear; main;;
	Y) clear; main;;
	q) echo ""; echo "PRESS ANY KEY TO EXIT"; read -n 1 -s; exit;;
	Q) echo ""; echo "PRESS ANY KEY TO EXIT"; read -n 1 -s; exit;;
	*) clear; ask2repeat_main
esac
}
main
