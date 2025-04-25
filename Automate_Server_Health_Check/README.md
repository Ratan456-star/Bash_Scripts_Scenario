
# 🚀 Automate Server Health Check

A simple Bash script to monitor server health by checking **CPU**, **Memory**, and **Disk** usage. Ideal for DevOps engineers who want to automate system health checks and integrate them into cron jobs or CI/CD pipelines.

---

## 📜 Script Overview

The script checks and displays:

- **CPU Usage** using `top`
- **Memory Usage** using `free`
- **Disk Usage** using `df`

---

## 📂 How to Use

### 1. Save the Script
Create a file called `server_health.sh` and paste the script below into it.

```bash
#!/bin/bash

echo "Checking Server Health..."

# CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 ", Idle: " $8}'

# Memory Usage
echo "Memory Usage:"
free -h | awk 'NR==2{print "Used: " $3 ", Free: " $4}'

# Disk Usage
echo "Disk Usage:"
df -h --output=source,pcent | grep '^/dev/'

echo "[ Health Check Completed! ]"
```

### 2. Make the Script Executable
```bash
chmod +x server_health.sh
```

### 3. Run the Script
```bash
./server_health.sh
```

### 4. Schedule as a Cron Job (Every 6 Hours)
```bash
crontab -e
```

Add this line at the end:
```bash
0 */6 * * * /path/to/server_health.sh >> /path/to/server_health.log
```

💡 Example:
```bash
*/3 * * * * /home/devops/Bash_Scripts_Scenario/Automate_Server_Health_Check/server_health.sh >> /home/devops/Bash_Scripts_Scenario/Automate_Server_Health_Check/server_health.log
```

---

## 🛠 Use Cases in DevOps

- **✅ Automated Monitoring**: Regular health checks without manual effort.
- **🔁 CI/CD Pipelines**: Validate server health before deploying.
- **🚨 Incident Response**: Quick diagnosis of high resource usage.

---

## 📝 Sample Output

```text
Checking Server Health...
CPU Usage:
Used: 0.3, Idle: 99.4
Memory Usage:
Used: 562Mi, Free: 3.9Gi
Disk Usage:
/dev/sda2       16%
[ Health Check Completed! ]
```
---

![Screenshot (247)](https://github.com/user-attachments/assets/ce2f96fc-1499-448e-8dd0-ba187290f432)


## 🐛 Known Issue

Sometimes, CPU Idle value may appear as `id,` due to parsing issues. To fix this, you can enhance the `awk` command for more reliable parsing depending on the locale or system formatting.

---

## ✅ Improvements

- Add logging with timestamps
- Send email alerts when thresholds are crossed
- Format the output in JSON for integration with monitoring tools

---

## 📎 Author

**DevOps Engineer**  
Project: *Automate Server Health Check*

