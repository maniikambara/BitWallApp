import 'package:flutter/material.dart';
class TokenFilterSheet extends StatelessWidget {
  const TokenFilterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: SizedBox(
              width: 100,
              child: Divider(
                thickness: 3,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              'FILTER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                FilterOption(title: 'Token Terbaru'),
                FilterOption(title: 'Token Favorit'),
                FilterOption(title: 'Token Meme'),
                FilterOption(title: 'Token Gaming'),
                FilterOption(title: 'Token AI & Big Data'),
                FilterOption(title: 'Token DoFi'),
                FilterOption(title: 'Token Layer 1'),
                FilterOption(title: 'Token Layer 2'),
                FilterOption(title: 'Token NFT'),
                FilterOption(title: 'Token Web3'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD65A31),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Center(
              child: Text(
                'TERAPKAN',
                style: TextStyle(
                  color: Color(0xFF222831),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  const FilterOption({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Radio(
            value: title,
            groupValue: null, // Replace with a group value for functionality
            onChanged: (value) {},
            activeColor: const Color(0xFFD65A31),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
