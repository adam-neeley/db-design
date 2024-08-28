#!/usr/bin/env nix-shell
#! nix-shell -i bash -p bash sshpass
sshpass -f.pass ssh atn22@nrs-projects-ssh.humboldt.edu -t sqlplus /
