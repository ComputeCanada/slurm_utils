#!/usr/bin/env python
#
# Run 'sacct --format=ALL' on the given job and present
# the output in a row-based format instead of column-based
# so it's easier to read.
#
# Ross Dickson, ACENET, 2017-12-21
#
from __future__ import print_function
import sys
import subprocess

jobid = sys.argv[1]

# Get all accounting fields from sacct.
# -P for parsable
field_sep="!"
raw = subprocess.check_output(["sacct", "--format=ALL", "-P",
                               "--delimiter="+field_sep, "-j", str(jobid)])
lines = raw.rstrip().splitlines()

# Tabulate the field names (keys).
keys = lines[0].strip().split(field_sep)
field_count = len(keys)
print("Found", len(lines), "lines")

# Create a list of job steps.
jobsteps = []
for line in lines[1:]:
    step = line.strip().split(field_sep)
    assert(field_count == len(step))
    jobsteps.append(step)

step_count = len(jobsteps)
assert(step_count+1 == len(lines))

# Determine a column width for each step.
# Limit it to 40 columns FIXME make this an option.
col_fmts = []
for step in jobsteps:
    max_width = 0
    for field in step:
        max_width = max(max_width, len(field))
    max_width = min(40, max_width)
    col_fmt = "{0:"+str(max_width)+"}"
    col_fmts.append(col_fmt)

# Pretty-print it.
for i in range(field_count):
    print("{0:2} {1:17}:".format(i, keys[i]), end="")
    for rec_index in range(step_count):
        print(col_fmts[rec_index].format(jobsteps[rec_index][i]), end="")
    print()
