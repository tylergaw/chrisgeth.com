var requireDir = require('require-dir'),
  gulp = require('gulp'),
  taskListing = require('gulp-task-listing');

gulp.task('help', taskListing);

// Require all tasks in gulp/tasks, including subfolders
requireDir('./gulp/tasks', { recurse: true });
