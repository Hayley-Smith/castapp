import 'package:castapp/prayer_entity.dart';
import 'package:castapp/prayer_provider.dart';
import 'package:castapp/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrayerInputPage extends StatefulWidget {
  const PrayerInputPage({super.key});

  @override
  _PrayerInputPageState createState() => _PrayerInputPageState();
}

class _PrayerInputPageState extends State<PrayerInputPage> {
  // Controller for text fields
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void submitPrayer(
      BuildContext context, TextEditingController titleController, TextEditingController bodyController) {
    String title = titleController.text;
    String body = bodyController.text;

    //get prayer type
    DebateType type =
        Provider.of<TypeProvider>(context, listen: false).currentDebateType;

    if (type == DebateType.worry) {
      final worryPrayer = Prayer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: bodyController.text,
        userId: 'user123',
        dateTime: DateTime.now(),
        isWorship: false,
        isWorry: true,
        isPetition: false,
        title: titleController.text,
      );
      Provider.of<PrayerProvider>(context, listen: false)
          .addPrayer(worryPrayer);
    } else if (type == DebateType.petition) {
      final petitionPrayer = Prayer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: bodyController.text,
        userId: 'user123',
        dateTime: DateTime.now(),
        isWorship: false,
        isWorry: false,
        isPetition: true,
        title: titleController.text,
      );
      Provider.of<PrayerProvider>(context, listen: false)
          .addPrayer(petitionPrayer);
    } else {
      final worshipPrayer = Prayer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: bodyController.text,
        userId: 'user123',
        dateTime: DateTime.now(),
        isWorship: true,
        isWorry: false,
        isPetition: false,
        title: titleController.text,
      );
      Provider.of<PrayerProvider>(context, listen: false)
          .addPrayer(worshipPrayer);
    }

    // Clear the text fields after submission
    titleController.clear();
    bodyController.clear();

    // Handle the button tap
    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Prayer'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/prayer2.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title Input
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(maxLines: 1, maxLength: 140,
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          hintText: 'Enter prayer title',
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Body Input
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(minLines: 1,maxLength: 5000,
                        controller: bodyController,
                        maxLines: 6, // Allow multiline input
                        decoration: const InputDecoration(
                          labelText: 'Body',
                          hintText: 'Enter prayer details',
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Submit Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          submitPrayer(context, titleController, bodyController);
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


