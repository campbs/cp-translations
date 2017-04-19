#!/bin/sh
# Install crowdin-cli
curl -o ~/crowdin.deb https://artifacts.crowdin.com/repo/deb/crowdin.deb
sudo dpkg -i ~/crowdin.deb

# Configure git for pushing
git config --global user.email "webteam@coderdojo.com"
git config --global user.name "CoderDojo Foundation"

# Configure NPM
echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc

# Crowdin
crowdin upload sources
for lang in it pt-PT de nl ro mt sl sk fr uk es-ES es-AR el pl et bg tr ja hi lt; do
	crowdin download -l $lang
done

# Bump version, push and publish
npm version patch
git push
npm publish
