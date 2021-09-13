import 'package:flutter/material.dart';
import 'package:flutter_project_boiler_plate/store/counter_provider.dart';

import 'package:provider/provider.dart';
import 'pages/Home.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    );
  }
}
