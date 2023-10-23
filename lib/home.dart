import 'package:flutter/material.dart';
import 'menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/logoDjangAk.png'),
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'Une nouvelle façon d\'apprendre wolof :D',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF496E2D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(labelText: "Votre nom d'utilisateur"),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Menu(_textController.text),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF496E2D),
                  ),
                  child: Text(
                    'Commencer maintenant!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
Positioned(
  bottom: 16,
  right: 16,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Buy us a coffee'),
      const SizedBox(height: 8), // Add some spacing between the text and icon
      IconButton(
        icon: Icon(Icons.coffee), // You can replace 'Icons.coffee' with your desired icon
        onPressed: () {
          showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('We deserve it! :)'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset('assets/orangeMoney.png'),
            ),
          ),
                              SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
            '77 616 32 53',style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),
          ),
          ),

                    SizedBox(
            height: 50,
          ),
                    InkWell(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset('assets/freeMoney.png'),
            ),
          ),
                                        SizedBox(
            height: 10,
          ),
          Center(
              child: Text('76 571 89 65', style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),),
          ),

                    SizedBox(
            height: 50,
          ),

                              InkWell(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset('assets/wave.png'),
            ),
          ),
                                        SizedBox(
            height: 10,
          ),
          Center(
              child: Text('76 571 89 65',style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),),
          ),
          
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Ok!'),
        ),
      ],
    );
  },
);
        },
      ),
    ],
  ),
),



        ],
      ),
    );
  }
}
