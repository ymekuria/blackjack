# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on("ended", ->
      console.log("Player Looses")
      )
    
    @get('playerHand').on("stand", =>
      console.log("Player stands")
      @get("dealerHand").dealerPlay()
      )

    @get('dealerHand').on("ended", ->
      console.log("Player Wins")
      )


