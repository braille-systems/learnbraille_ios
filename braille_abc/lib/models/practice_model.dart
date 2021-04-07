import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Practice {
  static final List<SectionType> _pool = [];

  static void addSymbolGroup(SectionType sectionType) {
    _pool.add(sectionType);
  }
  static void removeSymbolGroup(SectionType sectionType) {
    _pool.remove(sectionType);
  }
  static List<SectionType> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
  }
}

class Results {
  final int stepCounter;
  final int correctAnswerCounter;

  const Results(this.stepCounter, this.correctAnswerCounter);
}

class PracticeResults {
  static final List<bool> _answer = [false, false, false, false, false, false];
  static int _stepCounter = 0;
  static int _correctAnswerCounter = 0;

  static Results getResults() => Results(_stepCounter, _correctAnswerCounter);

  static void resetAnswer() {
    for(var i = 0; i < _answer.length; ++i) {
      _answer[i] = false;
    }
  }

  static void incStepCounter() {
    ++_stepCounter;
  }

  static void incCorrectAnswerCounter() {
    ++_correctAnswerCounter;
    PracticeResults.incStepCounter();
  }

  static void updatePracticeResults() {
    PracticeResults.resetAnswer();
    _stepCounter = 0;
    _correctAnswerCounter = 0;
  }

  static void dotClick(int dotNum) {
    assert(1 <= dotNum && dotNum <= 6);
    _answer[dotNum - 1] = !_answer[dotNum - 1];
  }

  // static int getStepCounter() => _stepCounter;

  // static int getCorrectAnswerCounter() => _correctAnswerCounter;

  static bool checkAnswer(List<bool> correctAnswer) {
    assert(_answer.length == correctAnswer.length);
    for(var i = 0; i < _answer.length; ++i) {
      if(_answer[i] != correctAnswer[i]) {
        return false;
      }
    }
    return true;
  }

}
