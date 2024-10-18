#!/usr/bin/env bash

# Creates process files for root and user
# observation 1 cmd --> ps -ef
# observation 2 cmd --> ps -ef user,pid,ppid,cmd
# observation 3 cmd --> ps -eo user,cmd --sort=cmd
# observation 4 cmd --> ps -eo user,cmd --sort=cmd

if [ "$1" = "create" ]; then
	ps -eo user,cmd --sort=cmd | grep "^root" >root-processes-$2
	ps -eo user,cmd --sort=cmd | grep "^$USER" >my-processes-$2
	echo "info saved in file successfully"
	exit 0
fi

if [ "$1" = "clean" ]; then
	rm root-processes-$2
	rm my-processes-$2
	echo "files deleted successfully"
	exit 0
fi

echo "incorrect command. Use 'create' or 'clean'"
