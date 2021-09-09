import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecakecart/GoogleSheetApi/Api%20code.dart';
import 'package:thecakecart/GoogleSheetApi/Api code.dart';
import 'package:thecakecart/GoogleSheetApi/Data%20Fetching.dart';
import 'package:thecakecart/GoogleSheetApi/Data Fetching.dart';
import 'package:thecakecart/Widgets/CustomAppBar.dart';
import 'package:thecakecart/Widgets/SaleCard.dart';
import 'package:thecakecart/pages/InputForm.dart';

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
        //todo remove all the code from below function as it is only for demonstration
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return InputForm(
                onSavedUser: (user) async {
                  await AppSheetApi.insert(user.toJason());
                },
              );
            }
          ));



          // insertUsers(); //todo add this method to save button in Input form
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future insertUsers() async {
    final user = User(
      id: 1,
      name: "Shashwat",
      itemType: "cake",
      rate: "600",
    );
    await AppSheetApi.insert(user.toJason());
  }
}
