var rnav = require('react-navigation');

exports._push = function(nav) {
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

exports._getParam = function(nav) {
  return function(name) {
    return nav.getParam(name);
  };
};

exports.createStackNavigator = function(routes) {
  return rnav.createStackNavigator(routes);
};

exports.createAppContainer = function(app) {
  return rnav.createAppContainer(app);
};
