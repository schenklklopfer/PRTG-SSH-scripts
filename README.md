# PRTG-SSH-scripts
SSH Scripts for use in PRTG

Place scripts under /var/prtg/scripts or /var/prtg/scriptsxml on your system and make PRTG able to login via SSH.

To extend functionality to offical unsupported systems like Illumos Systems:

**ZFSPoolSize.sh:**  
- Input: Name of zpool you want to monitor  
- Output: Integer between 0 and 100, percentage of capacity used in zpool

---

**PRTG-fah-users.sh:**  
- Input: list of Usernames of Folding @ Home Users
