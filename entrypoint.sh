#!/bin/sh

set -ex

env

cat > ~/.netrc << EOF
machine api.heroku.com
    login $HEROKU_LOGIN
    password $HEROKU_API_KEY
machine git.heroku.com
    login $HEROKU_LOGIN
    password $HEROKU_API_KEY
EOF

# Add heroku.com to the list of known hosts
mkdir ~/.ssh
ssh-keyscan -H heroku.com >> ~/.ssh/known_hosts

git remote add heroku "https://git.heroku.com/${HEROKU_APP}.git"
git push heroku "${BRANCH}"
