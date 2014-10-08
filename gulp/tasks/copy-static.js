var gulp = require("gulp"),
  config = require("../config").assets;

gulp.task("copy-static", function () {
  gulp.src(config.fonts.src)
    .pipe(gulp.dest(config.fonts.dest));

  gulp.src(config.images.src)
    .pipe(gulp.dest(config.images.dest));

  gulp.src(config.html.src)
    .pipe(gulp.dest(config.html.dest));
});
