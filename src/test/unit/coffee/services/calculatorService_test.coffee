describe 'Calculator Service', ->

  currentDateService = null
  calculatorService = null

  beforeEach ->
    module 'myApp'

    inject (_currentDateService_) ->
      currentDateService = _currentDateService_

    inject (_calculatorService_) ->
      calculatorService = _calculatorService_

  setMockDate = (mockedDateString) ->
    currentDateService.get = ->
      return new Date(Date.parse(mockedDateString))

  it 'Will return the amount divided by the number of days until needed', ->
    setMockDate('2013-01-01')
    expect(calculatorService.calculate(1, '2013-01-01', 'DAY')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-02', 'DAY')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-03', 'DAY')).toEqual 0.50
    expect(calculatorService.calculate(10, '2013-01-03', 'DAY')).toEqual 5
    expect(calculatorService.calculate(365, '2014-01-01', 'DAY')).toEqual 1

  it 'Will return the amount divided by the number of weeks until needed', ->
    setMockDate('2013-01-01')
    expect(calculatorService.calculate(1, '2013-01-01', 'WEEK')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-02', 'WEEK')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-08', 'WEEK')).toEqual 0.50
    expect(calculatorService.calculate(10, '2013-01-08', 'WEEK')).toEqual 5
    expect(calculatorService.calculate(3, '2013-01-15', 'WEEK')).toEqual 1
    expect(calculatorService.calculate(53, '2014-01-01', 'WEEK')).toEqual 1

  it 'Will return the amount divided by the number of fortnights until needed', ->
    setMockDate('2013-01-01')
    expect(calculatorService.calculate(1, '2013-01-01', 'FORTNIGHT')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-02', 'FORTNIGHT')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-08', 'FORTNIGHT')).toEqual 1
    expect(calculatorService.calculate(1, '2013-01-15', 'FORTNIGHT')).toEqual 0.50
    expect(calculatorService.calculate(1, '2013-01-15', 'FORTNIGHT')).toEqual 0.50
    expect(calculatorService.calculate(3, '2013-02-05', 'FORTNIGHT')).toEqual 1
    expect(calculatorService.calculate(27, '2014-01-01', 'FORTNIGHT')).toEqual 1

  it 'Will return the amount divided by the number of months until needed', ->
    setMockDate('2013-01-01')
    expect(calculatorService.calculate(1, '2013-01-01', 'MONTH')).toEqual 1
    expect(calculatorService.calculate(1, '2013-02-01', 'MONTH')).toEqual 0.50
    expect(calculatorService.calculate(12, '2013-12-31', 'MONTH')).toEqual 1