---
title: Devops Assessment Answers
--- 

Assumptions: 
1. Environment is hosted in AWS 
2. Mailing for this assessment can be simulated with an echo command or via use of cron mailer
3. Script will run from within affected vm/server on a cron job of one hour

Setup: 
1. Open crontab of user that will trigger the script by typing crontab -e
2. Place the following cron expression at the end of the file and save  0 * * * * /opt/try.sh
3. On top of command add a MAILTO=<desired email target>
