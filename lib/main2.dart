import 'package:flutter/material.dart';

void main() {
  runApp(LiveScoreApp());
}

class LiveScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LiveScoreScreen(),
    );
  }
}

class LiveScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Champions League'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yesterday',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/juventus.png',
                      width: 50,
                      height: 50,
                    ),
                    Text('Juventus'),
                  ],
                ),
                Text(
                  '1 : 0',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/psg.png',
                      width: 50,
                      height: 50,
                    ),
                    Text('Paris S-G'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/dybala.png',
                ),
              ),
              title: Text('Top Player'),
              subtitle: Text('Paulo Dybala'),
            ),
            SizedBox(height: 20),
            Text(
              'Match Stats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            StatsRow(
              statName: 'Total Shots',
              juvStat: '11',
              psgStat: '14',
            ),
            StatsRow(
              statName: 'Shots on Target',
              juvStat: '4',
              psgStat: '2',
            ),
            StatsRow(
              statName: 'Possession',
              juvStat: '64',
              psgStat: '36',
            ),
          ],
        ),
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  final String statName;
  final String juvStat;
  final String psgStat;

  StatsRow({
    required this.statName,
    required this.juvStat,
    required this.psgStat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(juvStat),
          Text(statName),
          Text(psgStat),
        ],
      ),
    );
  }
}
