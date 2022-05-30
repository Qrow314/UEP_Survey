import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:uep_survey/services/database.dart';
import 'package:uep_survey/views/add_question.dart';
import 'package:uep_survey/widget/widget.dart';

class CreateSurvey extends StatefulWidget {
  const CreateSurvey({Key? key}) : super(key: key);

  @override
  State<CreateSurvey> createState() => _CreateSurveyState();
}

class _CreateSurveyState extends State<CreateSurvey> {
  final _formKey = GlobalKey<FormState>();
  late String surveyImageUrl, surveyTitle, surveyDescription, surveyId;
  DatabaseService databaseService = new DatabaseService();

  bool _isLoading = false;

  createSurveyOnline() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      surveyId = randomAlphaNumeric(16);

      Map<String, String> surveyMap = {
        "surveyId": surveyId,
        "surveyImageUrl": surveyImageUrl,
        "surveyTitle": surveyTitle,
        "surveyDescription": surveyDescription,
      };

      await databaseService.addSurveyData(surveyMap, surveyId).then((value) {
        _isLoading = false;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddQuestion()));
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
      body: _isLoading
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Must not be empty" : null,
                      decoration:
                          const InputDecoration(hintText: "Hint numba 1"),
                      onChanged: (val) {
                        surveyImageUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Must not be empty" : null,
                      decoration:
                          const InputDecoration(hintText: "Hint numba 2"),
                      onChanged: (val) {
                        surveyTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (String? val) =>
                          val!.isEmpty ? "Must not be empty" : null,
                      decoration:
                          const InputDecoration(hintText: "Hint numba 3"),
                      onChanged: (val) {
                        surveyDescription = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createSurveyOnline();
                        },
                        child: AppLogo().blueButton(context, "Create Survey")),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
