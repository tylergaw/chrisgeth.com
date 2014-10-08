var view = function (customOpts) {
    var opts = customOpts || {};

    return {
      name: "View 03",
      element: ".element-3",
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
