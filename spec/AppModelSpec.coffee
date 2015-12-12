assert = chai.assert

describe 'App Model', ->
  app = null
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    app = new App()
    deck = app.get("deck")
    playerHand = app.get("playerHand")
    dealerHand = app.get("dealerHand")

  describe 'initialze', ->

    it 'it should initialze with a deck a playerHand and a dealerHand', ->
      expect(playerHand).to.not.equal(undefined)
      expect(dealerHand).to.not.equal(undefined)

    it 'it should listen for lost stand and dealerDone', -> 
      #dealerPlay()
      spy = sinon.spy(dealerHand, "dealerPlay")
      playerHand.stand()
      expect(spy.called).to.be.true

      #gameOver is called
      # spy = sinon.spy(app, "gameOver")
      # dealerHand.dealerPlay()
      # # dealerHand.trigger("dealerDone")
      # expect(spy.called).to.be.true
      
