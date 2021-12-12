import 'package:flutter/material.dart';
import 'package:hello/currency_converter.dart';
import 'package:hello/hello.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo hello package',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TestPackage(),
    );
  }
}

class TestPackage extends StatefulWidget {
  TestPackage({Key? key}) : super(key: key);

  @override
  _TestPackageState createState() => _TestPackageState();
}

class _TestPackageState extends State<TestPackage> {
  double? converter = 0.0;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _from = TextEditingController();
  final TextEditingController _to = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void convert() async {
    final double? _converter = await CurrencyConverter().convert(
        from: _from.text, to: _to.text, amount: double.parse(_controller.text));
    setState(() {
      converter = _converter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text("FROM (IDR)"),
                ),
                controller: _from,
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("TO (USD)"),
                ),
                controller: _to,
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("Amount"),
                ),
                controller: _controller,
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () => convert(),
                child: const Text(
                  "convert",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Result : ${converter!}",
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
