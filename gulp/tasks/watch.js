var gulp = require("gulp"),
  config = require("../config");

gulp.task("watch", function () {
  gulp.watch([config.assets.fonts.src, config.assets.images.src, config.assets.html.src], ["copy-static"]);
  gulp.watch(config.scss.src, ["scss"]);
});
