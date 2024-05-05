for branch in `git branch -l`; do cd $branch && git pull && cd .. ; done
