#!/bin/bash

for dir in */ ; do
	echo "============================================================="
	cd $dir && \
		git pull && \
		echo "Project name: ${dir}" && \
		echo "Branch name: $(git branch)" && \
		git remote -v && \
		cd ..
			echo "============================================================="
		done
