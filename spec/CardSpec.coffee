assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

  it "should have unique values", ->
    collection = new Deck()
    test = true
    collection.each (card) ->
      count = 0
      collection.each (subCard) ->
        if subCard.get("rank") == card.get("rank") and subCard.get("suitName") == card.get("suitName")
          count++ 
      if count > 1
        test = false

    expect(test).to.be.true 

  it 'should have a value and a suite',
  it 'should invoke flip on stand event',
         


