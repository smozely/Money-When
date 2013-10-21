describe 'Date Service', ->

  currentDateService = null
  dateService = null

  beforeEach ->
    module 'myApp'

    inject (_dateService_) ->
      dateService = _dateService_

    inject (_currentDateService_) ->
      currentDateService = _currentDateService_

  setMockDate = (mockedDateString) ->
    currentDateService.get = ->
      return new Date(Date.parse(mockedDateString))

  it 'It will return the current date string', ->
    setMockDate('2001-01-01')
    expect(dateService.currentLocalDateString()).toEqual '2001-01-01'

    setMockDate('2001-10-10')
    expect(dateService.currentLocalDateString()).toEqual '2001-10-10'

  it 'Will correctly calcualate the number of days between 2 date strings', ->
    expect(dateService.daysBetween('2001-01-01', '2001-01-01')).toEqual 0
    expect(dateService.daysBetween('2001-01-01', '2001-01-02')).toEqual 1
    expect(dateService.daysBetween('2001-01-01', '2001-01-31')).toEqual 30
    expect(dateService.daysBetween('2001-01-01', '2000-12-31')).toEqual -1
    expect(dateService.daysBetween('2001-02-01', '2001-03-01')).toEqual 28

  it 'Will correctly calcualate the number of days between 2 date strings across daylight savings change', ->
    expect(dateService.daysBetween('2013-09-20', '2013-09-30')).toEqual 10

  it 'Will correctly calcualate the number of weeks (or part weeks) between 2 date strings', ->
    expect(dateService.weeksBetween('2001-01-01', '2001-01-01')).toEqual 0
    expect(dateService.weeksBetween('2001-01-01', '2001-01-02')).toEqual 1
    expect(dateService.weeksBetween('2001-01-01', '2001-01-07')).toEqual 1
    expect(dateService.weeksBetween('2001-01-01', '2001-01-08')).toEqual 2
    expect(dateService.weeksBetween('2001-01-01', '2001-01-15')).toEqual 3
    expect(dateService.weeksBetween('2001-01-01', '2001-01-18')).toEqual 3

  it 'Will correctly calcualate the number of fortnights (or part fortnights) between 2 date strings', ->
    expect(dateService.fortnightsBetween('2001-01-01', '2001-01-01')).toEqual 0
    expect(dateService.fortnightsBetween('2001-01-01', '2001-01-02')).toEqual 1
    expect(dateService.fortnightsBetween('2001-01-01', '2001-01-14')).toEqual 1
    expect(dateService.fortnightsBetween('2001-01-01', '2001-01-15')).toEqual 2
    expect(dateService.fortnightsBetween('2001-01-01', '2001-02-11')).toEqual 3

  it 'Will correctly calcualate the number of months (or part months) between 2 date strings', ->
    expect(dateService.monthsBetween('2001-01-01', '2001-01-01')).toEqual 0
    expect(dateService.monthsBetween('2001-01-01', '2001-01-02')).toEqual 1
    expect(dateService.monthsBetween('2001-01-01', '2001-01-31')).toEqual 1
    expect(dateService.monthsBetween('2001-01-01', '2001-02-01')).toEqual 2
    expect(dateService.monthsBetween('2000-01-01', '2000-02-29')).toEqual 2
    expect(dateService.monthsBetween('2001-01-01', '2001-06-01')).toEqual 6
    expect(dateService.monthsBetween('2001-01-01', '2001-12-31')).toEqual 12

