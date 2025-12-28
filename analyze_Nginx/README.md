The goal of this script was to write a simple tool to analyze logs from the command line, specifically nginx logs to grab whatever information you want.
I was given a sample nginx log file to parse with my scripts from: 
The data my script looks for is as follows:

| Metric | Description |
|------|-------------|
| **Top 5 IP Addresses** | Clients generating the highest number of requests |
| **Top 5 Requested Paths** | Most frequently accessed endpoints |
| **Top 5 Status Codes** | HTTP response codes returned by the server |
| **Top 5 User Agents** | Most common client applications and browsers |
