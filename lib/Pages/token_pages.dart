import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/more_pages.dart';


class TokenPages extends StatefulWidget {
  const TokenPages({super.key});

  @override
  State<TokenPages> createState() => _TokenPagesState();
}

class _TokenPagesState extends State<TokenPages> {
  String selectedRange = '1 Hari'; // Rentang waktu default
  bool isExtended = false; // Status tombol mengambang

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      appBar: AppBar(
        backgroundColor: const Color(0xFF393E46),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('lib/Material/more.png', width: 30, height: 30),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MorePages()),
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'lib/Material/Logo.png', // Ganti dengan path logo Anda
          width: 40,
          height: 40,
        ),
        actions: [
          IconButton(
            icon: Image.asset('lib/Material/notif.png', width: 30, height: 30),
            onPressed: () {
              // Aksi untuk Notifikasi
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header teks "CRYPTO" dan ikon filter
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {
                    // Aksi untuk filter crypto
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'CRYPTO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),

          // List token dan harga
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100), // Batas bawah 100px
              itemCount: 20, // Jumlah baris dalam daftar
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.currency_bitcoin, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Token $index',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        '\$${(index + 1) * 10}',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Floating Action Button
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExtended)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF222831),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                shrinkWrap: true,
                children: ['1 Hari', '1 Bulan', '1 Tahun'].map((range) {
                  return ListTile(
                    title: Text(
                      range,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        selectedRange = range;
                        isExtended = false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                isExtended = !isExtended;
              });
            },
            backgroundColor: const Color(0xFF222831),
            label: Text(
              'Rentang Waktu: $selectedRange',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}