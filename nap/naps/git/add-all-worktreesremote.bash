git for-each-ref --format='%(refname)' refs/heads/ | while read -r ref; do
  ref=$(echo "$ref" | cut -d '/' -f 3)
  git worktree add $ref
done
