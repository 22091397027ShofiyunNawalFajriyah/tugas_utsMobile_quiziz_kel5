import 'package:flutter/material.dart';
import 'quiz_screen.dart';

// Class untuk menampilkan hasil quiz
class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final VoidCallback onRestartQuiz; // Callback untuk memulai ulang kuis

  // Konstruktor untuk ResultScreen
  const ResultScreen({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.onRestartQuiz, //Callback untuk memulai ulang quiz
  });

  // Metode untuk membangun tampilan layar hasil
  @override
  Widget build(BuildContext context) {
    double percentageScore = (correctAnswers / totalQuestions) * 100;
    int incorrectAnswers = totalQuestions - correctAnswers;

    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade100,
      appBar: AppBar(
        title: Text(
          'Quiz Result',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFB0578D),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thank you for completing this quiz!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            // Tambahkan gambar di bawah teks "Thank you for completing this quiz!"
            Image.asset(
              'images/thanks.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: 20),
            Text(
              'Correct Answers: $correctAnswers',
              style: TextStyle(fontSize: 24, color: Color(0xFFFFF2E1), fontWeight: FontWeight.bold),
            ),
            Text(
              'Incorrect Answers: $incorrectAnswers',
              style: TextStyle(fontSize: 24, color: Color(0xFFFFF2E1), fontWeight: FontWeight.bold),
            ),
            Text(
              'Percentage Score: ${percentageScore.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24, color: Color(0xFFFFF2E1), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Tambahkan tombol "Restart", "Back to Home", dan "Exit" dengan ukuran yang sama
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // Tambahkan padding horizontal di sekitar Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Menyusun tombol dengan jarak yang sama
                children: [
                  // Gunakan Expanded untuk membuat lebar tombol sama
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(),
                          ),
                        );
                      },
                      child: Text('Restart'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xFFB0578D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15), // Jarak horizontal antara tombol
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                      },
                      child: Text('Back to Home'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xFFB0578D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15), // Jarak horizontal antara tombol
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Exit'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xFFB0578D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
