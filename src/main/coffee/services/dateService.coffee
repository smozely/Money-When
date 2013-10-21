app.service('dateService', () ->

  # Only way to get dates, makes it mockable for tests
  @currentDate = ->
    return new Date()

  @currentLocalDateString = ->
    currentDate = @.currentDate()
    currentDate.getFullYear() + '-' + pad((currentDate.getMonth() + 1)) + '-' + pad(currentDate.getDate())

  pad = (number) ->
    numberAsString = new String(number)
    if (numberAsString.length != 2)
      numberAsString = '0' + numberAsString

    numberAsString

)