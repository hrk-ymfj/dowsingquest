import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ダウジング クエスト',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          background: Color(0xFF6B533A),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF6B533A), // AppBarの背景色を指定
        ),
      ),
      home: TopPage(),
    );
  }
}

// トップ画面用Widget
class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6B533A),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuPage()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("ダウジング クエスト"),
              Image(image: AssetImage('assets/app_logo.png')),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.6; // ページ全体の60%
    final cardHeight = cardWidth * 9 / 16; // カードの高さを横:縦＝16:9に設定

    return Scaffold(
      appBar: AppBar(
        title: Text('ダウジング クエスト'),
      ),
      body: Center(
        child: Container(
          // スクロール可能なリストを包むContainer
          width: cardWidth, // リストの幅を設定
          child: ListView(
            // スクロール可能なリスト
            padding: EdgeInsets.all(16.0),
            children: [
              buildCardWithIcon(
                cardWidth,
                cardHeight,
                Icons.lock, // アイコンを指定
                '宝箱を隠す',
              ),
              buildCardWithIcon(
                cardWidth,
                cardHeight,
                Icons.search, // アイコンを指定
                '宝箱を探す',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardWithIcon(
      double cardWidth, double cardHeight, IconData icon, String text) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48, // アイコンのサイズを調整
              ),
              SizedBox(height: 16), // アイコンとテキストの間隔を設定
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
