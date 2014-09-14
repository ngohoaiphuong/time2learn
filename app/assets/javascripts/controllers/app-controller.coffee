angular.module 'controllers',[]
  .controller 'loginCtrl', ['$scope', '$location',
    ($scope, $location) ->
      $scope.user =
        email: ''
        password: ''
        remember: false

      $scope.submit = (user) ->
        console.log user
        console.log 'welcome from submit'
        $location.path '/users'
  ]
  .controller 'mainCtrl', ['$scope', '$location'
    ($scope, $location) ->
      console.log 'hello'
      $location.path '/login'
  ]
  .controller 'userCtrl', ['$scope', '$location',
    ($scope, $location) ->
      $scope.createUser = ->
        $location.path '/users/new'
  ]
  .controller 'newCtrl', ['$scope', '$location',
    ($scope, $location) ->
      $scope.user =
        email: ''
        password: ''
        confirm: ''
        role: 'Select role'

      $scope.roles = [
        'Select role'
        'Teacher'
        'Student'
      ]

      $scope.comeBack = ->
        $location.path '/users'

      $scope.saveUser = ->
        console.log $scope.user
  ]
  .controller 'viewCtrl', ['$scope', '$location', '$routeParams',
    ($scope, $location, $routeParams) ->
      $scope.user =
        email: 'ngohoai.phuong@gmail.com'
        password: '111'
        confirm: ''
        role: 'Teacher'

      $scope.roles = [
        'Select role'
        'Teacher'
        'Student'
      ]

      $scope.editLabel = "Edit"
      $scope.editClass = "glyphicon-edit"
      $scope.deleteLabel = "Delete"
      $scope.deleteClass = "glyphicon-remove"

      $scope.enableEdit = false

      console.log $routeParams.id

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

      $scope.deleteUser = ->
        console.log $scope.user
  ]
  .controller 'testsCtrl', ['$scope', '$location',
    ($scope, $location) ->
      $scope.createTest = ->
        $location.path '/tests/new'
  ]
  .controller 'newTestCtrl', ['$scope', '$location', 'QuestionService',
    ($scope, $location, QuestionService) ->
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
  ]
  .controller 'editTestCtrl', ['$scope', '$location', 'QuestionService',
    ($scope, $location, QuestionService) ->
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
  ]
  