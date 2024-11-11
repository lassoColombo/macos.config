let exclude = ["master", "quality"]
for ref in (git for-each-ref --format='%(refname)' refs/heads/ | each { |it| echo $it | split-column '/' | get 2 }) {
    if $exclude | any? { |ex| $ex == $ref } {
        continue
    }
    if (try { cd $ref } catch { echo "directory $ref does not exist. skipping" ; continue }) {
        # :TODO: logic here
        echo "done with $ref"
        cd ..
    }
}


let whitelist = ["main", "master", "quality"]
git for-each-ref --format='%(refname:short)' refs/heads | lines |
   filter {|branch| not ($whitelist | any {|w| $w == $branch}) } |
   each {
   |branch|
       cd $branch
       # do stuff
}
