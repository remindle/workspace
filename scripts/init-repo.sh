#!/bin/bash

# Create a new repository
echo "# $2" >> README.md

cat >> README.md << EOL

## Description
$3
EOL

git init
git add README.md

gh repo create $1/$2 --public

git commit -m "feat: first commit"
git branch -M main
git remote add origin git@github.com:$1/$2.git
git push -u origin main