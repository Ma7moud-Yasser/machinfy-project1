import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Home Screen',
          style: TextStyle(
            height: 1.5,
            color: Colors.lightGreenAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Welcome to the Home Screen!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          ElevatedButton(onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
          }, child: Text(
              'Navigate',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),)
        ],
      ),
    );
  }
}
