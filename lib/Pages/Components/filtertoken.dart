import 'package:flutter/material.dart';

class FilterToken extends StatefulWidget {
  const FilterToken({super.key});

  @override
  State<FilterToken> createState() => _FilterTokenState();
}

class _FilterTokenState extends State<FilterToken> {
  // List untuk menyimpan status checkbox
  final List<bool> _selectedFilters = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF222831),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Text(
            'Filter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // List checkbox bulat
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  activeColor: const Color(0xFFD65A31),
                  checkColor: const Color(0xFF393E46),
                  title: Text(
                    'Filter ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  value: _selectedFilters[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedFilters[index] = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
          ),

          // Tombol Terapkan
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan aksi untuk tombol Terapkan
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD65A31),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'TERAPKAN',
                style: TextStyle(
                  color: Color(0xFF393E46),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}