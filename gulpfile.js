'use strict';

var
    // Path to the theme directory (no trailing slash)
    THEME_DIR = 'themes/app',

    // Remember to change the path to your site on
    // the development host
    PROXY_URL = 'localhost:8080/silverstripe-starter',

    gulp        = require('gulp'),

    sass        = require('gulp-sass'),
    sourcemaps  = require('gulp-sourcemaps'),

    browserify  = require('gulp-browserify'),

    browserSync = require('browser-sync').create();
;

gulp.task('sass', function(cb) {
    gulp.src(THEME_DIR + '/client/src/sass/*.scss')
        .pipe(sourcemaps.init())
        .pipe(sass({
            outputStyle: 'compressed',
            includePaths: [
                // to import other sass something like
                // @import "bootstrap/scss/bootstrap.scss";
                './node_modules'
            ]
        })
        .on('error', sass.logError))
        .pipe(gulp.dest(THEME_DIR + '/client/dist/css'))
        .pipe(browserSync.stream());

    cb();
});

gulp.task('browserify', function(cb) {
    gulp.src(THEME_DIR + '/client/src/js/*.js')
        .pipe(browserify())
        .pipe(gulp.dest(THEME_DIR + '/client/dist/js'))
        .pipe(browserSync.stream());

    cb();
});

gulp.task('watch', function(cb) {
    browserSync.init({
        proxy: PROXY_URL,
        files: [
            THEME_DIR + '/templates/**/*.ss'
        ],
        notify: false
    });

    gulp.watch(THEME_DIR + '/client/src/sass/**/*.scss', gulp.series(['sass']));
    gulp.watch(THEME_DIR + '/client/src/js/*.js', gulp.series(['browserify']));

    cb();
});

gulp.task('default', gulp.series('sass', 'browserify'));
