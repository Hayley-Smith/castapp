import 'package:castapp/type_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    test('Initial Debate Type', () {
      final provider = TypeProvider();
      expect(provider.currentDebateType, equals(DebateType.worship));
    });

    test('Set Debate Type', () {
      final provider = TypeProvider();
      final initialType = provider.currentDebateType;

      provider.setDebateType(DebateType.worry);

      expect(provider.currentDebateType, equals(DebateType.worry));
      expect(provider.currentDebateType, isNot(equals(initialType)));
    });

    test('Set Debate Type Notifies Listeners', () {
      final provider = TypeProvider();
      bool listenerCalled = false;

      provider.addListener(() {
        listenerCalled = true;
      });

      provider.setDebateType(DebateType.petition);

      expect(listenerCalled, isTrue);
    });}

