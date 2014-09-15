angular.module 'mainApp'
  .factory 'QuestionService', ->
    addMoreQuestion: ->
      question =
        question: ""
        description: ""
        options: [
        ]
      question
      
    addMoreOption: ->
      option =
        option: ""
        answer: false
      option
  .factory 'UserService', ($resource, $http, $routeParams) ->
    reset: ->
      user =
        username: ''
        email: ''
        password: ''
        password_confirmation: ''
        role: 'Select role'
      user
    all: ->
      Users = $resource 'admin/data'
      Users.query()
    get: ->
      $http.get './admin/data/' + $routeParams.id + '.json'
    remove: (id) ->
      $http.delete './admin/data/' + id + '.json'
    update: (id, user) ->
      $http.put './admin/data/' + id + '.json', user
  .factory 'AuthService', ($http) ->
    create: (user) ->
      $http.post '../admin/users.json', user
    
    login: (user) ->
      $http.post '../admin/users/sign_in.json', user
    
    saveSignIn: ->
      localStorage.setItem "isSignedIn", true
    
    isSignedIn: ->
      localStorage.getItem("isSignedIn")

