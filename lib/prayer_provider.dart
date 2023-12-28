import 'package:castapp/prayer_entity.dart';
import 'package:flutter/material.dart';

class PrayerProvider with ChangeNotifier {
  final List<Prayer> _prayers = [
    Prayer(
      id: '1',
      text: 'Lord, thank you for this day.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: true,
      isWorry: false,
      isPetition: false,
    ),Prayer(
      id: '12',
      text: 'Grateful for this or that',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: true,
      isWorry: false,
      isPetition: false,
    ),
    Prayer(
      id: '2',
      text: 'Father, guide me in making wise decisions and lead me on the path of righteousness.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: false,
      isWorry: false,
      isPetition: true,
    ),
    Prayer(
      id: '3',
      text: 'I am worried about my friend.',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: false,
      isWorry: true,
      isPetition: false,
    ),
    Prayer(
      id: '4',
      text: 'Am I too strict?',
      userId: 'user123',
      dateTime: DateTime.now(),
      isWorship: false,
      isWorry: true,
      isPetition: false,
    ),
  ];

  // Getter for the list of prayers
  List<Prayer> get prayers => _prayers;

  // Add a new prayer
  void addPrayer(Prayer prayer) {
    _prayers.add(prayer);
    notifyListeners();
  }

  // Remove a prayer by ID
  void removePrayer(String prayerId) {
    _prayers.removeWhere((prayer) => prayer.id == prayerId);
    notifyListeners();
  }

  // Update a prayer
  void updatePrayer(Prayer updatedPrayer) {
    // Find the index of the prayer with the same ID
    final index = _prayers.indexWhere((prayer) => prayer.id == updatedPrayer.id);

    if (index != -1) {
      // Replace the old prayer with the updated one
      _prayers[index] = updatedPrayer;
      notifyListeners();
    }
  }


  List<Prayer> getWorshipPrayers() {
    return _prayers.where((prayer) => prayer.isWorship).toList();
  }

  List<Prayer> getWorryPrayers() {
    return _prayers.where((prayer) => prayer.isWorry).toList();
  }

  List<Prayer> getPetitionPrayers() {
    return _prayers.where((prayer) => prayer.isPetition).toList();
  }

}