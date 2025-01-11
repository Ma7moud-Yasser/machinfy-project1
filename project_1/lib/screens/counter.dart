import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202124),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.blueAccent,
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    data++;
                  });
                },
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  "$data",
                  style: GoogleFonts.abel(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.redAccent,
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    data--;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
