import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/multi_transfer.dart';

// ignore: use_key_in_widget_constructors
class MorePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393E46), // Background warna sesuai
      appBar: AppBar(
        title: Text(
          'More Service!',
          style: TextStyle(
            color: const Color.fromARGB(
                255, 255, 255, 255), // You can change the color as needed
            fontSize: 15, // You can adjust the font size as needed
            fontWeight: FontWeight.bold, // Makes the text bold
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF393E46),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Section
            _buildSectionTitle('Trending'),
            const SizedBox(height: 10),
            _buildIconGrid([
              {
                'icon': 'lib/Material_More/receive_more.png',
                'label': 'Receive'
              },
              {'icon': 'lib/Material_More/send_more.png', 'label': 'Send'},
              {
                'icon': 'lib/Material_More/swap_more.png',
                'label': 'Swap & Convert'
              },
            ]),

            const SizedBox(height: 3),

            // Market & Transaction Section
            _buildSectionTitle('Market & Transaction'),
            const SizedBox(height: 10),
            _buildIconGrid([
              {'icon': 'lib/Material_More/buy_more.png', 'label': 'Buy Crypto'},
              {
                'icon': 'lib/Material_More/launchpool_more.png',
                'label': 'Launchpool'
              },
              {
                'icon': 'lib/Material_More/stacking_more.png',
                'label': 'Stacking'
              },
              {
                'icon': 'lib/Material_More/ma_more.png',
                'label': 'Market Analysis'
              },
              {'icon': 'lib/Material_More/p2p_more.png', 'label': 'P2P'},
              {
                'icon': 'lib/Material_More/mp_more.png',
                'label': 'Multy Payment'
              },
            ]),

            const SizedBox(height: 5),

            // Earn Section
            _buildSectionTitle('Earn'),
            const SizedBox(height: 10),
            _buildIconGrid([
              {
                'icon': 'lib/Material_More/history_more.png',
                'label': 'History'
              },
              {
                'icon': 'lib/Material_More/hs_more.png',
                'label': 'Help & Support'
              },
              {
                'icon': 'lib/Material_More/security_more.png',
                'label': 'Security'
              },
              {
                'icon': 'lib/Material_More/setting_more.png',
                'label': 'Setting'
              },
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {double fontSize = 15.0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildIconGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            if (item['label'] == 'Multy Payment') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const multitfapp()), // Assuming MultiTransferPage is the target page
              );
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              item['icon'] is String
                  ? Image.asset(
                      item['icon'],
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                          size: 40,
                        );
                      },
                    )
                  : Icon(
                      item['icon'],
                      color: Colors.white,
                      size: 40,
                    ),
              const SizedBox(height: 8),
              Text(
                item['label'],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MorePages(),
    debugShowCheckedModeBanner: false,
  ));
}
