loginCtrl = ($scope, $location, AuthService, flash) ->
  $location.path('/users') if AuthService.isSignedIn()
  $scope.user =
    email: ''
    password: ''
    remember: false

  $scope.submit = (user) ->
    AuthService.login(user)
    .success (data, status) ->
      flash.success = 'Login successfully.'
      AuthService.saveSignIn()
      $location.path '/users'
    .error (data, status) ->
      if status is 401
        flash.error = data.error
        return
      flash.error = 'Unexplained error'

mainCtrl = ($scope, $location) ->
  console.log 'hello'
  $location.path '/login'

userCtrl = ($scope, $location, UserService, AuthService) ->
  $location.path('/') unless AuthService.isSignedIn()
  $scope.users = UserService.all()
  $location.path('/users/new') unless $scope.users.length

  $scope.createUser = ->
    $location.path '/users/new'

  $scope.deleteUser = (id) ->
    console.log 'deleteUser'
    UserService.remove id

newUserCtrl = ($scope, $location, AuthService, flash, UserService) ->
  $location.path('/') unless AuthService.isSignedIn()
  $scope.user = UserService.reset()

  $scope.roles = [
    'Select role'
    'Teacher'
    'Student'
  ]

  $scope.validScope =
    role: true
    password: true

  $('input#username').focus()

  $scope.selectAction = ->
    $scope.validScope.role = true
    if $scope.user.role is $scope.roles[0]
      $scope.validScope.role = false

  $scope.onUpdatePassword = ->
    $scope.validScope.password = true
    if $scope.user.password isnt $scope.user.password_confirmation
      $scope.validScope.password = false

  $scope.comeBack = ->
    $location.path '/users'

  $scope.saveUser = (user) ->
    if $scope.newUserForm.$valid
      $scope.validScope =
        role: true
        password: true

      if user.password isnt user.password_confirmation
        $scope.validScope.password = false
        return

      if user.role is $scope.roles[0]
        $scope.validScope.role = false
        return

      AuthService.create(user)
      .success (data, status) ->
        flash.success = 'Create new user successfully.'
        $scope.user = UserService.reset()
        $('input#username').focus()
      .error (data, status) ->
        if status is 422
          if data.errors.password?
            flash.error = 'Password ' + data.errors.password[0]
            return
          if data.errors.email?
            flash.error = 'Email ' + data.errors.email[0]
            return

        if data.error
          flash.error = data.error
        else
          flash.error = 'Unexplained error'

viewCtrl = ($scope, $location, $routeParams, AuthService, UserService, flash) ->
  $location.path('/') unless AuthService.isSignedIn()
  $scope.user = UserService.reset()
  UserService.get().success (data) ->
    $scope.user = data.user

  $scope.roles = [
    'Select role'
    'Teacher'
    'Student'
  ]

  $scope.validScope =
    role: true
    password: true

  $scope.editLabel = "Edit"
  $scope.editClass = "glyphicon-edit"
  $scope.deleteLabel = "Delete"
  $scope.deleteClass = "glyphicon-remove"
  $scope.enableEdit = false

  $scope.selectAction = ->
    $scope.validScope.role = true
    if $scope.user.role is $scope.roles[0]
      $scope.validScope.role = false

  $scope.onUpdatePassword = ->
    $scope.validScope.password = true
    if $scope.user.password isnt $scope.user.password_confirmation
      $scope.validScope.password = false

  $scope.comeBack = ->
    $location.path '/users'

  $scope.editUser = ->
    $scope.enableEdit = !$scope.enableEdit
    if $scope.enableEdit
      $scope.editLabel = "Cancel"
      $scope.deleteLabel = "Save"
      $scope.editClass = "glyphicon-edit"
      $scope.deleteClass = "glyphicon-floppy-save"
    else
      $scope.editLabel = "Edit"
      $scope.deleteLabel = "Delete"
      $scope.editClass = "glyphicon-edit"
      $scope.deleteClass = "glyphicon-remove"

  $scope.deleteUser = (id) ->
    if not $scope.enableEdit
      if window.confirm 'Are you sure delete this user.'
        UserService.remove(id).success ->
          flash.success = 'Remove user successfully.'
          $location.path '/users'
    else
      if window.confirm 'Are you sure update this user.'
        UserService.update(id, $scope.user)
        .success ->
          flash.success = 'Update user successfully.'
          $scope.enableEdit = !$scope.enableEdit
        .error (data) ->
          flash.error = data.error

newTestCtrl = ($scope, $location, QuestionService, AuthService) ->
  $location.path('/') unless AuthService.isSignedIn()
  $scope.tests =
    name: ''
    description: ''
    questions: [
      question: ""
      description: ""
      options: [
      ]
    ]

  $scope.questionCount = 2
  $scope.optionCount = 0

  $scope.comeBack = ->
    $location.path '/tests'

  $scope.saveTest = (newTest) ->
    console.log 'save test'
    console.log newTest

  $scope.addQuestion = ->
    $scope.tests.questions.push QuestionService.addMoreQuestion()

  $scope.removeQuestion = (index) ->
    console.log 'removeQuestion'
    console.log index
    $scope.tests.questions.splice(index, 1)

  $scope.addOption = (item) ->
    item.push QuestionService.addMoreOption()

  $scope.removeOption = (question, index) ->
    console.log 'removeOption'
    console.log '========='
    console.log question
    console.log index
    console.log '========='
    console.log $scope.tests.questions
    question.options.splice(index, 1)
    console.log $scope.tests.questions

testsCtrl =($scope, $location, AuthService) ->
  $location.path('/') unless AuthService.isSignedIn()
  $scope.createTest = ->
    $location.path '/tests/new'

editTestCtrl = ($scope, $location, QuestionService, AuthService) ->
  $location.path('/') unless AuthService.isSignedIn()
  $scope.tests =
    name: ''
    description: ''
    questions: [
      question: ""
      description: ""
      options: [
      ]
    ]

  $scope.questionCount = 2
  $scope.optionCount = 0

  $scope.comeBack = ->
    $location.path '/tests'

  $scope.saveTest = (newTest) ->
    console.log 'save test'
    console.log newTest

  $scope.addQuestion = ->
    $scope.tests.questions.push QuestionService.addMoreQuestion()

  $scope.removeQuestion = (item) ->
    console.log 'removeQuestion'
    console.log item

  $scope.addOption = (item) ->
    item.push QuestionService.addMoreOption()

  $scope.removeOption = (question, option) ->
    console.log 'removeOption'
    console.log '========='
    console.log question
    console.log option
    console.log '========='

# -------------------------- Main Module --------------------------

angular.module 'controllers',[]
  .controller 'loginCtrl', ['$scope', '$location', 'AuthService', 'flash', loginCtrl]
  .controller 'mainCtrl', ['$scope', '$location', mainCtrl]
  .controller 'userCtrl', ['$scope', '$location', 'UserService', 'AuthService', userCtrl]
  .controller 'newUserCtrl', ['$scope', '$location', 'AuthService', 'flash', 'UserService', newUserCtrl]
  .controller 'viewCtrl', ['$scope', '$location', '$routeParams', 'AuthService', 'UserService', 'flash', viewCtrl]
  .controller 'testsCtrl', ['$scope', '$location', 'AuthService', testsCtrl]
  .controller 'newTestCtrl', ['$scope', '$location', 'QuestionService', 'AuthService', newTestCtrl]
  .controller 'editTestCtrl', ['$scope', '$location', 'QuestionService', 'AuthService', editTestCtrl]
  