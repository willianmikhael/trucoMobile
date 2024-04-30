import 'card_test.dart';
import 'player_test.dart';

class Game {
  List<Player> players;

  Game(this.players);

  void distributeCards(List<Card> deck) {
    deck.shuffle();
    int cardsPerPlayer = deck.length ~/ players.length;

    for (int i = 0; i < players.length; i++) {
      List<Card> hand = deck.sublist(i * cardsPerPlayer, (i + 1) * cardsPerPlayer);
      players[i].hand = hand;
    }
  }
}

void main() {
  List<Card> deck = [];
  for (var naipe in Naipe.values) {
    deck.addAll(Card.criarCartasPorNaipe(naipe));
  }

  Game game = Game([
    Player('Player 1', []),
    Player('Player 2', []),
    Player('Player 3', []),
    Player('Player 4', []),
  ]);

  game.distributeCards(deck);

  for (var player in game.players) {
    print(player);
  }
}

/*void main() {
  for (var naipe in Naipe.values) {
    var cartas = Card.criarCartasPorNaipe(naipe);
    print('Cartas do naipe $naipe:');
    for (var carta in cartas) {
      print('${carta.valor} de ${carta.naipe}');
    }
    print('');
  }

  Card.checkWinner(ValorCarta.rei, Naipe.copas);
}*/
