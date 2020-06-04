# ccutils
Various Slurm utilities scripts for Compute Canada staff and users.

# Installation

Run the following to install in `~/.local/bin/` by default.
```bash
bash install.sh
```

Install in a different location with :
```bash
PREFIX=~/bin bash install.sh
```

Feel free to then rename the scripts to your likings.

# Contribute

1) Add your script
2) Document its usage

# Scripts

## recent_usage
Scripts to display recent core usage of an account. By default, it display 14 days.
```bash
$ recent_usage.sh def-account [days]
In the past 14 days, project def-account has used on average 0 cores and 0 GPUs
```
