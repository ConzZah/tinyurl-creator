#!/usr/bin/env bash
c1="============================="
baseurl="https://tinyurl.com/api-create.php?url="
sav="tinyurl-creator_save.txt"
echo "ENTER URL"; echo ""; read raw_link
curl -s -o x.txt "$baseurl$raw_link"; shortlink=$(<x.txt); rm x.txt
echo ""; echo "$c1$c1"; echo ""; echo "shortlink:"; echo ""; echo "$shortlink"; echo ""; echo ""
echo "original_url:"; echo ""; echo "$raw_link"; echo ""; echo "$c1$c1"
echo ""; echo "SAVING URLs TO: $sav"; echo ""
echo "$c1$c1">> $sav; echo "">> $sav; echo "shortlink:">> $sav; echo "">> $sav
echo "$shortlink">> $sav; echo "">> $sav; echo "">> $sav
echo "original_url:">> $sav; echo "">> $sav
echo "$raw_link">> $sav; echo "">> $sav
echo "PRESS ANY KEY TO EXIT"; read -n 1 -s; exit
