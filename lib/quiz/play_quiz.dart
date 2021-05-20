import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/database.dart';
import 'package:my_app/quiz/home.dart';
import 'package:my_app/quiz/question_model.dart';
import 'package:my_app/quiz/quiz_play_widget.dart';

class PlayQuiz extends StatefulWidget {
  
  final String quizId;
  PlayQuiz(this.quizId);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;


class _PlayQuizState extends State<PlayQuiz> {
  
  DatabaseService databaseService;
  QuerySnapshot questionSnapshot;

  QuestionModel getQuestionModelFromDatasnapshot(
    DocumentSnapshot questionSnapshot){
   
   QuestionModel questionModel = new QuestionModel();

   questionModel.question = questionSnapshot.data["question"];

   List<String> options = 
   [
     questionSnapshot.data()["option1"],
     questionSnapshot.data()["option2"],
     questionSnapshot.data()["option3"],
     questionSnapshot.data()["option4"],
   ];
   options.shuffle();

   QuestionModel.option1 = option[0];


  }

  @override
  void initState() {
    print("${widget.quizId}");
    databaseService.getQuizData(widget.quizId).then((value){
       questionSnapshot = value;
       _notAttempted = 0;
       _correct = 0;
       _incorrect = 0;
       total = questionSnapshot.docs.length;

       print("$total this is total");
       setState(() {
         
       });
    });
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
         questionSnapshot.docs != null ?
           Container():
           ListView.builder(
             itemCount: questionSnapshot.docs.length,
             itemBuilder: (context, index){
                return QuizTile(

              )
             },
           )
        ],),
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {

  final QuestionModel   questionModel;
  QuizPlayTile({this.questionModel});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {

  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(widget.questionModel.question),
        SizedBox(height: 4,),
        OptionTile(
           correctAnswer: widget.questionModel.option1,  
           descr: widget.questionModel.option1,
           option: "A",
           optionSelected: optionSelected,
        ),SizedBox(height: 4,),
        OptionTile(
           correctAnswer: widget.questionModel.option1,  
           descr: widget.questionModel.option2,
           option: "B",
           optionSelected: optionSelected,
        ),SizedBox(height: 4,),
        OptionTile(
           correctAnswer: widget.questionModel.option1,  
           descr: widget.questionModel.option3,
           option: "C",
           optionSelected: optionSelected,
        ),
        SizedBox(height: 4,),
        OptionTile(
           correctAnswer: widget.questionModel.option1,  
           descr: widget.questionModel.option4,
           option: "D",
           optionSelected: optionSelected,
        ),
      ],)
      
    );
  }
}