import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home_pages.dart';

class TokenDetails extends StatelessWidget {
  const TokenDetails({
    super.key,
    required this.name,
    required this.price,
    required this.bestBid,
    required this.bestAsk,
    required this.change,
    required this.changePercent,
    required this.isProfit,
  });

  final String name;
  final double price;
  final double bestBid;
  final double bestAsk;
  final double change;
  final double changePercent;
  final bool isProfit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222831),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222831),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 40,
                        child: const Icon(
                          Icons.currency_bitcoin,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Bitcoin",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Rp. ${price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Bid : Rp. ${bestBid.toStringAsFixed(0)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    'Best Ask : Rp. ${bestAsk.toStringAsFixed(0)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${isProfit ? '+' : '-'}Rp. ${change.toStringAsFixed(0)} (${changePercent.toStringAsFixed(2)}%)',
                style: TextStyle(
                  color: isProfit ? Colors.green : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePages()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF393E46),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 28,
                            child: Icon(Icons.currency_bitcoin, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '999,999,999,999 $name',
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Colors.grey),
              const Text(
                'Your Position',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPositionInfo('Total', '99,999,999,999 BTC'),
              buildPositionInfo('Market Price', 'Rp. 1,508,923,958,933,894 T'),
              buildPositionInfo('Average Buy Price', 'Rp. 1,502,667,391'),
              buildPositionInfo('P&L Hari Ini', '-Rp. 1,502,667,391', isProfit: false),
              buildPositionInfo('Unrealized P&L', '+Rp. 1,502,667,391 (50%)', isProfit: true),
              const SizedBox(height: 20),
              const Text(
                'About BTC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              Scrollbar(
                child: SingleChildScrollView(
                  child: Text(
                    'Bitcoin (BTC) adalah cryptocurrency pertama di dunia yang diciptakan pada tahun 2009 oleh individu atau kelompok anonim dengan nama samaran Satoshi Nakamoto. Bitcoin dirancang sebagai mata uang digital terdesentralisasi yang memungkinkan transaksi peer-to-peer tanpa memerlukan perantara seperti bank atau institusi lainnya.',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        decoration: const BoxDecoration(
          color: Color(0xFF222831),
        ),
        
        child: Row(
          children: [
            Expanded(
              child: buildActionButton(
                'SELL',
                Colors.transparent,
                borderColor: const Color(0xFFD65A31),
                textColor: const Color(0xFFD65A31),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: buildActionButton(
                'BUY',
                const Color(0xFFD65A31),
                textColor: const Color(0xFF222831),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPositionInfo(String title, String value, {bool isProfit = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              color: isProfit ? Colors.green : Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton(String text, Color backgroundColor, {Color? textColor, Color? borderColor}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: borderColor != null ? BorderSide(color: borderColor, width: 2) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}