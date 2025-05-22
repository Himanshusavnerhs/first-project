🔧 How to Use:
Save this file as server-stats.sh:

bash
Copy
Edit
nano server-stats.sh
Paste the script and save.

Make it executable:

bash
Copy
Edit
chmod +x server-stats.sh
Run it:

bash
Copy
Edit
./server-stats.sh
📝 Notes:
The script uses standard tools: top, free, df, ps, and awk, which are present on nearly all Linux distros.

You can extend it to log output to a file or schedule it via cron for periodic reporting.

Would you like a version that outputs to a log file or sends email alerts for high usage?
