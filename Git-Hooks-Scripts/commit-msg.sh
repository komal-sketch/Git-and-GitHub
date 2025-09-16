if git grep -q "password\|secret_key\|API_KEY" $(git --cached --name-only)
    echo " Not recommended", check for password)
    exit 1
