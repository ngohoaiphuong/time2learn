module = [
  'templates',
  'ngRoute',
  'controllers'
]

angular.module 'mainApp', module
  .config ($routeProvider) ->
    $routeProvider
      .when '/login',
        templateUrl: 'login/login.html'
        controller: 'loginCtrl'
      .when '/users',
        templateUrl: 'users/list.html'
        controller: 'userCtrl'
      .when '/users/new',
        templateUrl: 'users/new.html'
        controller: 'newCtrl'
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
  
