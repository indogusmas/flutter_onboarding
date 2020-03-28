import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutteronboarding/data.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App OnBoarding",
      home: Home() ,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    slides = getSlide();
  }
  
  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0: 6.0,
      width:  isCurrentPage ? 10.0: 6.0,
      decoration: BoxDecoration(
        color:  isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView.builder(
        controller: pageController ,
        itemCount: slides.length,
          onPageChanged: (val){
          setState(() {
            currentIndex = val;
          });
          },
          itemBuilder: (context, index){
          return SliderTitle(
            imageAssets: slides[index].getImagepath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
          }),
      bottomSheet: currentIndex != slides.length-1 ? Container(
        height: Platform.isIOS ? 70: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                pageController.animateToPage(slides.length-1, duration: Duration(microseconds: 400), curve: Curves.linear);
              },
              child: Text("SKIP"),
            ),
            Row(
              children: <Widget>[
                for(int i = 0; i< slides.length;i++)
                  currentIndex == i ? pageIndexIndicator(true): pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: (){
                pageController.animateToPage(currentIndex+1, duration: Duration(microseconds: 400), curve: Curves.linear);
              },
              child: Text("NEXT"),
            )
          ],
        ),

      ): Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: Platform.isIOS ? 70: 60,
         color: Colors.blue,
        child: Text("GET STARTED NOW",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),),
      ),
    );
  }


}


class SliderTitle extends StatelessWidget{

  String imageAssets, title, desc;
  SliderTitle({this.imageAssets, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageAssets),
            SizedBox(height: 20),
            Text(title,style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 12),
            Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }

}
















