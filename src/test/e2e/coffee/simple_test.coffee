describe 'Protractor', ->

  beforeEach ->
    @ptor = protractor.getInstance()

  it 'Stuff', ->
    @ptor.get('http://www.angularjs.org')

    @ptor.findElement(protractor.By.input("yourName")).sendKeys("Julie")

    greeting = @ptor.findElement(protractor.By.binding("yourName"))

    expect(greeting.getText()).toEqual('Hello Julie!')
