assert = chai.assert

describe 'HandView', ->
  app = null
  playerHand = null
  handView = null

  beforeEach ->
    app = new App()
    playerHand = app.get("playerHand")
    handView = new HandView(collection: playerHand)

  describe 'HandView', ->
    it 'it should render on initialzation', ->
      spy = sinon.spy(handView, "render")
      handView.initialize()
      expect(spy).to.be.called

    it 'should re-render on change events', ->
      spy = sinon.spy(handView, "render")
      playerHand.trigger("add remove change")
      expect(spy).to.be.calledThrice