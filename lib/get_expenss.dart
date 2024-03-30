import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _response = '';

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.133:8080/expenses'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _response = data.toString();
        });
      } else {
        setState(() {
          _response = 'Error: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        _response = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 20),
            Text('Response: $_response'),
          ],
        ),
      ),
    );
  }
}
