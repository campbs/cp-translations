#!/bin/sh
if [ "$CIRCLE_BRANCH" = "master" ]; then
	#crowdin-cli upload sources
	for lang in it pt-PT de nl ro mt sl sk fr uk es-ES es-AR el pl et bg tr ja hi lt; do
		crowdin-cli download -l $lang
	done
	npm version patch
	git push
	npm publish
fi
