import 'package:flutter/foundation.dart';

enum DebateType { worship, worry, petition }

class TypeProvider extends ChangeNotifier {

  DebateType _currentDebateType = DebateType.worship ;

  DebateType get currentDebateType => _currentDebateType;

  void setDebateType(DebateType newDebateType) {
    if (_currentDebateType != newDebateType) {
      _currentDebateType = newDebateType;
      notifyListeners();
    }
  }
}