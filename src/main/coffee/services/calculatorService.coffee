app.service('calculatorService', ['dateService', (dateService) ->

  @calculate = (amount, needed, freq) ->
    numberOfInstallments = calculateInstallments(needed, freq)
    amount / Math.max(1, numberOfInstallments)

  calculateInstallments = (needed, freq) ->
    currentDateString = dateService.currentLocalDateString()
    daysBetween = dateService.daysBetween(currentDateString, needed)
    if (freq == 'DAY')
        return dateService.daysBetween(currentDateString, needed)
    if (freq == 'WEEK')
        return dateService.weeksBetween(currentDateString, needed)
    if (freq == 'FORTNIGHT')
        return dateService.fortnightsBetween(currentDateString, needed)
    if (freq == 'MONTH')
        return dateService.monthsBetween(currentDateString, needed)

    return 1

])