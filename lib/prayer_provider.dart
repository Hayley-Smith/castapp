import 'package:castapp/prayer_entity.dart';
import 'package:flutter/material.dart';

class PrayerProvider with ChangeNotifier {
  final List<Prayer> _prayers = [

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
    final index =
        _prayers.indexWhere((prayer) => prayer.id == updatedPrayer.id);

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
