#!/bin/bash
# task list: mk_tasks.sh "CLASS1 CLASS2 ..." "t1 t2 ..." [games file]
cd "$(dirname "$0")"
for t in $2; do for c in $1; do while read g e h; do echo "bash run_task.sh $g $e $h $t $c"; done < ${3:-games.txt}; done; done
