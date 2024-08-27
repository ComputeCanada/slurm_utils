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

## squeue_prio
Script to display top 10 jobs and their current priority.
```bash
$ squeue_prio.sh  <userX>
          JOBID   USER  PRIORITY
       32402825  userX  2519571
       32440131  userX  2318474
       32149496  userX  2300399
       32438832  userX  2224271
       32438835  userX  2224271
       32438838  userX  2224271
       32438839  userX  2224271
       32438843  userX  2224271
       32438844  userX  2224271
```

## partition-queue
Script to show a numbered list of jobs waiting in a particular partition or list all partitions.

```bash
$ partition-queue -h
Usage:
partition-queue <partition_name>[,<partition_name>[...]] # show numbered list of jobs waiting in <partition_name>
partition-queue [-p|-l]                                  # show list of all partitions
partition-queue [-h|--help]                              # show this help

$ partition-queue -l
available partitions:
cpubase_interac
cpubase_bynode_b1
cpubase_bynode_b2
cpubase_bynode_b3
cpubase_bynode_b4
cpubase_bynode_b5
cpubase_bynode_b6
...

$ partition-queue cpubase_bycore_b2 | head
     0	   JOBID     USER      ACCOUNT           NAME  ST  TIME_LEFT NODES CPUS       GRES MIN_MEM NODELIST (REASON) 
     1	12345671 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     2	12345672 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     3	12345673 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     4	12345674 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     5	12345675 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     6	12345676 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     7	12345677 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     8	12345678 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 
     9	12345679 user1234 def-someprof    some_job.sh  PD    7:59:00     1    1     (null)      2G  (Priority) 

```

## whenwilldrain.sh
Script takes a node-spec and prints sinfo and squeue information about those nodes so that one can see when the current jobs will finish.

```bash
$ whenwilldrain cluster[20-15]
PARTITION  AVAIL  TIMELIMIT  NODES  STATE NODELIST
general*      up 3-00:00:00      6  alloc cluster[20-25]

JOBID     USER       STATE       TIME_LEFT     NODELIST    END_TIME            
123401    user123    RUNNING      22:50:47    cluster24    2024-08-28T13:58:37    
123402    user123    RUNNING      22:50:47    cluster25    2024-08-28T13:58:37    
123402    user321    RUNNING    2-06:51:04    cluster20    2024-08-29T21:58:54    
123403    user321    RUNNING    2-06:51:04    cluster20    2024-08-29T21:58:54    
123404    user321    RUNNING    2-06:51:04    cluster21    2024-08-29T21:58:54    
123405    user321    RUNNING    2-06:51:04    cluster21    2024-08-29T21:58:54    
123406    user321    RUNNING    2-06:51:04    cluster22    2024-08-29T21:58:54    
123407    user321    RUNNING    2-06:51:04    cluster22    2024-08-29T21:58:54    
123408    user321    RUNNING    2-06:51:04    cluster23    2024-08-29T21:58:54    
```

