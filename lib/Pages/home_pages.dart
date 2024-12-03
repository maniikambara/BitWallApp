import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/more_pages.dart';

void main() {
  runApp(HomePages());
}

// ignore: use_key_in_widget_constructors
class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency & News App',
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: {
        '/more': (context) => MorePages(), // Tambahkan routing halaman More
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBalanceVisible = true;

  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  final List<Map<String, String>> news = [
    {
      'title':
          'Bitcoin Pulls Under \$68K as Crypto Markets Falter Ahead of Election',
      'author': 'Jhonathan',
      'content':
          'At least according to betting markets, the U.S. presidential election...',
    },
    {
      'title':
          'Ethereum Researchers Relinquish EigenLayer Roles Over Conflict of Interest Concerns',
      'author': 'ManikAmbatukam',
      'content':
          'Researchers Justin Drake and Dankrad Feist set off a controversy...',
    },
    {
      'title':
          'Ethereum Researchers Relinquish EigenLayer Roles Over Conflict of Interest Concerns',
      'author': 'ChandraHaru',
      'content':
          'Researchers Justin Drake and Dankrad Feist set off a controversy...',
    },
    {
      'title':
          'Ethereum Researchers Relinquish EigenLayer Roles Over Conflict of Interest Concerns',
      'author': 'YudiRacing',
      'content':
          'Researchers Justin Drake and Dankrad Feist set off a controversy...',
    },
    {
      'title':
          'Ethereum Researchers Relinquish EigenLayer Roles Over Conflict of Interest Concerns',
      'author': 'Tangkaswiguna',
      'content':
          'Researchers Justin Drake and Dankrad Feist set off a controversy...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      appBar: AppBar(
        backgroundColor: const Color(0xFF393E46),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(130),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Icon(
                      Icons.search,
                      color: const Color(0xFF393E46),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: const Color(0xFF393E46),
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              icon: Image.asset('lib/Material/scan.png', width: 30, height: 30),
              onPressed: () {},
            ),
            const SizedBox(width: 1),
            IconButton(
              icon:
                  Image.asset('lib/Material/notif.png', width: 30, height: 30),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                const Text(
                  'TrizzKunn',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _toggleBalanceVisibility,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _isBalanceVisible
                              ? 'Rp. 800,000,000.00'
                              : '*********',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    if (_isBalanceVisible)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('+Rp.900,000 (+0.24%) Today',
                            style:
                                TextStyle(color: Colors.green, fontSize: 16)),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildIconGrid([
              IconAction(
                  imagePath: 'lib/Material_More/send_more.png',
                  label: 'Send',
                  iconSize: 50.0),
              IconAction(
                  imagePath: 'lib/Material_More/receive_more.png',
                  label: 'Receive',
                  iconSize: 50.0),
              IconAction(
                  imagePath: 'lib/Material_More/buy_more.png',
                  label: 'Buy Crypto',
                  iconSize: 50.0),
              IconAction(
                  imagePath: 'lib/Material/more.png',
                  label: 'More',
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/more'); // Navigate to More page
                  }),
            ]),
            const SizedBox(height: 30),
            // Di dalam build method dari _HomePageState
            Align(
              alignment: Alignment(-1.0, 0.0),
              child: const Text(
                'News Today!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    author: news[index]['author']!,
                    title: news[index]['title']!,
                    content: news[index]['content']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 5.0),
          Text(label,
              style: const TextStyle(fontSize: 12.0, color: Colors.white)),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String author;
  final String title;
  final String content;

  // ignore: use_super_parameters
  const NewsCard({
    Key? key,
    required this.author,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      color: const Color(0xFF404247),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author,
                style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Text(content,
                style: TextStyle(color: Colors.grey[300]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class IconAction {
  final String imagePath;
  final String label;
  final double iconSize;
  final VoidCallback? onPressed;

  IconAction({
    required this.imagePath,
    required this.label,
    this.iconSize = 30.0,
    this.onPressed,
  });
}

Widget buildIconGrid(List<IconAction> actions) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    shrinkWrap: true,
    itemCount: actions.length,
    itemBuilder: (context, index) {
      return IconActionWidget(
        imagePath: actions[index].imagePath,
        label: actions[index].label,
        iconSize: actions[index].iconSize,
        onPressed: actions[index].onPressed,
      );
    },
  );
}

class IconActionWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final double iconSize;
  final VoidCallback? onPressed;

  // ignore: use_super_parameters
  const IconActionWidget({
    Key? key,
    required this.imagePath,
    required this.label,
    this.iconSize = 30.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: iconSize, height: iconSize),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }
}
