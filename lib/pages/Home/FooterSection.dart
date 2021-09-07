import 'package:flutter/material.dart';
import 'package:flutter_project_boiler_plate/store/counter_provider.dart';
import 'package:provider/provider.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                return Column(
                  children: [
                    Text("Footer Section"),
                    Text("Count"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${counterProvider.count}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => counterProvider.increment(),
                            child: Text("Increment")),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () => counterProvider.decrement(),
                            child: Text("Decrement"))
                      ],
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
