import 'package:flutter/material.dart';
import '/model/courses_model.dart';
import '/data/courses_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CourseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Cours'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: courses.map((course) {
              return CourseCard(course: course);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Color.fromARGB(249, 240, 241, 246), // Change the background color here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset('assets/cours.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  course.title ?? "",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  course.subtitle ?? "",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Center(
            child: TextButton(
              child: const Text('ACHETER LE COURS'),
              onPressed: () {
            // Show the pop-up dialog
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Hey!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
                    InkWell(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset('assets/build.png'),
            ),
            onTap: () {
              // Handle the image tap action here
            },
          ),
          Center(
            child: Text(
            'Nous travaillons actuellement sur cette fonctionnalité.',
          ),
          ),

          Center(
              child: Text('Soyez patient, vous pourrez nous donner vos sous très bientôt.😉'),
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
          ),
          Center(
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
        ],
      ),
    );
  }
}

