assert = chai.assert

describe 'AppView', ->
  appView = null 

  beforeEach ->
    #appView = new AppView(model: new App())
    appView = new AppView(model: new App())

  describe 'AppView', ->
    it 'clicks should trigger hit and stand', ->

    # it 'it should render on initialzation', ->
    #   spy = sinon.spy(appView, "render")
    #   appView.initialize()
    #   expect(spy).to.be.called


