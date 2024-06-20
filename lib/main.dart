import 'package:flutter/material.dart';
import 'package:uas_perangkat_bergerak/produk_list_screen.dart';
import 'package:uas_perangkat_bergerak/perusahaan_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App List',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              _buildStyledText('G', Colors.red),
              _buildStyledText('O', Colors.orange),
              _buildStyledText('W', Color.fromARGB(222, 237, 128, 56)),
              _buildStyledText('o', Colors.green),
              _buildStyledText('r', Colors.blue),
              _buildStyledText('k', Colors.indigo),
              _buildStyledText('s', Color.fromARGB(236, 249, 75, 0)),
              _buildStyledText('!', Colors.pink),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selamat Datang di GoWorks!',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 30),
              _buildAnimatedCard(
                icon: Icons.person,
                text: 'List Pelamar',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProdukListScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildAnimatedCard(
                icon: Icons.business,
                text: 'List Perusahaan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PerusahaanListScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildStyledText(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: color,
      ),
    );
  }

  Widget _buildAnimatedCard(
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.orangeAccent.withAlpha(30),
        child: Container(
          height: 80,
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(icon, color: Colors.orangeAccent, size: 40),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.orangeAccent),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
