import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecakecart/Constants/Colors.dart';
import 'package:thecakecart/Constants/TextThemes.dart';

class SaleCard extends StatefulWidget {
  const SaleCard({Key? key}) : super(key: key);

  @override
  _SaleCardState createState() => _SaleCardState();
}

class _SaleCardState extends State<SaleCard> {
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
                    //todo: Wrap this around a gesture detector to go to a diff screen
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
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                              ),

                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Icon(Icons.more_vert_rounded),
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
                                          Text(demoItem,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                          Text(demoDate,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                        ],
                                      ),

                                    )
                                ),

                                Expanded(
                                    flex:1,
                                    child: Container(
                                      child: Center(
                                        child: Text(demoRate, style: TextStyle(fontSize: 25, color: Colors.green),),
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






























// Padding(
// padding: const EdgeInsets.all(12),
// child: Container(
// height: 120,
// width: double.infinity,
// decoration: BoxDecoration(
// border: Border.fromBorderSide(BorderSide(width: 2)),
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)
// ),
// child: Row(
// children: [
// SizedBox(width: 10),
// Expanded(
// flex: 1,
// child: CircleAvatar(
// backgroundImage: NetworkImage("https://media.istockphoto.com/photos/fresh-fruit-cream-cake-picture-id1218487059"),
// radius: 40,
// backgroundColor: Colors.redAccent,
// ),
// ),
// SizedBox(width: 15,),
// Expanded(
// flex: 3,
// child: Container(
// child: Stack(
// alignment: AlignmentDirectional.bottomEnd,
// children: [
// Container(
// padding: EdgeInsets.only(right: 0),
// width: double.infinity,
// child:Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Shashwat Dubey", style: TextStyle(fontSize: 28),),
// Text("Cake", style: TextStyle(fontSize: 20),),
// Text("1st Feb 2021", style: TextStyle(fontSize: 22),)
// ],
// ),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)
// ),
//
// ),
// Container(
// child: Center(
// child: Text("4000/-", style: TextStyle(fontSize: 30),),
// ),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)
// ),
// height: 75,
// width: 110,
//
// )
// ],
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// SizedBox(height: 10,),
// IconButton(
// onPressed: (){
// print("hi");
// },
// icon : Icon(Icons.more_vert_rounded, color: Colors.black,)),
// ],
// ),
// )
// ],
//
// ),
//
// ),
// );