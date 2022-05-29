import 'package:flutter/material.dart';
import 'package:uep_survey/widget/widget.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  late String textFormField1, textFormField2, textFormField3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87), // IconThemeData
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            TextFormField(
              validator: (val) => val!.isEmpty ? "Must not be empty" : null,
              decoration: const InputDecoration(
                  hintText: "Hint numba 1"
              ),
              onChanged: (val){
                textFormField1 = val;
              },
            ),
            SizedBox(height: 6,),TextFormField(
              validator: (val) => val!.isEmpty ? "Must not be empty" : null,
              decoration: const InputDecoration(
                  hintText: "Hint numba 2"
              ),
              onChanged: (val){
                textFormField1 = val;
              },
            ),
            SizedBox(height: 6,),TextFormField(
              validator: (val) => val!.isEmpty ? "Must not be empty" : null,
              decoration: const InputDecoration(
                  hintText: "Hint numba 3"
              ),
              onChanged: (val){
                textFormField1 = val;
              },
            ),
            Spacer(),
            AppLogo().blueButton(context, "Create Survey"),
            SizedBox(height: 50,),
          ],),
        ),
      ),
    );
  }
}
