files=$(git --cached --name-only --diff-filter=ACM | grep '\.py$')

flake8 $files