var gulp = require('gulp'),
  sass = require('gulp-sass'),
  rev = require('gulp-rev'),
  plumber = require('gulp-plumber'),
  postcss = require('gulp-postcss'),
  autoprefixer = require('autoprefixer-core'),
  scsslint = require('gulp-scss-lint'),
  cache = require('gulp-cached'),
  colors = require('colors'),
  del = require('del'),
  config = require('../config').scss;

gulp.task('scss-lint', function () {
  return gulp.src(config.src)
    .pipe(cache('scsslint'))
    .pipe(scsslint({
      'maxBuffer': 307200,
      'config': './gulp/scss-lint-config.yml',
      'reporterOutput': './gulp/scssReport.xml',
      customReport: reporter
    }));
});

gulp.task('css-clean', function () {
  del([config.dest + '/**']);
});

gulp.task('scss', ['scss-lint', 'css-clean'], function () {
  return gulp.src(config.src)
    .pipe(plumber())
    .pipe(sass({
      sourceMap: false,
      outputStyle: 'nested'
    }))
    .pipe(postcss([autoprefixer]))
    .pipe(rev())
    .pipe(gulp.dest(config.dest))
    .pipe(rev.manifest())
    .pipe(gulp.dest(config.dest));
});

function reporter (file) {
  if (!file.scsslint.success) {
    var msg = file.scsslint.issues.length + ' scss-lint issues';

    console.log((msg + ' in ' + file.path).red);
  }
}
