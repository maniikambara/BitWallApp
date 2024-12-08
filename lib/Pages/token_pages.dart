import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Components/filtertoken.dart';
import 'package:flutter_application_1/Pages/Components/tokendetail.dart';
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
        toolbarHeight: 120, // Tinggi toolbar untuk memberi jarak
        leading: IconButton(
          icon: Image.asset('lib/Material/more.png', width: 40, height: 40),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MorePages()),
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'lib/Material/LogoText.png',
          width: 120,
          height: 40,
        ),
        actions: [
          IconButton(
            icon: Image.asset('lib/Material/notif.png', width: 40, height: 40),
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
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white, size: 40),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    backgroundColor: const Color(0xFF222831),
                    builder: (_) => const TokenFilterSheet(),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'CRYPTO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Header list token
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Token',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Harga',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          
          // List token dan harga
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Jumlah baris dalam daftar
              itemBuilder: (context, index) {
                final isProfit = Random().nextBool();
                final percent = isProfit ? Random().nextInt(10) + 1 : -Random().nextInt(10) - 1;
                final price = (index + 1) * 10;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TokenDetails(
                            name: 'BTC ${index + 1}',
                            price: price.toDouble(),
                            isProfit: isProfit,
                            bestBid: 0.0,
                            bestAsk: 0.0,
                            change: 0.0,
                            changePercent: 0.0,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 30, // Ukuran avatar diperbesar 2x
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.currency_bitcoin, color: Colors.white, size: 30),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BTC ${index + 1}',
                                  style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'BitCoin', // Ubah menjadi nama token yang sesuai
                                  style: const TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Rp $price',
                              style: const TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              '${isProfit ? '+' : ''}$percent%', // Tambahkan tanda + jika profit
                              style: TextStyle(
                                color: isProfit ? Colors.green : Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExtended)
            Container(
              width: 220,
              decoration: BoxDecoration(
                color: const Color(0xFF222831),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                shrinkWrap: true,
                children: const [
                  '1 Hari',
                  '1 Bulan',
                  '1 Tahun',
                ].map((range) {
                  return ListTile(
                    title: Text(
                      range,
                      style: TextStyle(color: Colors.white),
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
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}