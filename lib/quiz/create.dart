import 'package:flutter/material.dart';
import 'package:my_app/auth/widget.dart';
import 'package:my_app/database.dart';
import 'package:my_app/quiz/add_question.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  
  final _formKey = GlobalKey<FormState>();
  String option, title, desc, quizId;
  DatabaseService databaseService = new DatabaseService();

   bool _isLoading = false;

  createQuizOnline() async{
    if(_formKey.currentState.validate()){

      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16);

      Map<String, String> quizMap = {
       "quizId": quizId,
       "quizImgUrl": option,
       "quizTitle": title,
       "quizDesc": desc,

      };
     await databaseService.addQuizData(quizMap, quizId).then((value){
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => AddQuestion()));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Container(
       child: Center(child: CircularProgressIndicator(),),
      ):
      Form(
        key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:24) ,
            child: Column(children: [
            SizedBox(height: 70,),
            TextFormField(
                validator: (val) => val.isEmpty ? "Enter" : null,
                decoration: InputDecoration(
                hintText:  "Option",
              ),
              onChanged: (val){
                 option = val;
              },
            ),
            SizedBox(height:6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter" : null,
                decoration: InputDecoration(
                hintText:  "title",
              ),
              onChanged: (val){
                 title = val;
              },
            ),
            SizedBox(height:6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter" : null,
                decoration: InputDecoration(
                hintText:  "desc",
              ),
              onChanged: (val){
                 desc = val;
              },
            ),
            Spacer(),
            GestureDetector(
              onTap:(){
               createQuizOnline();
              },
              child: purpleButton(context, "Create",)),
            SizedBox(height: 70,),
          ],) ,
        ),
      )
    );
  }
}








