import 'package:castapp/prayer_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PetitionPage extends StatelessWidget {
  const PetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prayers = Provider.of<PrayerProvider>(context).getPetitionPrayers();

    // Get the current day of the week
    final currentDayOfWeek = DateTime.now().weekday;

    bool isSabbath = false;

    if (currentDayOfWeek == DateTime.sunday) {
      isSabbath = true;
    }

    String formatTimestamp(DateTime dateTime) {
      // Use DateFormat from the intl package for formatting
      DateFormat dateFormat =
          DateFormat.yMMMMd(); // You can customize the pattern

      // Format the DateTime object
      String formattedDate = dateFormat.format(dateTime);

      return formattedDate;
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (isSabbath) {
          // Display the list of petitions
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: prayers.length,
              itemBuilder: (BuildContext context, int index) {
                // Get timestamp and format
                final String dateTime = formatTimestamp(prayers[index].dateTime);

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(prayers[index].text),
                      subtitle: Text(dateTime),
                      // Add more customization as needed
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          // Display centered text
          return const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Philippians 4:6 (NIV): "Do not be anxious about anything, but in every situation, by prayer and petition, with thanksgiving, present your requests to God." \n\nYour petition prayers will be visible on the sabbath for reflection.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}