import 'package:flutter/material.dart';
import 'package:easy_animated_tabbar/easy_animated_tabbar.dart';
import 'package:thecakecart/GoogleSheetApi/Data%20Fetching.dart';

class InputForm extends StatefulWidget {

  final ValueChanged<User> onSavedUser;

  const InputForm({
    Key? key,
    required this.onSavedUser,
  }) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  var itemTypeList = ["Cake","CupCake","Hamper" ];

  late TextEditingController controllerName;
  late TextEditingController controllerRate;
  late int itemTypeIndex;

  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController();
    controllerRate = TextEditingController();
    itemTypeIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Add Purchaser", style: TextStyle(fontSize: 25),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      "NAME",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: controllerName,

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25
                      ),

                      cursorColor: Colors.black,
                      cursorRadius: Radius.circular(5),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),

                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 2),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ), //for name

                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                        "ITEM TYPE",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  EasyAnimatedTab(
                      buttonTitles: ["Cake", "CupCake", "Hamper"],
                      onSelected:(index){
                        itemTypeIndex = index;
                        print(itemTypeIndex);
                      },
                    minWidthOfItem:80,

                    animationDuration: 0,
                    activeTextStyle: TextStyle(
                      fontSize: 19
                    ),
                    deActiveTextStyle: TextStyle(
                        fontSize: 19
                    ),),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      "RATE",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: controllerRate,
                      keyboardType: TextInputType.number,

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25
                      ),

                      cursorColor: Colors.black,
                      cursorRadius: Radius.circular(5),

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),

                        hintText: "Rate",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 2),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                          child: Text("Done", style: TextStyle(color: Colors.black, fontSize: 25),),
                          onPressed: (){

                          final user = User(
                            name: controllerName.text,
                            rate: controllerRate.text,
                            itemType: itemTypeList[itemTypeIndex],
                          );
                          widget.onSavedUser(user);
                          Navigator.pop(context);

                          },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
