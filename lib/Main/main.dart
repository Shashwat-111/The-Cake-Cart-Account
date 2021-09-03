import 'package:flutter/material.dart';
import 'package:thecakecart/Constants/Colors.dart';
import 'package:thecakecart/pages/ItemsPurchased.dart';
import 'package:thecakecart/pages/ListOfItemsSold.dart';
import 'package:thecakecart/pages/stats.dart';

void main() {
  runApp(
      MaterialApp(
        title: "Cake Cart Account",
        debugShowCheckedModeBanner: false,
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  var pages = [
    ItemsSold(),
    ItemPurchased(),
    Stats(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: kSelectedIconColor,
          backgroundColor: kBottomBarBackground,
          elevation: 2,
          items: [
            BottomNavigationBarItem(
                label: "Item Sold",
                icon: Icon(Icons.search_rounded,size: (_currentIndex == 0) ? 25.0 : 20.0,)
            ),
            BottomNavigationBarItem(
                label: "Items Bought",
                icon: Icon(Icons.cake_outlined,size: (_currentIndex == 1) ? 25.0 : 20.0,)
            ),
            BottomNavigationBarItem(
                label: "Statistics",
                icon: Icon(Icons.stacked_bar_chart,size: (_currentIndex == 2) ? 25.0 : 20.0,)
            ),
          ],
        ),
      ),
    );
  }
}
