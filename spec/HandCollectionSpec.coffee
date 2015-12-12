assert = chai.assert

describe 'Hand Collection', ->
  app = null
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    app = new App()
    deck = app.get("deck")
    playerHand = app.get("playerHand")
    dealerHand = app.get("dealerHand")

  describe 'hit', ->

    it 'should take the last card from the deck', ->
      assert.strictEqual deck.length, 48
      assert.strictEqual deck.last(), playerHand.hit()
      assert.strictEqual deck.length, 47

  describe 'stand', ->
    it 'dealer should play', -> 
      spy = sinon.spy(dealerHand, "dealerPlay")
      playerHand.stand()
      expect(spy.called).to.be.true

    it 'player should stop playing', ->
      spy = sinon.spy(playerHand, "add")
      playerHand.stand()
      playerHand.hit()
      expect(spy.called).to.be.false

  describe 'scoreSetter', ->
    it 'should set the score upon initialzation'
    it 'should update after a hit'
  
  # describe 'dealerDone', ->
  #   it 'should trigger dealerDone if score is between 17 and 21'
  #   spy = sinon.spy(dealerHand, "trigger")
  #   dealerHand.score = 18
  #   dealerHand.scoreSetter


