# SlackbotSay
A shell script to send a message as slackbot to a channel

Download https://raw.githubusercontent.com/dougle/SlackbotSay/master/slackbot.sh and move to a sane place in your PATH, i copied mine to /usr/local/bin/slackbot.


Usage
-----

$ slackbot -c "#_general" -i "https://company-name.slack.com/services/hooks/slackbot?token=xxxxxxxtokenxxxx" -m "Hi @channel, please fill in your timesheets."

On first run ~/.slackbotrc with be created, defaults such as the integration url and/or a default channel can be added there.

