assert = chai.assert

describe 'HandView', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'HandView', ->
   it 'it should render on initialzation'
   it 'it should re-render on add remove and change events'