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

#----- :1 bluepad32
tmux new -s ${SESSION_NAME} -d -n "bluepad32"
tmux split-window -h -t ${SESSION_NAME}:1
tmux split-window -v -t ${SESSION_NAME}:1.0

for i in {0..1}
do
tmux send-keys -t ${SESSION_NAME}:1.$i "cd ~/progs/bluepad32/" C-m
tmux send-keys -t ${SESSION_NAME}:1.$i "source ~/esp/esp-idf/export.sh" C-m
tmux send-keys -t ${SESSION_NAME}:1.$i "export PLATFORM=unijoysticle" C-m
done
tmux send-keys -t ${SESSION_NAME}:1.2 "cd ~/progs/bluepad32/" C-m
tmux send-keys -t ${SESSION_NAME}:1.2 "export PLATFORM=unijoysticle" C-m

#----- :2 vchar64
tmux new-window -t ${SESSION_NAME}:2 -n "vchar64"
tmux split-window -h -t ${SESSION_NAME}:2
tmux split-window -v -t ${SESSION_NAME}:2.0

for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:2.$i "cd ~/progs/vchar64/" C-m
done

#----- :3 Unijoysticle2
tmux new-window -t ${SESSION_NAME}:3 -n "uni2"
tmux split-window -h -t ${SESSION_NAME}:3
tmux split-window -v -t ${SESSION_NAME}:3.0

for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:3.$i "cd ~/progs/unijoysticle2/" C-m
done

#----- :4 pixem
tmux new-window -t ${SESSION_NAME}:4 -n "pixem"
tmux split-window -h -t ${SESSION_NAME}:4
tmux split-window -v -t ${SESSION_NAME}:4.0

for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:4.$i "cd ~/progs/pixem" C-m
done

#----- :5 regenerator2000
tmux new-window -t ${SESSION_NAME}:5 -n "regen2000"
tmux split-window -h -t ${SESSION_NAME}:5
tmux split-window -v -t ${SESSION_NAME}:5.0

for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:5.$i "cd ~/progs/regenerator2000" C-m
done

#----- :6 hugo
tmux new-window -t ${SESSION_NAME}:6 -n "hugo"
tmux split-window -h -t ${SESSION_NAME}:6
tmux split-window -v -t ${SESSION_NAME}:6.0

for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:6.$i "cd ~/progs/ricardoquesada.github.io/" C-m
done
tmux send-keys -t ${SESSION_NAME}:6.0 "hugo server --buildDrafts" C-m


#----- :7 misc
tmux new-window -t ${SESSION_NAME}:7 -n "misc"
tmux split-window -h -t ${SESSION_NAME}:7
tmux split-window -v -t ${SESSION_NAME}:7.0

for i in {0..2}
do
tmux send-keys -t ${SESSION_NAME}:6.$i "cd ~/" C-m
done

#------
# Move to Scratch window
tmux select-window -t ${SESSION_NAME}:1
tmux select-pane -L

# Attach to the session.
tmux -2 attach-session -t ${SESSION_NAME}

