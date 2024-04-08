class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}
class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions(){
  List<Question> list = [];
  //Menambahkan pertanyaan dan jawaban
  list.add(Question(
    "Siapa koordinator prodi D4 Manajemen Informatika?",
    [
      Answer("Dodik Arwin Dermawan, S.ST., S.T., M.T.", true),
      Answer("Hafizhuddin Zul Fahmi, S.Kom., M.Si.", false),
      Answer("I Gde Agung Sri Sidhimantra, S.Kom., M.Kom.", false),
      Answer("Salamun Rohman Nudin, S.Kom., M.Kom.", false),
    ],
  ));

  list.add(Question(
    "Prodi D4 Manajemen Informatika masuk dalam fakultas?",
    [
      Answer("Teknik", false),
      Answer("Hukum", false),
      Answer("Vokasi", true),
      Answer("Bahasa dan Sastra", false),
    ],
  ));

  list.add(Question(
    "Fakultas Vokasi terletak di kampus UNESA?",
    [
      Answer("Lidah Wetan", false),
      Answer("Ketintang", true),
      Answer("Sidoarjo", false),
      Answer("Magetan", false),
    ],
  ));

  list.add(Question(
    "Himpunan Mahasiswa Prodi D4 Manajemen Informatika bernama?",
    [
      Answer("HIMATEKTRIK", false),
      Answer("HIMASTAN", false),
      Answer("HIMADEGA", false),
      Answer("HIMAFORTIC", true),
    ],
  ));

  list.add(Question(
    "Ruang Kelas Prodi D4 Manajemen Informatika terletak di gedung?",
    [
      Answer("K3", false),
      Answer("K2", true),
      Answer("K4", false),
      Answer("K9", false),
    ],
  ));

  list.add(Question(
    "Ada berapa prodi di fakultas Vokasi?",
    [
      Answer("8", false),
      Answer("9", false),
      Answer("7", false),
      Answer("10", true),
    ],
  ));

  list.add(Question(
    "Siapa Dekan Fakultas Vokasi sekarang?",
    [
      Answer("Dr. Warju, S.Pd., S.T., M.T.", false),
      Answer("Dr. Suprapto, S.Pd., M.T.", true),
      Answer("Dr. Abdul Hafidz, S.Pd., M.Pd.", false),
      Answer("Reza Rahmadian, S.ST., M.EngsSc.", false),
    ],
  ));

  list.add(Question(
    "Nama kegiatan yang di ikuti Mahasiswa Baru Prodi D4 Manajemen Informatika adalah?",
    [
      Answer("AMELIORER", false),
      Answer("PKKMB", false),
      Answer("EQUILLIBRE", true),
      Answer("OSJUR", false),
    ],
  ));

  list.add(Question(
    "Di bawah ini yang bukan bahasa pemrograman adalah?",
    [
      Answer("C++", false),
      Answer("Python", false),
      Answer("JavaScript", false),
      Answer("CSS", true),
    ],
  ));

  list.add(Question(
    "Singkatan dari Manajemen Informatika adalah?",
    [
      Answer("MI", true),
      Answer("Maniform", false),
      Answer("TI", false),
      Answer("SI", false),
    ],
  ));

  return list;
}