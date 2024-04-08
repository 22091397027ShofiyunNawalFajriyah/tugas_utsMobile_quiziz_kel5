import 'package:flutter/material.dart';
import 'question_model.dart';
import 'result_screen.dart';

// Class QuizScreen untuk menampilkan tampilan quiz
class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

// Kelas _QuizScreenState merupakan State dari QuizScreen
class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  bool isQuizFinished = false;

  // Metode untuk membangun tampilan quiz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiziz MI Junior',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFD63484),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Selamat Datang Mahasiswa Baru! Mari Uji Pengetahuan Anda tentang Manajemen Informatika UNESA!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              _questionWidget(),
              _answerList(),
              _nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Metode untuk membuat widget pertanyaan
  Widget _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Menampilkan nomor pertanyaan dan jumlah total pertanyaan
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        // Kotak untuk menampilkan teks pertanyaan
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color(0xFFB0578D),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  // Metode untuk membuat widget daftar jawaban
  Widget _answerList() {
    return Column(
      children: questionList[currentQuestionIndex].answerList.map((e) => _answerButton(e)).toList(),
    );
  }

  // Metode untuk membuat tombol jawaban
  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: const StadiumBorder(),
          backgroundColor: isSelected ? Color(0xFFB0578D) : Color(0xFFFDF7E4),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            } else {
              _showSnackBar("You Entered the Wrong Answer!!");
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  // Metode untuk menampilkan snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  // Metode untuk menyerahkan quiz dan menavigasi ke layar hasil
  void _submitQuiz() {
    setState(() {
      isQuizFinished = true;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          totalQuestions: questionList.length,
          correctAnswers: score,
          onRestartQuiz: _restartQuiz, // Mengirim fungsi _restartQuiz ke ResultScreen
        ),
      ),
    );
  }

  // Metode untuk membuat tombol "Next" atau "Submit"
  Widget _nextButton() {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: Color(0xFFD988B9),
        ),
        onPressed: () {
          if (isLastQuestion) {
            _submitQuiz(); // Panggil _submitQuiz saat pengguna menekan "Submit"
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  // Metode untuk memulai kembali quiz
  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      selectedAnswer = null;
      isQuizFinished = false;
    });
  }
}
