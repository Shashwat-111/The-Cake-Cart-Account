import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecakecart/Widgets/CustomAppBar.dart';
import 'package:thecakecart/Widgets/SaleCard.dart';

class ItemsSold extends StatefulWidget {
  const ItemsSold({Key? key}) : super(key: key);

  @override
  _ItemsSoldState createState() => _ItemsSoldState();
}

class _ItemsSoldState extends State<ItemsSold> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: List.generate(10, (index){
              return SaleCard();
            })
          ),
        ),
      ),

      appBar: CustomAppBar(),

      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
