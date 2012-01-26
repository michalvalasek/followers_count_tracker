Twitter Followers Count Tracker
===============================

Use to track followers counts of twitter users of your interest.

Usage
-----
1. Add usernames to `username.txt` (one username per line).
2. Create a scheduled task (CRON, ...) to run `task.rb` periodically (e.g. once a day).
3. Text file in `storage/` folder will be created for each username. This file will store follower counts for given user - one day per line.