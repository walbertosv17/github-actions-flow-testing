
commits=$(git log --pretty=format:"%s" $1..$2)
for commit in $commits; do
  length=$(echo -n $commit | wc -c)
  if [ $length -lt 30 ]; then
    echo "❌ error: Commit message is less than 30 characters"
    exit 1
  else
    echo "✅ Commit message is valid!"
  fi
done
