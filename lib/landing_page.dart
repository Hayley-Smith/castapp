import 'package:castapp/homepage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Cast'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(opacity: .1,
            image: AssetImage(
              "assets/prayer2.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Your Prayer Companion',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Transform Your Prayers, Transform Your Life',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    );
                  },
                  child: const Text('Enter Your Prayer Space'),
                ),
                const SizedBox(height: 40),
                const Text(
                  'What is the Cast app?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Cast is more than just a prayer app; it\'s your sanctuary for spiritual growth, positivity, and reflection. Tailored for believers seeking a more meaningful prayer experience, our app offers a unique approach to prayerful living.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                const Text(
                  'How It Works',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '1. Choose Your Prayer Type:',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Worship/ Praise: Share moments of gratitude and positivity.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Worry: Express your anxieties and concerns.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Petition: Request divine intervention for your needs.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  '2. Daily Positivity:',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Worship/ Praise prayers are visible at all times, providing a constant source of inspiration and positivity.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  '3. Sabbath Reflection:',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Worry and Petition prayers become visible only on the Sabbath, creating a designated time for reflection and seeing how your concerns have evolved.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  '4. Track Your Spiritual Journey:',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- A built-in journal allows you to revisit and celebrate answered prayers, fostering a sense of gratitude and growth.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Why choose Cast?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '- Positive Focus: Start and end your day with worship and praise, maintaining a positive mindset.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Sabbath Reflection: Use the Sabbath to reflect on your worries and petitions, witnessing the transformative power of prayer over time.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Personal Growth: Track your spiritual journey and witness the impact of your prayers.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),

              ],
            ),
          ),
        ),
      ),
    );
  }
}