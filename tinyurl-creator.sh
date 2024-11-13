#!/usr/bin/env bash
  #================================================
  # Project: TINYURL-CREATOR.sh
  # Author:  ConzZah / ©️ 2024
  # Last Modification: 13.11.2024 / 13:55 [v1.2.1]
  #================================================
logo () { c1="=========================="; echo -e "$c1\n   TINYURL-CREATOR v1.2 \n$c1\n";}
# main
main () {
logo; alias=""; raw_link=""; shortlink="" # <-- initialize variables
savepath="/home/$USER"; cd "$savepath" # <-- set savepath 
api="https://tinyurl.com/api-create.php?url=" # <-- tinyurl api 
sav="tinyurl-creator_save.csv" # <-- set savename
echo "[[ ENTER URL ]]"; echo ""; read raw_link # <-- read user input 
# get result:
shortlink=$(curl -s "$api$raw_link")
# should the tinyurl api return "Error", show error message and reset:
if [[ "$shortlink" == "Error" ]]; then echo -e "\n[[ ERROR: INVALID URL. ]]\n"; read -n 1 -s; main; fi 
# show result to user:
echo -e "\n$c1$c1\nORIGINAL URL: \n$raw_link"
echo -e "\nSHORTLINK: \n$shortlink\n$c1$c1\n"
echo "ENTER ALIAS FOR SHORTLINK:"; echo ""; read alias; save # <-- prompt for alias & save
}

save () {
# if savefile doesn't exist, create csv:
[ ! -f "$savepath/$sav" ] && echo "ALIAS; ORIGINAL URL;SHORTLINK">$sav
echo "$alias;$raw_link;$shortlink">>$sav # <-- saving user input to csv
echo -e "\n$c1\n   LINK HAS BEEN SAVED.\n$c1"; ask2repeat_main
}

ask2repeat_main () {
echo -e "\nWANT TO SHORTEN MORE LINKS?\n"
echo "Y) YES"; echo "Q) NO (EXIT)"
read ask2repeat_main
case $ask2repeat_main in
	y|Y) main;;
	q|Q) echo -e "\n// EXIT"; sleep 0.7; exit;;
	*) ask2repeat_main
esac
}
main
