import 'package:flutter/material.dart';
import '/data/question_list.dart';
import 'score.dart';
//import '/model/questions_model.dart';

class Quizz extends StatefulWidget{

  final String nomUtilisateur;

  Quizz(this.nomUtilisateur,{Key? key}) : super(key: key);

  

  @override
  _Quizz createState() => _Quizz();
}

class _Quizz extends State<Quizz> {
  //Creer un controller pour la pageview
  PageController? _controller = PageController(initialPage:0 );
  bool is_pressed = false;
  Color btnColor = Color(0xFF117eeb);
  Color trueAnswer = Colors.green;
  Color wrongAnswer = Colors.red;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 53, 110),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page){
            setState((){
              is_pressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Question ${index+1}/${questions.length}",style: TextStyle(fontSize: 35,color: Colors.white)),
                
                const Divider(
                color: Colors.white,
                height: 8.0,
                thickness: 1.0,
                ),

                const SizedBox(
                    width: double.infinity,
                    height: 20.0,
                ),

                Text(
                  questions[index].question!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                ),

                const SizedBox(
                    height: 25.0,
                ),

                for(int i=0; i<questions[index].answers!.length;i++)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 18.0),
                  child:
                    MaterialButton(
                      shape: StadiumBorder(),
                      color: is_pressed ?questions[index].answers!.entries.toList()[i].value?trueAnswer :wrongAnswer :btnColor,
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: is_pressed
                      ? (){}
                      :(){
                        setState(() {
                          is_pressed = true;
                        });
                      if(questions[index]
                          .answers!
                          .entries
                          .toList()[i]
                          .value){
                            score += 10;
                            print(score);
                          }
                      },
          
                      child: Text(questions[index].answers!.keys.toList()[i], style: TextStyle(color: Colors.white),),
                    )
                ),

                const SizedBox(
                    height: 50.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [     
                  OutlinedButton(
                    onPressed: is_pressed
                    ? index +1 == questions.length?(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Score(widget.nomUtilisateur,score)));
                    }:() { 
                      _controller!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                      setState(() {
                        is_pressed = false;
                      });
                    } : null,
                    child: Text(
                      index +1 == questions.length? "VOIR LES RESULTATS" : "QUESTION SUIVANTE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ],

                )

                
              ],




            );
          },
        ) 
        ),
    );
}
}
