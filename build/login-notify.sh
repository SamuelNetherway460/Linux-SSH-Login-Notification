#!/bin/bash
# Bash script to send email notifications for new ssh logins
# By: Samuel Netherway

sender="sender@example.com"
recepient="recepient@example.com"

if [ "$PAM_TYPE" != "close_session" ]; then
    host="`hostname`"
    subject="SSH Login: $PAM_USER from $PAM_RHOST on $host"
    # Message to send, e.g. the current environment variables.
    message="`env`"
    echo "$message" | mailx -r "$sender" -s "$subject" "$recepient"
fi