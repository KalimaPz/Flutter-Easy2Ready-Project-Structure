import 'package:flutter_project_boiler_plate/models/credit_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CreditCardsSecureStorage {
  static getAllOwnedCreditCard() async {
    final storage = FlutterSecureStorage();

    String cardsString = await storage.read(key: 'credit_card');
    if (cardsString != null) {
      List<CreditCard> creditCardList = CreditCard.decode(cardsString);
      return creditCardList;
    } else {
      print("Storage Not Contain Any Card");
      return [];
    }
  }

  static clearAllOwnedCard() async {
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
    return true;
  }

  static insertNewCard(CreditCard card) async {
    final storage = FlutterSecureStorage();

    final ownedCard = await getAllOwnedCreditCard();

    if (ownedCard.isEmpty) {
      // Does not contain any Card.
      final String tempData = CreditCard.encode([card]);
      await storage.write(key: 'credit_card', value: tempData);
      await setDetaultForCurrentCard(card);

      print("card insert status : true");

      return true;
    } else {
      // Contain at least 1 Card.
      bool isDupe = ownedCard.any((item) {
        if (item.cardNumber == card.cardNumber &&
            item.expMonth == card.expMonth &&
            item.expYrs == card.expYrs &&
            item.secCode == card.secCode) {
          return true;
        } else {
          return false;
        }
      });
      // find dupe
      print("is Dupe : $isDupe");
      if (!isDupe) {
        ownedCard.add(card);
        final tempData =
            CreditCard.encode(ownedCard); // convert List<Object> to String
        await storage.write(key: 'credit_card', value: tempData);
        await setDetaultForCurrentCard(card);
        print("card insert status [not dupe] : true");
        return true;
      } else {
        print("card insert status : false");
        return false;
      }
    }
  }

  static deleteCurrentCard(CreditCard card) async {
    final storage = FlutterSecureStorage();

    final List<CreditCard> ownedCard = await getAllOwnedCreditCard();

    if (ownedCard.isNotEmpty) {
      int selectedItem = ownedCard.indexWhere((item) {
        if (item.cardNumber == card.cardNumber) {
          return true;
        } else {
          return false;
        }
      });
      ownedCard.removeAt(selectedItem);
      final tempData = CreditCard.encode(ownedCard);
      await storage.write(key: 'credit_card', value: tempData);
      await setDetaultForCurrentCard(ownedCard.last);
      print("selected card has been delete");
      return true;
    } else {
      print("delete failed");
      return false;
    }
  }

  static setDetaultForCurrentCard(CreditCard card) async {
    final storage = FlutterSecureStorage();
    final List<CreditCard> ownedCard = await getAllOwnedCreditCard();

    if (ownedCard.isNotEmpty) {
      int selectedItem = ownedCard.indexWhere((item) {
        if (item.cardNumber == card.cardNumber) {
          return true;
        } else {
          return false;
        }
      });
      ownedCard.forEach((element) {
        element.isDefault = false;
      });
      ownedCard[selectedItem] = CreditCard(
        cardNumber: card.cardNumber,
        ownerName: card.ownerName,
        expMonth: card.expMonth,
        expYrs: card.expYrs,
        secCode: card.secCode,
        isDefault: true,
      );

      final tempData = CreditCard.encode(ownedCard);
      await storage.write(key: 'credit_card', value: tempData);

      print("selected card has been set to default");
      return true;
    } else {
      print("set default failed");
      return false;
    }
  }

  static getDefaultCard() async {
    final List<CreditCard> ownedCard = await getAllOwnedCreditCard();
    int defaultCardIndex =
        ownedCard.indexWhere((item) => item.isDefault == true);
    print("default card index is : $defaultCardIndex");
    return ownedCard[defaultCardIndex];
  }
}
