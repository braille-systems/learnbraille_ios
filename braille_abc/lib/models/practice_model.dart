import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Practice {
  static final List<SectionType> _pool = [];
  static final isNotEmpty = ValueNotifier(_pool.isNotEmpty);

  static void addSymbolGroup(SectionType sectionType) {
    _pool.add(sectionType);
    isNotEmpty.value = _pool.isNotEmpty;
  }
  static void removeSymbolGroup(SectionType sectionType) {
    _pool.remove(sectionType);
    isNotEmpty.value = _pool.isNotEmpty;
  }
  static List<SectionType> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
    isNotEmpty.value = false;
  }
}

class Results {
  final int stepCounter;
  final int correctAnswerCounter;
  final int hintCounter;

  const Results(this.stepCounter, this.correctAnswerCounter, this.hintCounter);
}

class PracticeResults {
  static final List<bool> _answer = [false, false, false, false, false, false];
  static int _stepCounter = 0;
  static int _correctAnswerCounter = 0;
  static int _hintCounter = 0;
  static bool _isHintUsed = false;

  static Results getResults() {
    return Results(_stepCounter, _correctAnswerCounter, _hintCounter);
  }

  static void resetAnswer() {
    _isHintUsed = false;
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

  static void incHintCounter() {
    if(!_isHintUsed) {
      _isHintUsed = true;
      ++_hintCounter;
    }
  }

  static void updatePracticeResults() {
    PracticeResults.resetAnswer();
    _stepCounter = 0;
    _correctAnswerCounter = 0;
    _hintCounter = 0;
    _isHintUsed = false;
  }

  static void dotClick(int dotNum) {
    assert(1 <= dotNum && dotNum <= 6);
    _answer[dotNum - 1] = !_answer[dotNum - 1];
  }

  static void dotDefault(){
    for(var i = 0; i < _answer.length; i++){
      _answer[i] = false;
    }
  }

  static void dotCorrect(List<bool> correctAnswer){
    assert(_answer.length == correctAnswer.length);
    for(var i = 0; i < _answer.length; ++i) {
      _answer[i] = correctAnswer[i];
    }
  }

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
