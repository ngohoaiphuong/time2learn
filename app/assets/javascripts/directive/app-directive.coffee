angular.module 'mainApp'
  .directive 'mainHeader', ->
    restrict: 'A'
    replace: true
    templateUrl: 'header-footer/header.html'
    scope:
      data: "=item"
    controller: ['$scope', ($scope) ->
      $scope.linkUser = '#/users'
      $scope.linkTests = '#/tests'
      $scope.linkLogout = '#/logout'
      $scope.appliedClass = (item) ->
        classSelect = ''
        if item is 1 and $scope.data is 1
          $scope.linkUser = '#'
          $scope.linkTests = '#/tests'
          classSelect = 'li-select'

        if item is 2 and $scope.data is 2
          $scope.linkUser = '#/users'
          $scope.linkTests = '#'
          classSelect = 'li-select'

        classSelect
    ]
  .directive 'mainFooter', ->
    restrict: 'A'
    replace: true
    templateUrl: 'header-footer/footer.html'
    scope:
      data: "=item"
    controller: ['$scope', ($scope) ->
      $scope.linkUser = '#/users'
      $scope.linkTests = '#/tests'
      $scope.linkLogout = '#/logout'
      $scope.appliedClass = (item) ->
        classSelect = ''
        if item is 1 and $scope.data is 1
          $scope.linkUser = '#'
          $scope.linkTests = '#/tests'
          classSelect = 'li-select'

        if item is 2 and $scope.data is 2
          $scope.linkUser = '#/users'
          $scope.linkTests = '#'
          classSelect = 'li-select'

        classSelect
    ]

