#!/bin/bash
cat ~/.icedove/wherever/wherever/Mail/accountwherever/Inbox.sbd/Spam| egrep ^From: | cut -f2 -d"<"| tr ">" " " | sort -u >> ~/blacklist_spam
