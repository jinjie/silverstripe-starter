export PATH := bin:$(PATH)

staging:
ifeq (, $(wildcard composer.phar))
	curl -O https://getcomposer.org/download/1.10.20/composer.phar
	chmod a+x composer.phar
endif
	yarn install
	./composer.phar install
	./node_modules/gulp/bin/gulp.js
	rm -rf silverstripe-cache/
	mkdir silverstripe-cache/
	php vendor/silverstripe/framework/cli-script.php dev/build
