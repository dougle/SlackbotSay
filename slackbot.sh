#!/bin/bash


cd -P "$( dirname "${BASH_SOURCE[0]}" )"



usage()
{
cat << EOF
usage: $0 options

This script uses slack integrations to make slackbot say things.
.slackbotrc in your home directory will contain some defaults to
save you supplying them each time.

OPTIONS:
   -h      Show this message
   -c      The channel to post in
   -m      The message to send
   -i      The integration url from slack
EOF
}

slackbotrc="$HOME/.slackbotrc"

channel=""
message=""
integration_url=""

[[ ! -e "$slackbotrc" ]] && echo -e "channel=\"\"\nintegration_url=\"\"" > "$slackbotrc"

source "$slackbotrc"

while getopts “hc:m:i:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         c)
             channel=$OPTARG
             ;;
         m)
             message=$OPTARG
             ;;
         i)
             integration_url=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done


# check we have the right info
[[ -z "$integration_url" ]] && echo "No integration url found. see -h" && exit 9
[[ -z "$channel" ]] && echo "No channel found. see -h" && exit 9
[[ -z "$message" ]] && echo "No message found. see -h" && exit 9

# prep params for usage
[[ "$integration_url" =~ ^https?\:\/\/ ]] || integration_url="http://$integration_url"
channel=$(echo "$channel" | sed -r 's/^(#|%23)//g' | tr -cd '[[:alnum:]]-_')

#from_slack=$(curl --data "$message" "${integration_url}&channel=%23${channel}")
echo "curl --data \"$message\" \"${integration_url}&channel=%23${channel}\""

[[ -n "$from_slack" ]] && echo "$from_slack" && exit 2

exit 0