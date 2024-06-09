#!/usr/bin/env bash
  #=============================================
  # Project: TINYURL-CREATOR.sh
  # Author:  ConzZah / ©️ 2024
  # Last Modification: 09.06.2024 / 15:30 [v1.1]
  #=============================================
function main {
clear; c1="============================="
baseurl="https://tinyurl.com/api-create.php?url="
sav="tinyurl-creator_save.txt"
echo "ENTER URL"; echo ""; read raw_link
curl -s -o x.txt "$baseurl$raw_link"; shortlink=$(<x.txt); rm x.txt
echo ""; echo "$c1$c1"; echo ""; echo "shortlink:"; echo ""; echo "$shortlink"; echo ""; echo ""
echo "original_url:"; echo ""; echo "$raw_link"; echo ""; echo "$c1$c1"
echo ""; echo "SAVING RESULTS TO: $sav ..."; echo ""
echo "$c1$c1">> $sav; echo "">> $sav; echo "shortlink:">> $sav; echo "">> $sav
echo "$shortlink">> $sav; echo "">> $sav; echo "">> $sav
echo "original_url:">> $sav; echo "">> $sav
echo "$raw_link">> $sav; echo "">> $sav
echo "DONE"; echo "" 
repeat
}
function repeat {
echo ""; echo "DO YOU WANT TO SHORTEN MORE LINKS?"; echo ""
echo "Y) YES"
echo "Q) NO (EXIT)"
read repeat
case $repeat in
	y) clear; main;;
	Y) clear; main;;
	q) echo ""; echo "PRESS ANY KEY TO EXIT"; read -n 1 -s; exit;;
	Q) echo ""; echo "PRESS ANY KEY TO EXIT"; read -n 1 -s; exit;;
	*) clear; repeat
esac
}
main
