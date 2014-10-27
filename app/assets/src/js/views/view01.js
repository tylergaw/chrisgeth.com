var view = function (customOpts) {
    var opts = customOpts || {};

    return {
      name: "View 01",
      element: ".element-1",
      render: function () {
        console.log(this.name + " rendered");
      },
      options: function () {
        console.log(opts);
      }
    };
  };

module.exports = view;
