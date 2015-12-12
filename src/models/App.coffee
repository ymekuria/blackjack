# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on("lost", ->
      console.log("Player Looses")
      )
    
    @get('playerHand').on("stand", =>
      console.log("stand")
      @get("dealerHand").dealerPlay()
      )

    @get('dealerHand').on("lost", ->
      console.log("Player Wins")
      )

    @get('dealerHand').on("dealerDone", =>
      playerScore = @get('playerHand').score
      dealerScore = @get('dealerHand').score
      console.log('dealerScore',dealerScore, 'playerScore',playerScore)

      if dealerScore > playerScore
        console.log('Dealer Wins!!!')
      else if (playerScore > dealerScore)
        console.log("Player Wins!!!")  
      else
        console.log("Push") 
      
    )
 
