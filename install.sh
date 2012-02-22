#!/bin/sh

FILES=".inputrc .vimrc .bash_profile"

# yyyy-mm-dd_hh24-mi
DT=`date  '+%Y-%m-%d_%H-%M'`

for i in $FILES;do
	if [ -f $HOME/${i} ];then
		echo "${i} already exist! rename to ${i}-${DT}";
	fi;
done;



