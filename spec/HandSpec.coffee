assert = chai.assert

describe 'Hand', ->
  deck = null
  hand = null

  beforeEach ->
    app = new App()
    deck = new Deck()
    playerHand = app.get("playerHand")
    dealerHand = app.get("dealerHand")

  describe 'hit', ->
    it 'should take the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'stand', ->
    it 'dealer should play' 
    it 'player should stop playing'
  describe 'scoreSetter'

  describe 'dealerPlay'    

