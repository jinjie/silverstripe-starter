'use strict';

var
    // Path to the theme directory (no trailing slash)
    THEME_DIR = './themes/app',

    // Remember to change the path to your site on
    // the development host
    PROXY_URL = 'localhost:8080/silverstripe-starter',

    gulp        = require('gulp'),

    sass        = require('gulp-sass')(require("sass")),
    sourcemaps  = require('gulp-sourcemaps'),

    browserify  = require('browserify'),

    source      = require('vinyl-source-stream'),
    buffer      = require('vinyl-buffer'),

    uglify      = require('gulp-uglify'),

    browserSync = require('browser-sync').create(),

    notifier    = require('node-notifier')
;

gulp.task('sass', function(cb) {
    gulp.src(THEME_DIR + '/client/src/sass/*.scss')
        .pipe(sourcemaps.init())
        .pipe(
            sass({
                outputStyle: 'compressed',
                includePaths: [
                    // to import other sass something like
                    // @import "bootstrap/scss/bootstrap.scss";
                    './node_modules'
                ]
            }).on('error', function(err) {
                notifier.notify({
                    'title': 'SASS Compile Error',
                    'message': err.message
                });

                console.log(err.message);
            })
         )
        .pipe(gulp.dest(THEME_DIR + '/client/dist/css'))
        .pipe(browserSync.stream());

    cb();
});

gulp.task('browserify', function(cb) {
    var b = browserify(THEME_DIR + '/client/src/js/script.js');

    b.bundle()
        .on('error', function(err) {
            notifier.notify({
                'title': 'JS Compile Error',
                'message': err.message
            });

            console.log(err.message);
            this.emit('end');
        })
        .pipe(source('script.js'))
        .pipe(buffer())
        .pipe(uglify())
        .pipe(gulp.dest(THEME_DIR + '/client/dist/js'))
        .pipe(browserSync.stream());

    cb();
});

gulp.task('browser-sync', function(cb) {
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

gulp.task('fontawesome', function(cb) {
    gulp.src('node_modules/@fortawesome/fontawesome-free/webfonts/**/*')
        .pipe(gulp.dest(THEME_DIR + '/client/dist/fontawesome-free/webfonts'));

      cb();
});

gulp.task('default', gulp.series('sass', 'fontawesome', 'browserify'));
gulp.task('watch', gulp.series('default', 'browser-sync'));
