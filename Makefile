export PATH := bin:$(PATH)

staging:
ifeq (, $(wildcard composer.phar))
	curl -O https://getcomposer.org/download/1.10.20/composer.phar
	chmod a+x composer.phar
endif

	git fetch
	git checkout develop
	git pull
	yarn install
	./composer.phar install
	./node_modules/gulp/bin/gulp.js
	rm -rf silverstripe-cache/
	mkdir silverstripe-cache/
	vendor/bin/sake dev/build
