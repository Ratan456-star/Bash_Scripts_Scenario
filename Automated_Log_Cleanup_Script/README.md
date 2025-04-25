
# Automated Log Cleanup Script 🚀

## Scenario 📜

As a DevOps Engineer, logs accumulate daily, consuming storage and slowing down servers. Instead of manually deleting logs, automate it with a shell script! 🖥️

## How It Works? 🔧

```bash
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS_TO_KEEP -exec rm -f {} \;
```

1. **find $LOG_DIR -type f -name "*.log"** - Searches for log files in the specified directory.
2. **-mtime +$DAYS_TO_KEEP** - Finds files that are older than the set number of days (7 days in this case).
3. **-exec rm -f {}** - Deletes the files that match the conditions.

## Where Do We Use This in DevOps? ⚙️

- **Log Management** 🗄️ - Prevents disk space issues by cleaning up unnecessary logs.
- **CI/CD Pipelines** 🚀 - Cleans old logs before new deployments.
- **Security Compliance** 🔐 - Helps maintain proper log retention policies.

## How to Use? 🛠️

1. **Save the script as** `log_cleanup.sh`
2. **Make it executable**:

   ```bash
   chmod +x log_cleanup.sh
   ```

3. **Run the script**:

   ```bash
   sudo ./log_cleanup.sh
   ```

4. **Automate using cron (schedule it daily)** 🗓️

   **In the crontab** file, you need to add the following line to run the cleanup every night at 1 AM:

   ```bash
   */5 * * * * sudo /bin/bash /home/ubuntu/Automated_Log_Cleanup_Script/log_cleanup.sh >> /home/ubuntu/Automated_Log_Cleanup_Script/Test.log 2>&1
   ```

   This line makes sure the script runs every 5 minutes. The logs are saved in `Test.log`.

## Troubleshooting 🔍

### 1. If cron is not executing your script, check the following:

- Ensure the script has execute permissions using the command:

  ```bash
  chmod +x /home/ubuntu/Automated_Log_Cleanup_Script/log_cleanup.sh
  ```

- Make sure that `sudo` permissions are granted properly in the cron job for the user running the cron.

### 2. If the log file is not being generated, check the permissions for the log file:

```bash
chmod +w /home/ubuntu/Automated_Log_Cleanup_Script/Test.log
```

### 3. Check the syslog for cron job entries:

```bash
grep CRON /var/log/syslog
```

This will show if there were any errors during cron execution.

### 4. Verify that the cron job is running as expected and creating logs:

```bash
cat /home/ubuntu/Automated_Log_Cleanup_Script/Test.log
```

You should see logs similar to:

```
Deleting logs older than 7 days in /var/log ...
Log Cleanup Completed!
```

## Final Notes 📝

- Keep track of how often the cron job runs and check the logs to ensure everything is functioning as expected.
- If you're using a cloud environment, monitor storage regularly to ensure disk space is being managed well.

## Conclusion 🎉

This script helps automate log cleanup, saving disk space, improving server performance, and keeping logs compliant with retention policies. 🚀

