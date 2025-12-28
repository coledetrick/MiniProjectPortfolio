The goal of this project is to create a script that keeps running forever and writes a message to the log file every 10 seconds 
simulating an application running in the background. This project allowed me to get familiar with systemd;
creating and enabling a service, checking the status, keeping an eye on the logs, starting and stopping the service, etc.

I used a simple netdata dashboard setup on an ec2 instance to monitor the dummy service activity when the script was running.
