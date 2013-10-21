describe 'Date Utils', ->

  it 'Will correctly calcualate the number of days between 2 dates', ->
    expect(dateUtils.daysBetween('2001-01-01', '2001-01-01')).toEqual 0
    expect(dateUtils.daysBetween('2001-01-01', '2001-01-02')).toEqual 1
    expect(dateUtils.daysBetween('2001-01-01', '2001-01-31')).toEqual 30
    expect(dateUtils.daysBetween('2001-01-01', '2000-12-31')).toEqual -1
    expect(dateUtils.daysBetween('2001-02-01', '2001-03-01')).toEqual 28

  it 'Will correctly calcualate the number of days between 2 dates across daylight savings change', ->
    expect(dateUtils.daysBetween('2013-09-20', '2013-09-30')).toEqual 10

