# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on("lost", @gameOver)
    
    @get('playerHand').on("stand", =>
      @get("dealerHand").dealerPlay()
      )

    @get('dealerHand').on("lost", @gameOver)

    @get('dealerHand').on("dealerDone", @gameOver)

  gameOver : =>
    playerScore = @get('playerHand').score
    dealerScore = @get('dealerHand').score
    console.log('dealerScore',dealerScore, 'playerScore',playerScore)
    if dealerScore > 21
      console.log("Dealer Busts")
    else if playerScore > 21
      console.log("Player Busts")
    else 
      if dealerScore > playerScore
        console.log('Dealer Wins!!!')
      else if (playerScore > dealerScore)
        console.log("Player Wins!!!")  
      else
        console.log("Push") 
      



 
