import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_injectable_example/app/models/random_factory_model.dart';
import 'package:get_it_injectable_example/app/models/random_singleton_model.dart';
import 'app/core/service_locator.dart';
import 'app/models/random_lazy_singleton_model.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int id = 0;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$id'),
            Text(name),
            Divider(),
            TextButton(
              onPressed: () {
                final instance = GetIt.I.get<RandomFactoryModel>();
                setState(() {
                  id = instance.id;
                  name = instance.name;
                });
              },
              child: Text('Factory'),
            ),
            TextButton(
              onPressed: () {
                final instance = GetIt.I.get<RandomSingletonModel>();
                setState(() {
                  id = instance.id;
                  name = instance.name;
                });
              },
              child: Text('Singleton'),
            ),
            TextButton(
              onPressed: () {
                final instance = GetIt.I.get<RandomLazySingletonModel>();
                setState(() {
                  id = instance.id;
                  name = instance.name;
                });
              },
              child: Text('Lazy Singleton'),
            )
          ],
        ),
      ),
    );
  }
}
