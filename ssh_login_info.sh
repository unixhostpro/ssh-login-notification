#!/bin/bash
# Telegram notification
# Send msg when your server load to high
token="123456:AasdE8asdaKNiradb1wRZT87pwErerc6biTsVcPE" # put your token here 
chat_id="1234567" # your chat_id for sending notification
sendmsg="https://api.telegram.org/bot$token/sendMessage?parse_mode=markdown" # url for sending msg
sendfile="https://api.telegram.org/bot$token/sendDocument?parse_mode=markdown" # url for sending files
date="$(date "+%d-%b-%Y-%H:%M")"
caption_file=/tmp/ssh_caption_file.txt
msg=/tmp/ssh_msg_info.txt
curl http://ip-api.com/json/$PAM_RHOST -s -o $caption_file
country=$(cat $caption_file | jq '.country' | sed 's/"//g')
city=$(cat $caption_file | jq '.city' | sed 's/"//g')
org=$(cat $caption_file | jq '.as' | sed 's/"//g')
echo -e "📡New SSH login\n*🤖$PAM_USER* logged in on 🖥*$HOSTNAME* at $date from $PAM_RHOST\n🌎Country:*$country*\n🏙City=*$city*\n🕋Organisation=*$org*" > $msg
#curl -d text=$message -d chat_id=$chat_id $sendmsg
curl $sendmsg -d chat_id=$chat_id -d text="$(<$msg)" 
rm /tmp/ssh_caption_file.txt
rm /tmp/ssh_msg_info.txt
