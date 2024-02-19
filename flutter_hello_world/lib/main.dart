import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A username idea:'),
        
            ElevatedButton(onPressed: () {
              appState.getNext();
            }, 
            child: const Text('Want a new word pair? Click this reasonably sized button!', textAlign: TextAlign.center,),
            ),
            SizedBox(height: 60),
        
            CurrentName(name: appState.current)
          ],
        ),
      ),
      backgroundColor: theme.canvasColor,
    );
  }
}

class CurrentName extends StatelessWidget {
  const CurrentName({
    super.key,
    required this.name,
  });

  final WordPair name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(name.asPascalCase, style: style),
      ),
    );
  }
}