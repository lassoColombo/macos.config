ls **/*dmilog*/config.yaml | get name | each {|path|
  let $idrs = $path | path split | first
  let rel_path = $path | path split | last 2 | path join
  try {
    cd $idrs; 
    let conf = open $rel_path
    $conf | update identities.microsoft ($conf | get identities.microsoft | each {$in | update sources.management.resources 10r/m}) | to yaml | save --force $rel_path
    if (git diff) != "" {
      git add $rel_path; git commit -m "decreased management resources from 15r/m to 10r/m"; git push origin $idrs
    }
  } catch {
    $"( $idrs )\n" | save --append /tmp/log.txt
  }
}
