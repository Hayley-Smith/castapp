import 'package:castapp/petition_page.dart';
import 'package:castapp/prayer_entity.dart';
import 'package:castapp/prayer_provider.dart';
import 'package:castapp/type_provider.dart';
import 'package:castapp/worry_page.dart';
import 'package:castapp/worship_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cast'),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Worship'),
              Tab(text: 'Worries'),
              Tab(text: 'Petitions'),
            ],
            onTap: (index) {
              // Initialize debateType with a default value
              DebateType debateType = DebateType.worship;

              // Map the tab index to the corresponding DebateType
              final typeProvider =
                  Provider.of<TypeProvider>(context, listen: false);
              switch (index) {
                case 0:
                  debateType = DebateType.worship;
                  print(debateType);
                  break;
                case 1:
                  debateType = DebateType.worry;
                  print(debateType);
                  break;
                case 2:
                  debateType = DebateType.petition;
                  print(debateType);
                  break;
              }
              // Set the current debate type using the TypeProvider
              typeProvider.setDebateType(debateType);
            },
          ),
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
          child: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              WorshipPage(),
              WorryPage(),
              PetitionPage(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  var prayerController = TextEditingController();
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: SingleChildScrollView(
                          child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter your prayer:',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 8.0),
                            TextFormField(
                              onFieldSubmitted: (String value) {
                                void _handleSubmit(String value) {
                                  submitPrayer(context, prayerController);
                                  prayerController.clear();
                                }
                                _handleSubmit(value);
                              },
                              minLines: 1,
                              controller: prayerController,
                              decoration: const InputDecoration(
                                labelText:
                                    '"In everything, pray." - 1 Thessalonians 5:18 (NIV)',
                                border: OutlineInputBorder(),
                              ),
                              // Other properties or controllers for the TextFormField
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                //get prayer type
                                submitPrayer(context,
                                    prayerController); // Close the bottom sheet
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      )));
                });
          },
          backgroundColor: Colors.grey,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void submitPrayer(
      BuildContext context, TextEditingController prayerController) {
    //get prayer type
    DebateType type =
        Provider.of<TypeProvider>(context, listen: false).currentDebateType;

    if (type == DebateType.worry) {
      final worryPrayer = Prayer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: prayerController.text,
        userId: 'user123',
        dateTime: DateTime.now(),
        isWorship: false,
        isWorry: true,
        isPetition: false,
      );
      Provider.of<PrayerProvider>(context, listen: false)
          .addPrayer(worryPrayer);
    } else if (type == DebateType.petition) {
      final petitionPrayer = Prayer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: prayerController.text,
        userId: 'user123',
        dateTime: DateTime.now(),
        isWorship: false,
        isWorry: false,
        isPetition: true,
      );
      Provider.of<PrayerProvider>(context, listen: false)
          .addPrayer(petitionPrayer);
    } else {
      final worshipPrayer = Prayer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: prayerController.text,
        userId: 'user123',
        dateTime: DateTime.now(),
        isWorship: true,
        isWorry: false,
        isPetition: false,
      );
      Provider.of<PrayerProvider>(context, listen: false)
          .addPrayer(worshipPrayer);
    }

    // Handle the button tap
    Navigator.pop(context); // Close the bottom sheet
  }
}
