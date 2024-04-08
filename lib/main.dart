import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Mengganti halaman awal menjadi HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCDEA), // Mengatur warna background
      appBar: AppBar(
        title: Text(
          'Welcome to the Quiz!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFD63484),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'images/welcome.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Start'), // Tombol untuk memulai kuis
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF704264), backgroundColor: Colors.transparent, // Warna teks tombol ungu
                side: BorderSide(color: Color(0xFF704264)), // Garis tepi tombol ungu
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()), // Pindah ke halaman ProfileScreen
                );
              },
              child: Text('Profile'), // Tombol untuk profil
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF704264), backgroundColor: Colors.transparent, // Warna teks tombol ungu
                side: BorderSide(color: Color(0xFF704264)), // Garis tepi tombol ungu
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
