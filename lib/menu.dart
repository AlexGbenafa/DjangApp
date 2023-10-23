import 'package:flutter/material.dart';
import 'home.dart';
import 'quizz.dart';
import 'courses.dart';


class Menu extends StatefulWidget {
  final String nomUtilisateur;

  Menu(this.nomUtilisateur,{Key? key,}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _handleImageClick(String imageName) {
    print('Image cliquée : $imageName');
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Color(0xFF1C274C), // Couleur de fond de la barre d'applications
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.logout, color: Colors.white), // Icône de déconnexion en blanc
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${widget.nomUtilisateur}",
          style: TextStyle(
            fontSize: 16, // Taille de la police
            color: Colors.white, // Couleur du texte (blanc ici)
            fontWeight: FontWeight.bold, // Police en gras
            fontFamily: 'Arial', // Police de caractères (personnalisez selon vos préférences)
          ),
        ),
      ),
    ],
  ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                _handleImageClick('Image 1');
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Quizz(widget.nomUtilisateur)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Image.asset('assets/quizz.png'),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                _handleImageClick('Image 2');
                //Lien vers Course()
                Navigator.push(context, MaterialPageRoute(builder: (context) => CourseListPage()));
                
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Image.asset('assets/cours.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
