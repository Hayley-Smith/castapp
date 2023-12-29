import 'package:castapp/petition_page.dart';
import 'package:castapp/prayer_entity.dart';
import 'package:castapp/prayer_input_page.dart';
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
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Man of God'),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: const [
                Tab(text: 'Praise'),
                Tab(text: 'Problems'),
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
            backgroundColor: Colors.grey,
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrayerInputPage(),
                ),
              );
            },
          )),
    );
  }


}
