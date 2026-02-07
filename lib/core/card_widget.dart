import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_add_to_cart/core/colors.dart';
import 'package:task_add_to_cart/core/textStyle.dart';
import 'package:task_add_to_cart/data_model/item_list.dart';
import 'package:task_add_to_cart/screens/cart_screen.dart';

import '../provider.dart';
import 'elevated_button.dart';

class CardWidget extends StatefulWidget {
  ItemDM item;

 CardWidget({Key? key,required this.item}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of(context);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(children: [
          Container(
              width:160,height:114 ,

              decoration: BoxDecoration(
                color: Appcolors.greyBGproduct,

                borderRadius: BorderRadius.circular(16),),

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(widget.item.imagePath),
              )),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.item.name,
              style: Appstyles.blackNormal12,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [Icon(Icons.star, color: Appcolors.yellow,),
                  SizedBox(width: 3,),
                  Text(widget.item.rating,style: Appstyles.greyNormal10,),
                  SizedBox(width: 3,),
                  Text(widget.item.review,style: Appstyles.greyNormal10,),

                ],),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${widget.item.price}", style: Appstyles.blackboldl12,
                ),Spacer(),InkWell(onTap: (){
                  cartProvider.addItem(widget.item);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) => build_bottomBarContainer()
                  );
                }
                    ,
                    child: Image.asset("assets/images/Button.png"))
              ],
            ),
          )
        ])
    );

  }

  Widget  build_bottomBarContainer(){

    return Container(height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Text("${widget.item.name}",style: Appstyles.blackNormal16,),
        Row(
          children: [
            Text("Added to tha card",style: Appstyles.greyNormal12,),
            Image.asset("assets/images/check mark.png"),
          ],
        ),SizedBox(height: 20,),

        CustomElevatedButton(title: "View Cart", onPresed: (){

          Navigator.pushNamed(context, CartScreen.rouatName);
        }),SizedBox(height: 20,),
        CustomElevatedButton(titleColor:Appcolors.blue,title: "Continue shopping",
            backGroundColor: Appcolors.cardBG,
            onPresed: (){
          Navigator.pop(context);
            })
            ],),
      ),);
  }
}
