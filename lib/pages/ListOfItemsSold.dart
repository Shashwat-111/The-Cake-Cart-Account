import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecakecart/GoogleSheetApi/Api%20code.dart';
import 'package:thecakecart/GoogleSheetApi/Api code.dart';
import 'package:thecakecart/Widgets/CustomAppBar.dart';
import 'package:thecakecart/Widgets/SaleCard.dart';
import 'package:thecakecart/pages/InputForm.dart';
import 'package:thecakecart/GoogleSheetApi/Data Fetching.dart';

class ItemsSold extends StatefulWidget {
  const ItemsSold({Key? key}) : super(key: key);

  @override
  _ItemsSoldState createState() => _ItemsSoldState();
}

class _ItemsSoldState extends State<ItemsSold> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future getUser() async {
    final users = await AppSheetApi.getAll();

    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: List.generate(users.length, (index){
              return SaleCard(
                user : users[index]
              );
            })
          ),
        ),
      ),

      appBar: CustomAppBar(),

      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return InputForm(
                onSavedUser: (user) async {
                  final id = await AppSheetApi.getRowCount() + 1;
                  final newUser = user.copy(id:id);
                  await AppSheetApi.insert(newUser.toJson());
                },
              );
            }
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
