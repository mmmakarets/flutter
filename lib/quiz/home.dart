import 'package:flutter/material.dart';
import 'package:my_app/database.dart';
import 'package:my_app/quiz/create.dart';
import 'package:my_app/quiz/play_quiz.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot){
          return snapshot.data == null
               ? Container():
               ListView.builder(
                 itemCount: snapshot.data.docs.length,
                 itemBuilder: (context, index){
                         return QuizTile(
                           imgUrl: snapshot.data.docs[index].data()["quizImgUrl"],
                           title: snapshot.data.docs[index].data()["quizTitle"],
                           quizId: snapshot.data.docs[index].data()["quizId"],
                         );
               });
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizesData().then((val){
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: quizList(),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz() 
            ));
          },
        ),
     );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String quizId;

  QuizTile({@required this.imgUrl, 
            @required this.title,
            @required this.quizId,});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: (){
         //Navigator.push(context, MaterialPageRoute(
           //builder: (context) => PlayQuiz(
           //  quizId
         //  )
          // )
         //  );
       },  
       child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imgUrl, width: MediaQuery.of(context).size.width - 48, fit: BoxFit.cover, )),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(backgroundColor: Colors.white70, fontSize: 26) ),                
                ],),
            )
          ],
        )
      ),
    );
  }
}