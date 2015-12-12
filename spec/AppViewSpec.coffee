assert = chai.assert

describe 'Hand', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'AppView', ->
   it 'clicks should trigger hit and stand'
   it 'it should render on initialzation'
   it 'should re-render on click events'
   