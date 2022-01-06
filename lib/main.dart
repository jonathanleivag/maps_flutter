import 'package:flutter/material.dart'
    show
        BuildContext,
        FloatingActionButton,
        Icon,
        Icons,
        Key,
        MaterialApp,
        Scaffold,
        StatelessWidget,
        Widget,
        runApp;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:maps_flutter/providers/providers.dart' show MarkerProvider;
import 'package:maps_flutter/views/views.dart' show MapsView;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Provider;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarkerProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: const MapsView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          elevation: 0,
          onPressed: () {
            Provider.of<MarkerProvider>(context, listen: false).removeMarkers();
          },
        ),
      ),
    );
  }
}
