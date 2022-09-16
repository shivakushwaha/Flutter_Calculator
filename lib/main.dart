import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int firstnum = 0;
  int secondnum = 0;
  String text_to_display = "";
  String res = "";
  String perform_oprt = "";

  void buttonclicked(String bval) {
    if (bval == "C") {
      firstnum = 0;
      secondnum = 0;
      text_to_display = "";
      res = "0";
      perform_oprt = "";
    } else if (bval == "+" || bval == "-" || bval == "x" || bval == "/") {
      firstnum = int.parse(text_to_display);
      res = "";
      perform_oprt = bval;
    } else if (bval == "=") {
      if (firstnum != 0) {
        secondnum = int.parse(text_to_display);
        if (perform_oprt == "+") {
          res = (firstnum + secondnum).toString();
        } else if (perform_oprt == "-") {
          res = (firstnum - secondnum).toString();
        } else if (perform_oprt == "x") {
          res = (firstnum * secondnum).toString();
        } else if (perform_oprt == "/") {
          res = (firstnum / secondnum).toString();
        }
      } else {
        res = "";
      }
    } else {
      res = int.parse(text_to_display + bval).toString();
    }
    setState(() {
      text_to_display = res;
    });
  }

  Widget costumbutton(String bval) {
    return Expanded(
      child: OutlinedButton(
        style: TextButton.styleFrom(
          // backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
        ),
        onPressed: () => buttonclicked(bval),
        child: Text(
          "$bval",
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calculator",
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$text_to_display",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
              Row(
                children: [
                  costumbutton("9"),
                  costumbutton("8"),
                  costumbutton("7"),
                  costumbutton("+"),
                ],
              ),
              Row(
                children: [
                  costumbutton("6"),
                  costumbutton("5"),
                  costumbutton("4"),
                  costumbutton("-"),
                ],
              ),
              Row(
                children: [
                  costumbutton("3"),
                  costumbutton("2"),
                  costumbutton("1"),
                  costumbutton("x"),
                ],
              ),
              Row(
                children: [
                  costumbutton("C"),
                  costumbutton("0"),
                  costumbutton("="),
                  costumbutton("/"),
                ],
              ),
            ],
          ),
        ));
  }
}
