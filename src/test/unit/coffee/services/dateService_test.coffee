beforeEach module 'myApp'

describe 'Date Service', ->

  # TODO make this like calculator service.
  beforeEach inject (dateService) ->
    @myDateService = dateService

  # Figure out why 'this' is getting changed. Otherwise I wouldn't pass in DateService
  setMockDate = (dateService, mockedDateString) ->
    dateService.currentDate = ->
      return new Date(Date.parse(mockedDateString))

  it 'It will return the current date', ->
    setMockDate(@myDateService, '2001-01-01')
    expect(@myDateService.currentLocalDateString()).toEqual '2001-01-01'

    setMockDate(@myDateService, '2001-10-10')
    expect(@myDateService.currentLocalDateString()).toEqual '2001-10-10'

