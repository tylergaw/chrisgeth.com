var gulp = require("gulp"),
  sass = require("gulp-sass"),
  plumber = require("gulp-plumber"),
  postcss = require("gulp-postcss"),
  autoprefixer = require("autoprefixer-core"),
  scsslint = require("gulp-scss-lint"),
  cache = require("gulp-cached"),
  colors = require("colors"),
  config = require("../config").scss;

gulp.task("scss-lint", function () {
  return gulp.src(config.src)
    .pipe(cache("scsslint"))
    .pipe(scsslint({
      "maxBuffer": 307200,
      "config": "./gulp/scss-lint-config.yml",
      "reporterOutput": "scssReport.xml",
      customReport: reporter
    }));
});

gulp.task("scss", ["scss-lint"], function () {
  return gulp.src(config.src)
    .pipe(plumber())
    .pipe(sass({
      sourceMap: false,
      outputStyle: "compressed"
    }))
    .pipe(postcss([autoprefixer]))
    .pipe(gulp.dest(config.dest));
});

function reporter (file) {
  if (!file.scsslint.success) {
    var msg = file.scsslint.issues.length + " scss-lint issues";

    console.log((msg + " in " + file.path).red);
  }
}
