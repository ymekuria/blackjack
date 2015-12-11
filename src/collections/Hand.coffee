class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @score = 0;
  dealerPlay: ->
    # console.log(@maxScore())
    console.log(@scoreSetter())
    if @minScore() < 17
      while @minScore() < 17
        @hit()

  hit: ->
    @add(@deck.pop())
    @last()

  scoreSetter: ->

    @scores().reduce (minScore,maxScore) ->
      if maxScore > 21
        minScore
      else
        maxScore  

      

    # _.reduce(scores, function(minScore, maxScore) {
    #   if( maxScore > 21 ) {
    #     return minScore;
    #   } else{
    #     return maxScore;
    #   }
    # });


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  # maxScore: ->
  #   if Math.max(@scores()) > 21
  #     Math.min(@scores())
  #   else
  #     Math.max(@scores())

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    console.log(@minScore())
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    score = [@minScore(), @minScore() + 10 * @hasAce()]
    
    if score[0] > 21 
      @.trigger("ended")
    if @isDealer and @maxScore <= 21 and @maxScore >= 17
      @.trigger("dealer done")

    score


  stand: ->
    @.trigger("stand")