import 'dart:io';

// Define the main function
void main() {
  // Create a new deck of cards
  var deck = new Deck();

  print("Choose a number between 1 and 4");
  print("1. Print the deck of cards");
  print("2. Shuffle the deck of cards");
  print("3. Get all cards with suit 'Diamonds'");
  print("4. Deal 3 cards from the deck");
  print("5. Exit");

  // Get the user's choice of action using switch case
  var choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      print(deck);
      break;
    case 2:
      deck.Shuffle();
      print(deck);
      break;
    case 3:
      print(deck.cardsWithSuit('Diamonds'));
      break;
    case 4:
      deck.Shuffle();
      print(deck.Deal(3));
      break;
    case 5:
      break;
    default:
      print("Invalid choice");
  }
}

// Define the Deck class
class Deck {
  // Define a list of Card objects
  List<Card> cards = [];

  // Define the constructor for the Deck class
  Deck() {
    // Define the possible ranks and suits for the cards
    var ranks = [
      'Ace',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Jack',
      'Queen',
      'King'
    ];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];

    // Create a new Card object for each possible combination of rank and suit
    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(rank, suit);
        cards.add(card);
      }
    }
  }

  // Define a method to return a string representation of the deck of cards
  toString() {
    return cards.toString();
  }

  // Define a method to shuffle the deck of cards
  Shuffle() {
    cards.shuffle();
  }

  // Define a method to get all cards with a certain suit
  cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  // Define a method to deal a certain number of cards from the deck
  Deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);
    return hand;
  }

  // Define a method to remove a specific card from the deck
  removeCard(String suit, String rank) {
    cards.removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

// Define the Card class
class Card {
  // Define properties for the suit and rank of the card
  String suit = '';
  String rank = '';

  // Define the constructor for the Card class
  Card(this.rank, this.suit);

  // Define a method to return a string representation of the card
  toString() {
    return '$rank of $suit';
  }
}
