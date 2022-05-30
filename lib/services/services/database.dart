import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addSurveyData(Map<String, dynamic> surveyData,
      String surveyId) async {
    await FirebaseFirestore.instance
        .collection("Survey")
        .doc(surveyId)
        .set(surveyData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map <String, dynamic> surveyData,
      String surveyId) async {
    await FirebaseFirestore.instance.collection("Survey")
        .doc(surveyId).collection("QNA")
        .add(surveyData)
        .catchError((e) {
      print(e.toString());
    });
  }
}
