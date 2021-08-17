import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trip/model/home_model.dart';
import 'package:trip/server/home_dao.dart';
const APPBAR_SCROLL_OFFSET=100;
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List _imageUrl = [
    'https://img0.baidu.com/it/u=3626606771,843873389&fm=26&fmt=auto&gp=0.jpg',
    'https://img2.baidu.com/it/u=2607255287,1368180282&fm=26&fmt=auto&gp=0.jpg',
    'https://img0.baidu.com/it/u=3231005548,635944634&fm=26&fmt=auto&gp=0.jpg'
  ];
  double appBarAlpha = 0;
  String resultString='';
  @override
  void initState(){
    super.initState();
    loadData();
  }
  _onScroll(offset) {
    print(offset);
    double alpha=offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
      appBarAlpha=alpha;
    });
    print(appBarAlpha);
  }
  loadData() async{
  // HomeDao.fetch().then((result){
  //   setState(() {
  //     resultString=json.encode(result);
  //   });
  // }).catchError((e){
  //   resultString=e.toString();
  // });
    try{
      HomeModel model=await HomeDao.fetch();
      setState(() {
        resultString=json.encode(model.config);
      });
    }catch(e){
      setState(() {
        resultString=e.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
          //此处为了适配iphone以及android顶部渲染的问题，移除最顶部的padding值。
          removeTop: true,
          context: context,
          child: NotificationListener<ScrollNotification>(
            // ignore: non_constant_identifier_names

            onNotification: (scrollNotification) {
              // print(scrollNotification); // Error can be noticed with this line
              // return true; // needed to return bool. does not change result
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                _onScroll(scrollNotification.metrics.pixels);
              }
              return true;
            },
            child: ListView(
              children: <Widget>[
                Container(
                  height: 160,
                  child: Swiper(
                    itemCount: _imageUrl.length,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(_imageUrl[index], fit: BoxFit.fill);
                    },
                    pagination: SwiperPagination(),
                  ),
                ),
                Container(
                  height: 800,
                  child: ListTile(
                    title: Text("haha"),
                  ),
                )
              ],
            ),
          ),
        ),
        Opacity(opacity: appBarAlpha,
        child: Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("首页"),
            ),
          ),
        ),)
      ],
    ));
  }
}
