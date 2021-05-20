import 'package:flutter/material.dart';
import 'package:my_app/auth/widget.dart';
import 'package:my_app/database.dart';

class AddQuestion extends StatefulWidget {


  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

 final _formKey = GlobalKey<FormState>();
 String question, option1, opton2;
 bool _isLoading = false;

 DatabaseService databaseService = new DatabaseService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Container(
       child: Center(child: CircularProgressIndicator(),),
      ): Container(
        padding: EdgeInsets.symmetric(horizontal:24),
        child: Column(children:[
            SizedBox(height: 70,),
            TextFormField(
                validator: (val) => val.isEmpty ? "Enter" : null,
                decoration: InputDecoration(
                hintText:  "Question",
              ),
              onChanged: (val){
                 question = val;
              },
            ),
            SizedBox(height:6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter" : null,
                decoration: InputDecoration(
                hintText:  "opt1",
              ),
              onChanged: (val){
                 option1 = val;
              },
            ),
            SizedBox(height:6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter" : null,
                decoration: InputDecoration(
                hintText:  "opt2",
              ),
              onChanged: (val){
                 opton2 = val;
              },
            ),
             Spacer(),
             Row(
               children: [
                 GestureDetector(
                   onTap: (){
                     Navigator.pop(context);
                   },
                   child: purpleButton(context, "Submit")),
                 ]),
            SizedBox(height:24,),
            Row(
                children: [
                 GestureDetector(
                   onTap: (){
                     //todo
                   },
                   child: purpleButton(context, "Add question")),
          ]),
          SizedBox(height: 70,),
      ] )
      )
    );
  }
}

