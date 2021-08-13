import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('首页'),
      )
    );
  }
}
