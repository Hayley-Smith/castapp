import 'package:castapp/prayer_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorshipPage extends StatelessWidget {
  const WorshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prayers = Provider.of<PrayerProvider>(context).getWorshipPrayers();

    String formatTimestamp(DateTime dateTime) {
      // Use DateFormat from the intl package for formatting
      DateFormat dateFormat =
          DateFormat.yMMMMd(); // You can customize the pattern

      // Format the DateTime object
      String formattedDate = dateFormat.format(dateTime);

      return formattedDate;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: prayers.length,
          itemBuilder: (BuildContext context, int index) {
            // Get timestamp and format
            final String dateTime = formatTimestamp(prayers[index].dateTime);
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Text(prayers[index].title,
                  style: const TextStyle(color: Colors.white),),
                  subtitle: Text(dateTime),
                  children: [
                    Text(
                      prayers[index].text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
