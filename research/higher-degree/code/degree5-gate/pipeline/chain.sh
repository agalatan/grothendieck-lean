#!/bin/bash
cd $HOME/claude-b9ee-gate/pkg
while pgrep -g $(cat job.pid) > /dev/null; do sleep 20; done
taskset -c 4-7 xargs -P 4 -I{} bash -c {} < s3.txt
