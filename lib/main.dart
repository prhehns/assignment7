import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;
  int subResult = 0;
  int mulResult = 0;
  int divResult = 0;

// TextEditingControllers for addition
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  // TextEditingControllers for subtraction
  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();

  // TextEditingControllers for multiplication
  TextEditingController mul1Controller = TextEditingController();
  TextEditingController mul2Controller = TextEditingController();

  // TextEditingControllers for division
  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();
  // or store each value in the state
  int firstNum = 0;
  int secondNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
// Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller, // Associate with TextEditingController to clear it later
                  decoration: const InputDecoration(labelText: "First Number"),
                  // Update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.parse(value);
                    });
                  },
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller, // Second TextEditingController for clearing
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.parse(value); // Ensure secAddNum is a class-level variable
                    });
                  },
                ),
              ),

              Text(' = $sum'),

              // 3.a Add an IconButton here
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: () {
                  // Calculate the sum when the IconButton is pressed
                  setState(() {
                    sum = (firstNum + secondNum);
                  });
                },
              ),

              // b.b Add a Clear button here
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Clear the inputs using TextEditingController and reset the sum
                    add1Controller.clear(); // Clear first input
                    add2Controller.clear(); // Clear second input
                    sum = 0; // Reset sum value
                  });
                },
                child: const Text('Clear'),
              ),
            ],
          ),

          // 3.c - Add the other operations
          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: sub1Controller, // Controller for first subtraction input
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.parse(value); // Store first number for subtraction
                    });
                  },
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: sub2Controller, // Controller for second subtraction input
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.parse(value); // Store second number for subtraction
                    });
                  },
                ),
              ),
              Text(' = $subResult'),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  setState(() {
                    subResult = firstNum - secondNum;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    sub1Controller.clear();
                    sub2Controller.clear();
                    subResult = 0;
                    firstNum = 0;
                    secondNum = 0;
                  });
                },
                child: const Text('Clear'),
              ),
            ],
          ),

          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mul1Controller, // Controller for first multiplication input
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.parse(value); // Store first number for multiplication
                    });
                  },
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: mul2Controller, // Controller for second multiplication input
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.parse(value); // Store second number for multiplication
                    });
                  },
                ),
              ),
              Text(' = $mulResult'),
              IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    mulResult = firstNum * secondNum;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mul1Controller.clear();
                    mul2Controller.clear();
                    mulResult = 0;
                    firstNum = 0;
                    secondNum = 0;
                  });
                },
                child: const Text('Clear'),
              ),
            ],
          ),

          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: div1Controller, // Controller for first division input
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstNum = int.parse(value); // Store first number for division
                    });
                  },
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: div2Controller, // Controller for second division input
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondNum = int.parse(value); // Store second number for division
                    });
                  },
                ),
              ),
              Text(' = $divResult'),
              IconButton(
                icon: const Icon(Icons.do_disturb_on),
                onPressed: () {
                  setState(() {
                    divResult = secondNum != 0 ? firstNum ~/ secondNum : 0; // Prevent division by zero
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    div1Controller.clear();
                    div2Controller.clear();
                    divResult = 0;
                    firstNum = 0;
                    secondNum = 0;
                  });
                },
                child: const Text('Clear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}