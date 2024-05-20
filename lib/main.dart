import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Match App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MatchListScreen(),
    );
  }
}

class MatchListScreen extends StatefulWidget {
  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // For status bar padding
            Text('Glad to see you,', style: TextStyle(fontSize: 16)),
            Text('Esther Howard!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Find your favorite club',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Text('Live Match',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Premier League', style: TextStyle(fontSize: 16)),
                        Text("78'",
                            style: TextStyle(fontSize: 16, color: Colors.red)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/arsenal.png', height: 40),
                        SizedBox(width: 20),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: '2',
                                  style: TextStyle(color: Colors.green)),
                              TextSpan(text: ' : '),
                              TextSpan(text: '1'),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Image.asset('assets/images/chelsea.png', height: 40),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Live'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Finished Match',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FinishedMatchCard(
                      league: 'Champions League',
                      date: 'Yesterday',
                      team1Logo: 'assets/images/juventus.png',
                      team2Logo: 'assets/images/psg.png',
                      score: '1 : 0',
                    ),
                    SizedBox(width: 10),
                    FinishedMatchCard(
                      league: 'League B',
                      date: '15 July 2020',
                      team1Logo: 'assets/images/bayern.png',
                      team2Logo: 'assets/images/dortmund.png',
                      score: '0 : 0',
                    ),
                    // Add more cards here if needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FinishedMatchCard extends StatelessWidget {
  final String league;
  final String date;
  final String team1Logo;
  final String team2Logo;
  final String score;

  const FinishedMatchCard({
    Key? key,
    required this.league,
    required this.date,
    required this.team1Logo,
    required this.team2Logo,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> scores = score.split(' : ');
    int team1Score = int.parse(scores[0]);
    int team2Score = int.parse(scores[1]);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(league, style: TextStyle(fontSize: 16)),
                Text(date, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(team1Logo, height: 40),
                SizedBox(width: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: scores[0],
                          style: TextStyle(
                              color: team1Score > team2Score
                                  ? Colors.green
                                  : Colors.black)),
                      TextSpan(text: ' : '),
                      TextSpan(
                          text: scores[1],
                          style: TextStyle(
                              color: team2Score > team1Score
                                  ? Colors.green
                                  : Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Image.asset(team2Logo, height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
