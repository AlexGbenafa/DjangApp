import 'package:flutter/material.dart';
import 'quizz.dart';
import 'menu.dart';
import '/data/question_list.dart';
import 'package:flutter_animate/flutter_animate.dart';


class Score extends StatefulWidget {
  final int score;
  final String nomUtilisateur;

  Score(this.nomUtilisateur,this.score, {Key? key}) : super(key: key);

  @override
  _Score createState() => _Score();
}

class _Score extends State<Score> {

  int scoreTotale = 10 * questions.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 53, 110),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Container(
                
                child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset('assets/score.png'),
              )
              )
            ),

            
            Text(
            "Votre score : ",
            style: TextStyle(
              fontSize: 24, // Taille de la police
              fontWeight: FontWeight.bold, // Poids de la police
              color: Colors.white, // Couleur du texte
            )
            ),

            SizedBox(
              height: 20.0,
            ),
            
            Text(
            "${widget.score}/$scoreTotale",
            style: TextStyle(
              fontSize: 80, // Taille de la police
              fontWeight: FontWeight.bold, // Poids de la police
              color: Colors.orange, // Couleur du texte
            )
            ).animate()
  .fade(duration: 500.ms)
  .scale(delay: 500.ms),
            
            SizedBox(
              height: 20.0,
            ),
            
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Quizz(widget.nomUtilisateur)));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0), // Ajustez ces valeurs selon vos préférences
            ),
            child: Text("Reprendre le quizz", style: TextStyle(fontSize: 20)),
          ),

          SizedBox(
            height: 20,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(widget.nomUtilisateur)));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0), // Ajustez ces valeurs selon vos préférences
            ),
            child: Text("Retour au menu", style: TextStyle(fontSize: 20)),
          )
// Ajoutez cet espace entre l'image et le bouton
          ],
        ),
      ),
    );
  }
}
