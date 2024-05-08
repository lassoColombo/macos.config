exclude=("master" "quality")
git for-each-ref --format='%(refname)' refs/heads/ | while read -r ref; do
  ref=$(echo "$ref" | cut -d '/' -f 3)
  if [[ " ${exclude[@]} " =~ " $ref " ]]; then
    continue
  fi
  cd $ref || echo -e "\e[31mdirectory $ref does not exist. skipping\e[0m" && continue
  # :TODO: logic here
  echo -e "\e[32mdone with $ref\e[0m"
  cd ..
done
