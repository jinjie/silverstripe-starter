export PATH := bin:$(PATH)

staging:
ifeq (, $(wildcard composer-stable.phar))
    curl -O https://getcomposer.org/composer-stable.phar
    chmod a+x composer-stable.phar
endif

    git fetch
    git checkout develop
    git pull
    yarn install
    ./composer-stable.phar install
    ./node_modules/gulp/bin/gulp.js
    rm -rf silverstripe-cache/
    mkdir silverstripe-cache/
    vendor/bin/sake dev/build

# Sync assets from development host to staging
# staging_rsync:
#     rsync -avzh public/assets user@mystagingserver:path/to/public
