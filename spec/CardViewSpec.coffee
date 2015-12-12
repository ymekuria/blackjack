assert = chai.assert

describe 'CardView', ->
  cardView = null
  cardMode = null

  beforeEach ->
    cardModel = new Card({})
    cardView = new CardView({model:cardModel})

  describe 'CardView', ->
    it 'it should render on initialzation', ->
      spy = sinon.spy(cardView, "render")
      cardView.initialize()
      expect(spy).to.be.called