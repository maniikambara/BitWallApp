import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Foto Profil yang dapat di-klik
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman untuk memperbesar foto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoViewScreen(),
                  ),
                );
              },
              child: Hero(
                tag: 'profile-photo', // Tag untuk Hero animation
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      'https://example.com/your-profile-photo.jpg'), // Ganti dengan URL foto profil Anda
                ),
              ),
            ),
            SizedBox(height: 16),
            // Nama pengguna
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Deskripsi atau status pengguna
            Text(
              'Mobile Developer | Flutter Enthusiast',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
            // Bagian pengaturan atau informasi lebih lanjut
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit Profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Security'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Log Out'),
                    onTap: () {},
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

class PhotoViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Photo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: 'profile-photo',
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://example.com/your-profile-photo.jpg'), // Ganti dengan URL foto profil Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
