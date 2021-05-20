
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class DatabaseService{

  Future<void> addQuizData(Map quizData, String quizId) async{
    await FirebaseFirestore.instance
    .collection("Quiz")
    .doc(quizId)
    .set(quizData)
    .catchError((e){
     print(e.toString());
    });
  }
  
 getQuizesData() async{
    return await FirebaseFirestore.instance
    .collection("Quiz").snapshots();
 }

 getQuizData(String quizId) async{
   return await FirebaseFirestore.instance
   .collection("Quiz")
   .doc(quizId)
   .collection("QNA")
   .get();
 }
  
}
//33^29
//1^15^51
//41