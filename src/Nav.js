exports.push = function(nav) {
  return function(route) {
    return function(params) {
      return function() {
        nav.push(route, params);
      };
    };
  };
};

exports.popToTop = function(nav) {
  return function() {
    nav.popToTop();
  };
};

exports.getParam = function(nav) {
  return function(name) {
    return nav.getParam(name);
  };
};
