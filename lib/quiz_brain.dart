import 'Question.dart';

class QuizBrain {
  int _questionnumber = 0;
  final List<Questions> _questionBank = [
    Questions('Flutter is developed by Google.', true),
    Questions('Flutter uses Dart as its primary programming language.', true),
    Questions(
        'Flutter allows cross-platform development for Android and iOS.', true),
    Questions('In Flutter, everything is a widget.', true),
    Questions('The "StatelessWidget" can hold a mutable state.', false),
    Questions('Flutter uses Skia for rendering UI.', true),
    Questions(
        'Hot reload is a feature in Flutter that helps in faster development.',
        true),
    Questions('Flutter does not support Material Design.', false),
    Questions('A "StatefulWidget" can change its state during runtime.', true),
    Questions(
        'Flutter applications can be compiled into native ARM code.', true),
    Questions(
        'Dart supports both Just-In-Time (JIT) and Ahead-Of-Time (AOT) compilation.',
        true),
    Questions('Flutter only works for mobile applications.', false),
    Questions(
        'Flutter has its own set of UI components, independent of native widgets.',
        true),
    Questions(
        'The "pubspec.yaml" file is used to declare dependencies in a Flutter project.',
        true),
    Questions(
        'Flutter provides widgets for both Cupertino (iOS) and Material Design (Android).',
        true),
  ];

  nextquestion() {
    if (_questionnumber < _questionBank.length - 1) {
      _questionnumber++;
    } else {}
  }

  getquestion() {
    return _questionBank[_questionnumber].questionText;
  }

  bool getanswer() {
    return _questionBank[_questionnumber].questionAnswer;
  }

  isfinished() {
    if (_questionnumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    _questionnumber = 0;
  }
}

  

  //TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber 
  //back to 0.


  // void endQuestion( )
  //     {
  //     if(_questionnumber ==_questionBank.length - 1)
  //     {
  //       Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
  //     }
  //     }