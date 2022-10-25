---
Title: Devops Assessment Answers
--- 

Assumptions: 
1. Environment is hosted in AWS 
2. Mailing for this assessment can be simulated with an echo command or via use of cron mailer
3. Script will run from within affected vm/server on a cron job of one hour

Setup: 
1. Open crontab of user that will trigger the script by typing crontab -e
2. Place the following cron expression using: 
```bash
crontab -e
```
At the end of the file and save:
```bash
0 * * * * /opt/try.sh <file location>
```
3. On top of command add a:
```bash
MAILTO=<desired email target>
```
OR

use:
```bash
echo $body | mail -s "HTTP Error" no-reply@email.com
```

Task1b:

Assumptions: 
1. Using aws to store and servers are aws instances
2. Create a iam role for ec2 instance to push  logs to cw 

Answers:
1. install cw logs agent to ec2 instance through packer/ansible, configure cw logs agent to upload files to a cw namespace/dimension edit retention of the log group to expire after 90 days
2. code a python lambda to trigger every day to create an export job for cw logs to s3. create a s3 lifecycle policy to shift logs to glacier 1 month. another lifecycle to delete the logs after 7 years. 
3. use either logrotate or auto_removal options on cw agent to reduce log sizes in the server.
bonus: add a cw vpc endpoint to ec2's subnet
