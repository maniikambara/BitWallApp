import 'package:flutter/material.dart';

void main() {
  runApp(multitfapp());
}

// ignore: camel_case_types
class multitfapp extends StatelessWidget {
  const multitfapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: multitf(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: camel_case_types
class multitf extends StatelessWidget {
  const multitf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393E46), // Warna abu-abu gelap
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/Material/multitf.png",
                      width: 200, // Atur lebar ikon
                      height: 200, // Atur tinggi ikon
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
            // Judul
            Text(
              'MultiTransfer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 90),
            // Tombol One to Many
            TransferButton(
              icon: Image.asset(
                "lib/Material/oneTomany.png",
                width: 70, // Atur lebar ikon
                height: 70, // Atur tinggi ikon
              ),
              text: 'One to Many',
              onPressed: () {},
              textStyle: TextStyle(
                fontWeight: FontWeight.bold, // Membuat teks menjadi bold
                color: Color(0xFF393E46), // Mengatur warna teks menjadi putih
              ),
            ),
            SizedBox(height: 20),
            // Tombol Many to One
            TransferButton(
              icon: Image.asset(
                "lib/Material/manyToone.png",
                width: 70, // Atur lebar ikon
                height: 70, // Atur tinggi ikon
              ),
              text: 'Many to One',
              onPressed: () {},
              textStyle: TextStyle(
                fontWeight: FontWeight.bold, // Membuat teks menjadi bold
                color: Color(0xFF393E46), // Mengatur warna teks menjadi putih
              ),
            ),
            SizedBox(height: 20),
            // Tombol Many to Many
            TransferButton(
              icon: Image.asset(
                "lib/Material/manyToMany.png",
                width: 60, // Atur lebar ikon
                height: 70, // Atur tinggi ikon
              ),
              text: 'Many to Many',
              onPressed: () {},
              textStyle: TextStyle(
                fontWeight: FontWeight.bold, // Membuat teks menjadi bold
                color: Color(0xFF393E46), // Mengatur warna teks menjadi putih
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransferButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  // ignore: use_super_parameters
  const TransferButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: EdgeInsets.only(right: 70),
        child: icon,
      ),
      label: Text(
        text,
        style: textStyle,
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFD65A31),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
