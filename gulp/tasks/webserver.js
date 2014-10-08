var gulp = require("gulp"),
  webserver = require("gulp-webserver");

gulp.task("webserver", function () {
  return gulp.src("./public")
    .pipe(webserver({
      host: "0.0.0.0",
      port: 8005,
      livereload: true,
      directoryListing: true,
      open: true
    }));
});
