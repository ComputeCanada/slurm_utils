#!/bin/env bash

squeue -t pd -S -p -o "%.15i %.8u %Q" | head
