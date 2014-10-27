var view = function (customOpts) {
    var opts = customOpts || {};

    return {
      name: "View 02",
      element: ".element-2",
      render: function () {
        console.log(this.name + " rendered");
      },
      options: function () {
        if (opts) {

        }
        else {

        }
      }
    };
  };

module.exports = view;
