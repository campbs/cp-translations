#!/bin/sh
# Install crowdin-cli and deps
gem install mime-types -v 2.6.2
gem install rest-client -v 1.8
gem install crowdin-cli -v 0.5.5

# Configure git for pushing
git config --global user.email "webteam@coderdojo.com"
git config --global user.name "CoderDojo Foundation"

# Configure NPM
echo "_auth=$NPM_TOKEN" >> ~/.npmrc
echo "email=webteam@coderdojo.com" >> ~/.npmrc

# Crowdin
crowdin-cli upload sources
for lang in it pt-PT de nl ro mt sl sk fr uk es-ES es-AR el pl et bg tr ja hi lt; do
	crowdin-cli download -l $lang
done

# Bump version, push and publish
npm version patch
git push
npm publish
