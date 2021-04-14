# PRTG-SSH-scripts
SSH Scripts for use in PRTG

Place scripts under /var/prtg/scripts or /var/prtg/scriptsxml on your system and make PRTG able to login via SSH.

To extend functionality to offical unsupported zFS systems like Illumos Systems, Ubuntu, Debian:

**ZFSPoolSize.sh:**  
- Input: Name of zpool you want to monitor  
- Output: Integer between 0 and 100, percentage of capacity used in zpool

---

For Folding @ Home:

**PRTG-fah-group.sh:**  
- Input: ID of Folding@Home Group
