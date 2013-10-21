app.service('calculatorService', ['dateService', (dateService) ->

  @calculate = (amount, needed, freq) ->
    numberDaysBetween = dateUtils.daysBetween(dateService.currentLocalDateString(), needed)
    amount / numberDaysBetween
])