import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Films',
      // стилі всього додатка
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Films'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          title: Text(title, style: const TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.sort, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            )
          ]),
      body: const _FilmList(),
    );
  }
}

// віджет  _FilmList - буде видимий тільки в main тому що він ПРИВАТНИЙ!!! Зробили приватним тому що він використовується тільки тут (на даному екрані), в інших місцях додатка він не буде використовуватися....
class _FilmList extends StatelessWidget {
  const _FilmList({Key? key}) : super(key: key);

  static final List<String> films = <String>[
    'The Godfather',
    'The Godfather: Part II',
    'The Dark Knight',
    '12 Angry Men',
    'Pulp Fiction',
    '12 Angry Men'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
            // кількість фільмів
            films.length,
            // ітератор
            (int index) => Padding(
                padding: const EdgeInsets.only(top: 20),
                // child: ColoredBox(
                //     color: Colors.purple,
                //     child: Padding(
                //       padding: const EdgeInsets.all(16),
                //       child: Text(films[index]),
                //     )))));
                child: FilmTitle(title: films[index]))));
  }
}

class FilmTitle extends StatelessWidget {
  const FilmTitle({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // return Row(children: <Widget>[
    //   const FlutterLogo(),
    //   Column(children: <Widget>[
    //     Text(title),
    //     const Row(children: <Widget>[Icon(Icons.star), Text('4.5')])
    //   ])
    // ]);
    return Row(children: <Widget>[
      // const Flexible(child: SizedBox(
      //   width: double.infinity,
      //   child: FlutterLogo(),
      // )),
      const Expanded(child: FlutterLogo()),
      Expanded(
        //! В Expanded є flex який выдповідає за те скільки міся він займе
        // flex дозволяє відносно нашого рядка віджети центрувати по частинам
        //! FLEX МОЖЕ ВИКОИСТОВУВАТИСЯ ТІЛЬКИ В ROWS and COLUMNS
          flex: 3,
          child: Column(children: <Widget>[
            Text(title),
            const Row(children: <Widget>[Icon(Icons.star), Text('4.5')])
          ]))
    ]);
  }
}
