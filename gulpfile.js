// gulpfile.js
// ===========
// Rather than manage one giant configuration file responsible
// for creating multiple tasks, each task has been broken out into
// its own file in gulp/tasks. Any files in that directory get
// automatically required below.
//
// To add a new task, add a new task file that directory.
// gulp/tasks/default.js specifies the default set of tasks to run
// when you run `gulp`.

var requireDir = require('require-dir'),
  gulp = require('gulp'),
  taskListing = require('gulp-task-listing');

gulp.task('help', taskListing);

// Require all tasks in gulp/tasks, including subfolders
requireDir('./gulp/tasks', { recurse: true });

gulp.task('noop', function () {
  console.log("I did nothing, but nothing broke either so that's good.");
});
