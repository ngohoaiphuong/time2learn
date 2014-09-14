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