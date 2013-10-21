app.service('dateService', ['currentDateService', (currentDateService) ->

  @currentLocalDateString = ->
    currentDate = currentDateService.get()
    currentDate.getFullYear() + '-' + pad((currentDate.getMonth() + 1)) + '-' + pad(currentDate.getDate())

  @daysBetween = (from, to) ->
    DAY = 1000 * 60 * 60  * 24
    Math.round((Date.parse(to) - Date.parse(from)) / DAY)

  @weeksBetween = (from, to) ->
    daysBetween = @daysBetween(from, to)
    if (daysBetween == 0)
      return 0

    daysBetween += 1
    return Math.ceil(daysBetween / 7)

  @fortnightsBetween = (from, to) ->
    daysBetween = @daysBetween(from, to)
    if (daysBetween == 0)
      return 0

    daysBetween += 1
    return Math.ceil(daysBetween / 14)

  @monthsBetween = (from, to) ->
    fromDate = new Date(Date.parse(from))
    toDate = new Date(Date.parse(to))

    if (fromDate.getTime() == toDate.getTime())
      return 0

    currentMonth = fromDate.getMonth()
    numberOfMonths = 1
    while (fromDate.getTime() < toDate.getTime())
      fromDate.setDate(fromDate.getDate() + 1)
      if (fromDate.getMonth() != currentMonth)
        currentMonth = fromDate.getMonth()
        numberOfMonths += 1

    return numberOfMonths

  pad = (number) ->
    numberAsString = new String(number)
    if (numberAsString.length != 2)
      numberAsString = '0' + numberAsString

    numberAsString

])