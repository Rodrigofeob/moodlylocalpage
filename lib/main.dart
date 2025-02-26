import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoodlyHomePage(),
    );
  }
}

class MoodlyHomePage extends StatelessWidget {
  const MoodlyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset(
                  'assets/images/moodly_logo.png',
                  height: 70,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Seja Bem-Vindo, Mr. Myke',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal[700],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'O Moodly ajuda você a entender e registrar suas emoções '
                'diárias de forma simples. Acompanhe seus sentimentos '
                'e descubra padrões para melhorar seu bem-estar.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Histórico',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  EmotionCard(
                    day: '17 Seg',
                    time: '12:30 pm',
                    name: 'Mr. Myke',
                    status: 'Feliz',
                    color: Colors.green,
                  ),
                  EmotionCard(
                    day: '12 Qua',
                    time: '15:00 pm',
                    name: 'Mr. Myke',
                    status: 'Triste',
                    color: Colors.red,
                  ),
                  EmotionCard(
                    day: '07 Sáb',
                    time: '09:45 am',
                    name: 'Mr. Myke',
                    status: 'Ansioso',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal[700],
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Estatísticas',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.add, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class EmotionCard extends StatelessWidget {
  final String day;
  final String time;
  final String name;
  final String status;
  final Color color;

  const EmotionCard({
    Key? key,
    required this.day,
    required this.time,
    required this.name,
    required this.status,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
