# Silverstripe Starter Pack

My standard pack to start a new Silverstripe website.

## How to start

```sh
composer create-project jinjie/silverstripe-starter myproject
cd myproject
yarn

# Copy .env.example to .env and edit the file before running this
vendor/bin/sake dev/build
```

## Silverstripe Elemental

When building for the first time, run `DNADesign-Elemental-Tasks-MigrateContentToElement` task to migrate content to
Elemental



## Start developing

1. Edit [gulpfile.js](gulpfile.js) and change the address of the website
2. Run `gulp watch`
