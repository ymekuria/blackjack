assert = chai.assert

describe 'App Model', ->
  deck = null
  hand = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    app = new App()
    deck = app.get("deck")
    playerHand = app.get("playerHand")
    dealerHand = app.get("dealerHand")

  describe 'initialze', ->

    it 'it should initialze with a deck a playerHand and a dealerHand', ->
    it 'it should listen for lost stand and dealerDone'  

  