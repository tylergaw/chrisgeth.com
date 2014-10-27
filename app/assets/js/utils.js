function utils () {
  return {
    log: function (msg) {
      console.log(msg);
    },

    tellStory: function (story) {
      this.log(story || "go to the border of 5th and 5th Ave for coolness");
    },

    doStuff: function (stuff) {
      console.log(stuff);
    },

    noop: function () {}
  };
}

module.exports = utils();
