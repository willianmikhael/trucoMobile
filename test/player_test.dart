import 'card_test.dart';

class Player {
  String name;
  List<Card> hand;

  Player(this.name, this.hand);

  @override
  String toString() {
    return 'Player: $name, Hand: $hand';
  }
}