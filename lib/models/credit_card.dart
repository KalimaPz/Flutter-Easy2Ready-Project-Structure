import 'dart:convert';

class CreditCard {
  final String ownerName;
  final String cardNumber;
  final String expMonth;
  final String expYrs;
  final String secCode;
  bool isDefault;
  CreditCard({
    this.ownerName,
    this.cardNumber,
    this.expMonth,
    this.expYrs,
    this.secCode,
    this.isDefault = false,
  });
  @override
  String toString() {
    return "OwnerName : ${this.ownerName} | Card Number : ${this.cardNumber} | ${this.expMonth}/${this.expYrs} | Sec : ${this.secCode} | isDefault : ${this.isDefault}";
  }

  factory CreditCard.fromJson(Map<String, dynamic> jsonData) {
    return CreditCard(
        ownerName: jsonData["ownerName"],
        cardNumber: jsonData["cardNumber"],
        expMonth: jsonData["expMonth"],
        expYrs: jsonData["expYrs"],
        secCode: jsonData["secCode"],
        isDefault: jsonData["isDefault"]);
  }

  static Map<String, dynamic> toMap(CreditCard card) => {
        'ownerName': card.ownerName,
        'cardNumber': card.cardNumber,
        'expMonth': card.expMonth,
        'expYrs': card.expYrs,
        'secCode': card.secCode,
        'isDefault': card.isDefault,
      };
  static String encode(List<CreditCard> cards) => json.encode(
        cards
            .map<Map<String, dynamic>>((music) => CreditCard.toMap(music))
            .toList(),
      );

  static List<CreditCard> decode(String cards) =>
      (json.decode(cards) as List<dynamic>)
          .map<CreditCard>((item) => CreditCard.fromJson(item))
          .toList();
}
