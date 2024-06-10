#!/usr/bin/env bash
  #================================================
  # Project: TINYURL-CREATOR.sh
  # Author:  ConzZah / ©️ 2024
  # Last Modification: 10.06.2024 / 21:30 [v1.1.2]
  #================================================
# logo
function logo {
c1="============================="
echo $c1; echo "TINYURL-CREATOR v1.1.2"; echo $c1; echo ""; 
}
function main {
clear; logo
baseurl="https://tinyurl.com/api-create.php?url="
sav="tinyurl-creator_save.txt" # <-- savefile name
savepath="/home/$USER" # <-- save directory
cd $savepath
echo "ENTER URL"; echo ""; read raw_link
curl -s -o x.txt "$baseurl$raw_link"; shortlink=$(<x.txt); rm x.txt
echo ""; echo "$c1$c1"; echo ""; echo "shortlink:"; echo ""; echo "$shortlink"; echo ""; echo ""
echo "original_url:"; echo ""; echo "$raw_link"; echo ""; echo "$c1$c1"
ask2save
}
# ask2save
function ask2save {
no="CHOSE NOT TO SAVE."
echo ""; echo "DO YOU WANT TO SAVE THE RESULT TO $sav?"; echo ""
echo "Y) YES"
echo "N) NO"
read ask2save
case $ask2save in
	y) choose_alias;;
	Y) choose_alias;;
	n) echo ""; echo "$no"; ask2repeat_main;;
	N) echo ""; echo "$no"; ask2repeat_main;;
	*) ask2save
esac
}
# choose_alias
function choose_alias {
echo ""; echo "ENTER ALIAS FOR SHORTLINK:"; echo ""; read Alias; save
}
# save
function save {
echo "SAVING RESULTS TO: $sav"
echo "$c1$c1">> $sav; echo "">> $sav; echo "">>$sav
echo "Alias:">>$sav; echo "">> $sav
echo "$Alias">>$sav; echo "">> $sav; echo "">> $sav
echo "Shortlink:">> $sav; echo "">> $sav
echo "$shortlink">> $sav; echo "">> $sav; echo "">> $sav
echo "Original URL:">> $sav; echo "">> $sav
echo "$raw_link">> $sav; echo "">> $sav
echo ""; echo "DONE"; echo "" 
ask2repeat_main
}

function ask2repeat_main {
exitmsg="PRESS ANY KEY TO EXIT"
echo ""; echo "DO YOU WANT TO SHORTEN MORE LINKS?"; echo ""
echo "Y) YES"
echo "Q) NO (EXIT)"
read ask2repeat_main
case $ask2repeat_main in
	y) main;;
	Y) main;;
	q) echo ""; echo "$exitmsg"; read -n 1 -s; exit;;
	Q) echo ""; echo "$exitmsg"; read -n 1 -s; exit;;
	*) clear; ask2repeat_main
esac
}
main
