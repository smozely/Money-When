app.service('currentDateService', () ->

  # Anybody that wants the date needs to come here, mockable for unit tests
  @get = ->
    return new Date()

)