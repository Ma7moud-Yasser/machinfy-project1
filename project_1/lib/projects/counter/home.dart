import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/screens/bm_home_screen.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key,
   });
  static final route = '/home_screen';

  @override
  Widget build(BuildContext context) {
  User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.arrow_back) ,
        onPressed: (){
          Navigator.pop(context);
        },),
        title: Text(
          user.age.toString(),
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
          // Text(wieght.toString()),
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
