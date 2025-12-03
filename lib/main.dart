 import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RandomQuoteApp(),
  ));
}

class RandomQuoteApp extends StatefulWidget {
  @override
  State<RandomQuoteApp> createState() => _RandomQuoteAppState();
}

class _RandomQuoteAppState extends State<RandomQuoteApp> {
  final List<Map<String, String>> quotes = [
    {"quote": "The best way to predict the future is to create it.", "author": "Peter Drucker"},
    {"quote": "Success is not final, failure is not fatal.", "author": "Winston Churchill"},
    {"quote": "Believe you can and you're halfway there.", "author": "Theodore Roosevelt"},
    {"quote": "Dream big and dare to fail.", "author": "Norman Vaughan"},
    {"quote": "Don't stop until you're proud.", "author": "Unknown"},
  ];

  Map<String, String>? currentQuote;

  @override
  void initState() {
    super.initState();
    showRandomQuote();
  }

  void showRandomQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote Generator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuote?["quote"] ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 1.4),
              ),
              SizedBox(height: 15),
              Text(
                "- ${currentQuote?["author"]}",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey[700]),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: showRandomQuote,
                child: Text("New Quote"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
