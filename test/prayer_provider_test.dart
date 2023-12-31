import 'package:castapp/main.dart';
import 'package:castapp/prayer_entity.dart';
import 'package:castapp/prayer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('shouldAddPrayer', () {
    final provider = PrayerProvider();
    final initialLength = provider.prayers.length;

    final prayer = Prayer(
      id: '1',
      title: 'Test Prayer',
      text: 'This is a test prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: true,
      isWorry: false,
      isPetition: false,
    );

    provider.addPrayer(prayer);

    expect(provider.prayers.length, equals(initialLength + 1));
    expect(provider.prayers.contains(prayer), isTrue);
  });

  test('Remove Prayer', () {
    final provider = PrayerProvider();
    final prayer = Prayer(
      id: '1',
      title: 'Test Prayer',
      text: 'This is a test prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: true,
      isWorry: false,
      isPetition: false,
    );

    provider.addPrayer(prayer);

    final initialLength = provider.prayers.length;
    provider.removePrayer('1');

    expect(provider.prayers.length, equals(initialLength - 1));
    expect(provider.prayers.contains(prayer), isFalse);
  });

  test('Update Prayer', () {
    final provider = PrayerProvider();
    final prayer = Prayer(
      id: '1',
      title: 'Test Prayer',
      text: 'This is a test prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: true,
      isWorry: false,
      isPetition: false,
    );

    provider.addPrayer(prayer);

    final updatedPrayer = Prayer(
      id: '1',
      title: 'Updated Test Prayer',
      text: 'This is an updated test prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: false,
      isWorry: true,
      isPetition: true,
    );

    provider.updatePrayer(updatedPrayer);

    expect(provider.prayers.contains(updatedPrayer), isTrue);
  });

  test('Filter Prayers', () {
    final provider = PrayerProvider();
    final worshipPrayer = Prayer(
      id: '1',
      title: 'Worship Prayer',
      text: 'This is a worship prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: true,
      isWorry: false,
      isPetition: false,
    );

    final worryPrayer = Prayer(
      id: '2',
      title: 'Worry Prayer',
      text: 'This is a worry prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: false,
      isWorry: true,
      isPetition: false,
    );

    final petitionPrayer = Prayer(
      id: '3',
      title: 'Petition Prayer',
      text: 'This is a petition prayer.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: false,
      isWorry: false,
      isPetition: true,
    );

    provider.addPrayer(worshipPrayer);
    provider.addPrayer(worryPrayer);
    provider.addPrayer(petitionPrayer);

    expect(provider.getWorshipPrayers(), contains(worshipPrayer));
    expect(provider.getWorryPrayers(), contains(worryPrayer));
    expect(provider.getPetitionPrayers(), contains(petitionPrayer));
  });

}
