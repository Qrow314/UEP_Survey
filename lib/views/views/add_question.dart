import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uep_survey/services/database.dart';
import 'package:uep_survey/widget/widget.dart';
import 'package:uep_survey/views/add_question.dart';

class AddQuestion extends StatefulWidget {
  final String surveyId;
  AddQuestion(this.surveyId);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2,option3, option4;
  late bool _isloading;

  DatabaseService databaseService = new DatabaseService();

  uploadQuizData() async{

    if(_formKey.currentState.validate()){

      setState(() {
        _isloading = true;
      });

      Map<String,String> questionMap={
        "question" : question,
        "option1" : option1,
        "option2" : option2,
        "option3" : option3,
        "option4" : option4
      };
      await databaseService.addSurveyData(questionMap, widget.surveyId)
      .then((value){
        setState(() {
          _isloading = false;
        });

      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87), // IconThemeData
        brightness: Brightness.light,
      ),
      body: _isloading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column( children: [
          TextFormField(
          validator: (val) =>
          val!.isEmpty ? "Enter Question" : null,
          decoration:
          const InputDecoration(hintText: "Question"),
          onChanged: (val) {
            question = val;
          },
        ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            validator: (val) =>
            val!.isEmpty ? "Enter Option1" : null,
            decoration:
            const InputDecoration(hintText: "Option1 (Correct Answer)"),
            onChanged: (val) {
              option1 = val;
            },
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            validator: (val) =>
            val!.isEmpty ? "Enter Option2" : null,
            decoration:
            const InputDecoration(hintText: "Option2"),
            onChanged: (val) {
              option2 = val;
            },
          ),   SizedBox(
            height: 6,
          ),
          TextFormField(
            validator: (val) =>
            val!.isEmpty ? "Enter Option3" : null,
            decoration:
            const InputDecoration(hintText: "Option3"),
            onChanged: (val) {
              option3 = val;
            },
          ),   SizedBox(
            height: 6,
          ),
          TextFormField(
            validator: (val) =>
            val!.isEmpty ? "Enter Option4" : null,
            decoration:
            const InputDecoration(hintText: "Option4"),
            onChanged: (val) {
              option4 = val;
            },
          ),
          Spacer(),
          Center(
            child: Row(
              children: [
                ElevatedButton(
                    //style: RaisedButtonStyle,
                    onPressed:(){},
                    child: Text("Submit"),
                ),
                SizedBox(width: 100,height: 100,),
                ElevatedButton(
                  //style: RaisedButtonStyle,
                  onPressed:(){
                    //TO do
                  },
                  child: Text("Add Question"),
                )
              ],
            ),
          )
        ],),
      ),
    );

  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('option3', option3));
  }

}
