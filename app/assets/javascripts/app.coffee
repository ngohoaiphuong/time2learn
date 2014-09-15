module = [
  'templates',
  'ngResource'
  'ngRoute',
  'controllers'
  'angular-flash.service'
  'angular-flash.flash-alert-directive'
]

angular.module 'mainApp', module
  .config ['$routeProvider', 'flashProvider', '$httpProvider', ($routeProvider, flashProvider, $httpProvider) ->
    authToken = $("meta[name=\"csrf-token\"]").attr("content")
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.errorClassnames.push("alert-warning")
    flashProvider.errorClassnames.push("alert-info")
    flashProvider.errorClassnames.push("alert-success")

    $routeProvider
      .when '/login',
        templateUrl: 'login/login.html'
        controller: 'loginCtrl'
      .when '/users',
        templateUrl: 'users/list.html'
        controller: 'userCtrl'
      .when '/users/new',
        templateUrl: 'users/new.html'
        controller: 'newUserCtrl'
      .when '/users/:id/edit',
        templateUrl: 'users/view.html'
        controller: 'viewCtrl'
      .when '/tests',
        templateUrl: 'tests/list.html'
        controller: 'testsCtrl'
      .when '/tests/new',
        templateUrl: 'tests/new.html'
        controller: 'newTestCtrl'
      .when '/tests/:id/edit',
        templateUrl: 'tests/new.html'
        controller: 'editTestCtrl'
      .when '/',
        templateUrl: 'home/index.html'
        controller: 'mainCtrl'
  ]
  
