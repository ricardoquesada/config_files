#!/bin/bash

if [ -z $1 ]; then
  echo ERROR: Specify new session name
  exit
fi

SESSION_NAME=$1

tmux has-session -t ${SESSION_NAME} > /dev/null 2>&1
if [[ $? == 0 ]]; then
  echo "WARNING: tmux session (${SESSION_NAME}) already exists."
  read -p "Kill existing session? (y/n)" answer
  case ${answer:0:1} in
    y|Y )
      echo "Killing ${SESSION_NAME}"
      tmux kill-session -t ${SESSION_NAME}
      ;;
    * )
      echo "Exiting"
      exit
      ;;
  esac
fi

# Create session in detached state.

#----- :1 unijoysticle
tmux new -s ${SESSION_NAME} -d -n "unijoysticle"
tmux split-window -h -t ${SESSION_NAME}:1
tmux split-window -v -t ${SESSION_NAME}:1.0

# 1.0
for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:1.$i "cd ~/progs/unijoysticle2/" C-m
done

#----- :2 src
tmux new-window -t ${SESSION_NAME}:2 -n "src"
tmux split-window -h -t ${SESSION_NAME}:2
tmux split-window -v -t ${SESSION_NAME}:2.0

# 2.0
for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:2.$i "cd ~/src" C-m
done

#----- :3 misc
tmux new-window -t ${SESSION_NAME}:3 -n "misc"
tmux split-window -h -t ${SESSION_NAME}:3
tmux split-window -v -t ${SESSION_NAME}:3.0

# 3.0
for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:3.$i "cd ~/" C-m
done

#------
# Move to Scratch window
tmux select-window -t ${SESSION_NAME}:1
tmux select-pane -L

# Attach to the session.
tmux -2 attach-session -t ${SESSION_NAME}

