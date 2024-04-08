import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); //Kembali ke halaman sebelumnya saat tombol ditekan
          },
        ),
      ),
      backgroundColor: Colors.pinkAccent[100],
      body: SafeArea(
        child: Column(
          children: [
            // Profil pertama
            ProfileCard(
              name: 'Shofiyun Nawal Fajriyah',
              role: 'WEB DEVELOPER',
              contact: '0895395310695',
              email: 'shofiyunnawal.22027@mhs.unesa.ac.id',
              avatarImage: 'images/fina.jpeg',
            ),

            // Profil kedua
            ProfileCard(
              name: 'Nurissaidah',
              role: 'UI DESIGNER',
              contact: '085226209994',
              email: 'nurissaidah.22030@mhs.unesa.ac.id',
              avatarImage: 'images/nuris.jpeg',
            ),

            // Profil ketiga
            ProfileCard(
              name: 'Frida Nur Cahyani',
              role: 'DATA SCIENTIST',
              contact: '087654321098',
              email: 'frida.22036@mhs.unesa.ac.id',
              avatarImage: 'images/frida.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}

//Mendefinisikan isi dari profile pengguna
class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String contact;
  final String email;
  final String avatarImage;

  ProfileCard({
    required this.name,
    required this.role,
    required this.contact,
    required this.email,
    required this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pinkAccent.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(avatarImage),
          ),
          SizedBox(height: 2),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora',
            ),
          ),
          Text(
            role,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: 3),
          Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.call,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  contact,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.mail,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  email,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
