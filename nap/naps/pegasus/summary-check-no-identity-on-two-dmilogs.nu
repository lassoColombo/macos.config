def main [--repo-path (-p): string, --dry-run (-d)] {

  open $"($repo_path)/summaries/summary.csv" 
  | group-by idrs --to-table 
  | each {
      $in.items | uniq-by dmilog identity
  } | filter {
    ($in | length) > 1
  } | each {
      $in | group-by --to-table identity
  } | each {
      $in.items | filter { ($in | length) > 1 }
  } | filter {
    $in | is-not-empty
  } | flatten | each {
      print $"(ansi red) opening ticket: ($in | first | get idrs) has identity ($in | first | get identity) configured on two dmilogs: ($in | get dmilog)(ansi reset)"
      if not $dry_run {
      # :TODO: open ticket
      }
  }
}
