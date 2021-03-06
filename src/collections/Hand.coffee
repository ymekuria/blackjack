class window.Hand extends Backbone.Collection
  model: Card

  
  initialize: (@array, @deck, @isDealer) ->
    # a = @scoreSetter();
    @turn = true
    @score = @array[0].get("value") + @array[1].get("value")
    if @score == 21
      @trigger("blackjack")


  dealerPlay: ->
    @array[0].flip()
    if @score < 17
      while @score < 17
        @hit()

  hit: ->
    if(@turn)

      @add(@deck.pop())
      @scoreSetter()
      @last()

  scoreSetter: ->

    @score = @scores().reduce (minScore,maxScore) ->
      if maxScore > 21
        minScore
      else
        maxScore  

    if @score
      if @score > 21 
        @trigger("gameOver")
      else if @isDealer and @score >= 17
        @trigger("gameOver")
        


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0


  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
    


  stand: ->
    @turn = false
    @scoreSetter()
    @trigger("stand")