import 'package:flutter/material.dart';
import 'package:thecakecart/Constants/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: kAppBarBackground,
      elevation: 5,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)
        ),
      ),


      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
            height: 40,
            child: TextFormField(

              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 27,
              ),

              cursorColor: kAppBarCursorColor,
              cursorHeight: 30,

              decoration: InputDecoration(

                prefixIcon: Icon(Icons.search,color: kAppBarSearchIcon,),

                hintText: "Search",
                hintStyle: TextStyle(color: kAppBarHintText, fontSize: 27),
                contentPadding: EdgeInsets.all(2),


                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 2)
                ),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(width: 2),

                ),
              ),
            ),
          ),

          IconButton(
              icon: Icon(
                Icons.sort_sharp,
                color: kAppBarSortIcon,
                size: 30,
              ),
              onPressed: (){
                //todo: implement sort functionality
              })
        ],
      ),




    );
  }
}

