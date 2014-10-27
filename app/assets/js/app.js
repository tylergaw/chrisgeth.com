"use strict";

var $ = require("jquery"),
  utils = require("./utils"),
  viewOne = require("./views/view01")(),
  viewTwo = require("./views/view02")({
    "foo": "bar"
  }),
  viewThree = require("./views/view03")();

$(".subheading").text(function (i, t) { return t.toUpperCase(); });

viewOne.render();
viewTwo.render();
viewThree.render();

utils.doStuff({"foo": 7});
utils.tellStory("Pizza party Wednesday!!");

function tester () {
  var fishDog = "FISHDOG";
  return fishDog;
}

console.log(tester(1, 2, 3));

function foot () {
  var stuff = {"foo": {"bear": "cat"}};

  if (stuff) {

  }
  else {

  }
}

foot ();

while (viewTwo) {
  shuffle()
}
