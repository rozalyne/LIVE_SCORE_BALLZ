// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(LiveScoreApp());
}

class LiveScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: ListView(
            children: [
              // User Greeting Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Glad to see you,', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 4),
                    Text('Esther Howard!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Find your favorite club',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // Live Match Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Live Match',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Premiere League',
                                  style: TextStyle(fontSize: 16)),
                              Text('78\'',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network('https://via.placeholder.com/50',
                                  height: 50),
                              Text('2',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text(':',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text('1',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Image.network('https://via.placeholder.com/50',
                                  height: 50),
                            ],
                          ),
                          SizedBox(height: 8),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('Live'),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.green),
                              foregroundColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // Finished Matches Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Finished Match',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          FinishedMatchCard(
                            league: 'Champions League',
                            date: 'Yesterday',
                            team1: 'Juventus',
                            team2: 'Paris S-G',
                            score1: '1',
                            score2: '0',
                            imageUrl1: 'https://via.placeholder.com/50',
                            imageUrl2: 'https://via.placeholder.com/50',
                          ),
                          Divider(),
                          FinishedMatchCard(
                            league: 'League B',
                            date: '15 July 2020',
                            team1: 'Bayern',
                            team2: 'Dortmund',
                            score1: '0',
                            score2: '2',
                            imageUrl1: 'https://via.placeholder.com/50',
                            imageUrl2: 'https://via.placeholder.com/50',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // Match Stats Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Champions League',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Juventus', style: TextStyle(fontSize: 16)),
                              Text('1 : 0', style: TextStyle(fontSize: 16)),
                              Text('Paris S-G', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/50'),
                              ),
                              Text('Top Player',
                                  style: TextStyle(fontSize: 16)),
                              Text('Paulo Dybala',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 16),
                          MatchStats(
                            stat1: '11',
                            stat2: '14',
                            label: 'Total Shots',
                          ),
                          MatchStats(
                            stat1: '4',
                            stat2: '2',
                            label: 'Shots on Target',
                          ),
                          MatchStats(
                            stat1: '64',
                            stat2: '36',
                            label: 'Possession',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinishedMatchCard extends StatelessWidget {
  final String league;
  final String date;
  final String team1;
  final String team2;
  final String score1;
  final String score2;
  final String imageUrl1;
  final String imageUrl2;

  FinishedMatchCard({
    required this.league,
    required this.date,
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
    required this.imageUrl1,
    required this.imageUrl2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(league, style: TextStyle(fontSize: 16)),
            Text(date, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        Spacer(),
        Image.network(imageUrl1, height: 50),
        SizedBox(width: 8),
        Text(score1,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(score2,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Image.network(imageUrl2, height: 50),
      ],
    );
  }
}

class MatchStats extends StatelessWidget {
  final String stat1;
  final String stat2;
  final String label;

  MatchStats({
    required this.stat1,
    required this.stat2,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(stat1, style: TextStyle(fontSize: 16)),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text(stat2, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
