import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecakecart/Constants/Colors.dart';
import 'package:thecakecart/Constants/TextThemes.dart';
import 'package:thecakecart/GoogleSheetApi/Data Fetching.dart';

class SaleCard extends StatefulWidget {
  final User? user;
  const SaleCard({Key? key, this.user}) : super(key: key);

  @override
  _SaleCardState createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
  @override
  void initState() {
    super.initState();
    initUser();
  }

  @override
  void didUpdateWidget(covariant SaleCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  void initUser(){
    final name = widget.user == null ? "-" : widget.user!.name;
    final rate = widget.user == null ? "-" : widget.user!.rate;
    final itemtype = widget.user == null ? "-" : widget.user!.itemType;
    setState(() {
      demoName = name;
      demoRate = rate;
      demoItem = itemtype;
    });
  }
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        padding: EdgeInsets.all(7),
        height: height/7,
        width: width*0.88,
        decoration: BoxDecoration(
          border: Border.all(color: kSaleCardBorder, width: 1.2),
          borderRadius: BorderRadius.circular(15),
          color: kSaleCard,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(     // for display image
                flex:2,
                child: Container(
                  padding: EdgeInsets.all(3),
                  child: FittedBox(
                    //todo: Wrap this around a gesture detector to go to a diff screen with a hero Animation
                    child: CircleAvatar(
                      backgroundImage: demoCakeImage,
                    ),
                  ),
                )
            ),

            Expanded(   //For rest information
                flex:5,
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    children: [

                      Expanded(   //for name
                          flex:2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Expanded(
                                flex: 6,
                                  child: Text(
                                    demoName,
                                    overflow: TextOverflow.clip,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                              ),

                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Icon(Icons.more_vert_rounded, color: Colors.white,),//todo remove this white color when edit option is available
                                    onPressed: (){}
                                ),
                              )
                            ],
                          )
                      ),

                      Expanded(  //for rate, category and date
                          flex:3,
                          child: Container(
                            child: Row(
                              children: [

                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Item: "+demoItem,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                                          // Text(demoDate,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                        ],
                                      ),

                                    )
                                ),

                                Expanded(
                                    flex:1,
                                    child: Container(
                                      child: Center(
                                        child: Text(demoRate+ "/-", style: TextStyle(fontSize: 24, color: Colors.green),),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )
                      ),

                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}