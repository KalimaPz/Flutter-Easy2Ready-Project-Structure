import 'package:flutter/material.dart';
import 'package:flutter_project_boiler_plate/actions/ActionSecondPage.dart';
import 'package:flutter_project_boiler_plate/models/credit_card.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController cardOwner = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController yy = TextEditingController();
  TextEditingController mm = TextEditingController();
  TextEditingController cvv = TextEditingController();
  List cards = [];
  initialAction() async {
    final res = await CreditCardsSecureStorage.getAllOwnedCreditCard();
    print("res : $res");
    setState(() {
      cards = res;
    });
  }

  @override
  void initState() {
    super.initState();
    initialAction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: cardOwner,
            decoration: InputDecoration(hintText: "Card Owner"),
          ),
          TextField(
            controller: number,
            decoration: InputDecoration(hintText: "Number"),
          ),
          TextField(
            controller: mm,
            decoration: InputDecoration(hintText: "EXP MM"),
          ),
          TextField(
            controller: yy,
            decoration: InputDecoration(hintText: "EXP YY"),
          ),
          TextField(
            controller: cvv,
            decoration: InputDecoration(hintText: "CVV"),
          ),
          TextButton(
            onPressed: () async {
              await CreditCardsSecureStorage.insertNewCard(CreditCard(
                cardNumber: "557755712925815",
                expMonth: "10",
                expYrs: "23",
                ownerName: "Donnukrit",
                secCode: "711",
              ));
              initialAction();
            },
            child: Text("Add New Card"),
          ),
          TextButton(
            onPressed: () async {
              await CreditCardsSecureStorage.clearAllOwnedCard();
              initialAction();
            },
            child: Text("Clear"),
          ),
          TextButton(
            onPressed: () async {
              await CreditCardsSecureStorage.getDefaultCard();
              initialAction();
            },
            child: Text("Get Default index"),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text("${cards[index].cardNumber}"),
                    Text("${cards[index].ownerName}"),
                    Text("${cards[index].expMonth}"),
                    Text("${cards[index].expYrs}"),
                    Text("${cards[index].secCode}"),
                    Text("${cards[index].isDefault}"),
                    TextButton(
                        onPressed: () async {
                          await CreditCardsSecureStorage.deleteCurrentCard(
                              cards[index]);
                          initialAction();
                        },
                        child: Text("DEL")),
                    TextButton(
                        onPressed: () async {
                          await CreditCardsSecureStorage
                              .setDetaultForCurrentCard(cards[index]);

                          initialAction();
                        },
                        child: Text("Set"))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
