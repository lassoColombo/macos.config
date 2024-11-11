let whitelist = ["main", "master", "quality"]
git for-each-ref --format='%(refname:short)' refs/heads | lines |
   filter {|branch| not ($whitelist | any {|w| $w == $branch}) } |
   each {|branch| git worktree add $branch }
