assert = chai.assert

describe 'CardView', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'CardView', ->
   it 'it should render on initialzation'
   