import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            "Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var _controller = TextEditingController(text: "");
  var _controller2 = TextEditingController(text: "");
  var firstNumber = 0, secondNumber = 0, result = 0;

  void sum() {
    setState(() {
      firstNumber = int.parse(_controller.text);
      secondNumber = int.parse(_controller2.text);
      result = firstNumber + secondNumber;
    });
  }

  void extraction() {
    setState(() {
      firstNumber = int.parse(_controller.text);
      secondNumber = int.parse(_controller2.text);
      result = firstNumber - secondNumber;
    });
  }

  void multiplication() {
    setState(() {
      firstNumber = int.parse(_controller.text);
      secondNumber = int.parse(_controller2.text);
      result = firstNumber * secondNumber;
    });
  }

  void division() {
    setState(() {
      firstNumber = int.parse(_controller.text);
      secondNumber = int.parse(_controller2.text);
      result = firstNumber ~/ secondNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "Output : $result",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "1. Number",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
              onSaved: (gelenSayi1) {
                firstNumber = int.parse(gelenSayi1);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "2. Number",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller2.clear();
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    "+",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      sum();
                    });
                  },
                ),
                SizedBox(
                  width: 40,
                ),
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      extraction();
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    "*",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      multiplication();
                    });
                  },
                ),
                SizedBox(
                  width: 40,
                ),
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    "/",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      division();
                    });
                  },
                ),
              ],
            ),
          ),
          RaisedButton(
            color: Colors.greenAccent,
            child: Text(
              "Clear",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onPressed: () {
              _controller.clear();
              _controller2.clear();
            },
          ),
        ],
      ),
    );
  }
}
