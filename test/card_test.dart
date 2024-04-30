enum ValorCarta {
  quatro,
  cinco,
  seis,
  sete,
  dama,
  valete,
  rei,
  ass,
  dois,
  tres,
}

enum Naipe {
  ouros,
  copas,
  espadas,
  paus,
}

class Card {
  Naipe? naipe;
  ValorCarta? valor;

  Card(this.naipe, this.valor);

  static List<Card> criarCartasPorNaipe(Naipe naipe) {
    List<Card> cartas = [];
    for (var valor in ValorCarta.values) {
      cartas.add(Card(naipe, valor));
    }
    return cartas;
  }

  static checkWinner(ValorCarta valor, Naipe naipeManilha) {
    Map<ValorCarta, int> mapValorCartaTrucado = {
      ValorCarta.quatro: 1,
      ValorCarta.cinco: 2,
      ValorCarta.seis: 3,
      ValorCarta.sete: 4,
      ValorCarta.dama: 5,
      ValorCarta.valete: 6,
      ValorCarta.rei: 7,
      ValorCarta.ass: 8,
      ValorCarta.dois: 9,
      ValorCarta.tres: 10,
    };

    int manilhaMultiplier = 0;
    if (naipeManilha == Naipe.ouros) {
      manilhaMultiplier = 10;
    } else if (naipeManilha == Naipe.espadas) {
      manilhaMultiplier = 20;
    } else if (naipeManilha == Naipe.copas) {
      manilhaMultiplier = 30;
    } else if (naipeManilha == Naipe.paus) {
      manilhaMultiplier = 40;
    }

    int manilhaValue = mapValorCartaTrucado[ValorCarta.dama]!;
    manilhaValue += manilhaMultiplier;
    mapValorCartaTrucado[ValorCarta.dama] = manilhaValue;

    // Print para verificar os valores atualizados
    mapValorCartaTrucado.forEach((key, value) {
      print('$key: $value');
    });
  }
}

