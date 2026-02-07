import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_add_to_cart/core/elevated_button.dart';
import 'package:task_add_to_cart/data_model/item_list.dart';
import 'package:task_add_to_cart/screens/home.dart';

import '../core/app_assets.dart';
import '../core/colors.dart';
import '../core/textStyle.dart';
import '../provider.dart';

class CartScreen extends StatefulWidget {
  static String rouatName = "cart";

  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    return Scaffold(

        appBar: AppBar(automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(onTap: () {
                Navigator.pushNamed(context, HomeScreen.routName);
              },
                  child: Icon(Icons.arrow_back, color: Appcolors.blue,)),
              Spacer(),
              Text("My Cart", style: Appstyles.blackNormal18,),
              Spacer()
            ],
          ),
          actions: [Stack(
              children: [IconButton(onPressed: () {},
                  icon: ImageIcon(AssetImage
                    (Appassets.basket), color: Appcolors.red
                    ,)),
                Positioned(top: 5, left: 5,
                  child: ClipRRect(borderRadius: BorderRadius.circular(60),
                    child: Container(
                      height: 15, width: 15, color: Appcolors.red, child:
                    Center(child: Text("${cartProvider.itemCount}",
                      style: Appstyles.whiteMedium10,)),),
                  ),
                )
              ]

          )
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: 128,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius:
                BorderRadius.circular(16), color: Colors.white),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Item Total", style: Appstyles.greyNormal16,),
                      Spacer(),
                      Text("EGP ", style: Appstyles.greyNormal16,),
                      Text("${cartProvider.totalPrice}",
                          style: Appstyles.blackNormal18),


                    ],),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(children: [
                        Text("Shipping Fee", style: Appstyles.greyNormal16,),
                        Spacer(),
                        Text("Free", style: Appstyles.blackNormal16.copyWith(
                            color: Appcolors.green),)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("Total", style: Appstyles.greyNormal16,), Spacer(),
                        Text("EGP ", style: Appstyles.greyNormal16,),
                        Text("${cartProvider.totalPrice}",
                          style: Appstyles.blackNormal18,)
                      ],),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("${cartProvider.itemCount}",
                      style: Appstyles.greyNormal16,),
                    Text("  Items", style: Appstyles.greyNormal16,)
                  ],
                ),
              ),
              Expanded(
                child: cartProvider.cartItems.isNotEmpty?ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      return Container(

                        child: Row(children: [
                          Container(width:72, height: 95,
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(16),
                            color: Appcolors.greyBGproduct,


                          ), child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(cartProvider.cartItems[index]
                                .imagePath),
                          ),

                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [Text("${cartProvider.cartItems[index].brand
                              }"
                              , style: Appstyles.blackNormal18,),
                            Text("${cartProvider.cartItems[index].name}",

                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 10,),

                            Row(children: [Text("EGP ",
                              style: Appstyles.greyNormal16,),
                            Text("${cartProvider.cartItems[index].price*cartProvider.cartItems[index].quntity}"),
                            Spacer(),

                            Container(width: 75,
                                decoration: BoxDecoration(borderRadius:
                                BorderRadius.circular(16),
                                    border: Border.all(color: Appcolors
                                        .greyborder)),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [Container(width :20,
                                decoration: BoxDecoration(borderRadius:
                                BorderRadius.circular(16),
                                color: Appcolors.greyBGproduct)
                            ,
                            child: Center(child: InkWell(onTap: (){
                              cartProvider.removeItem(cartProvider.cartItems[index]);
                            },
                                child: Text("-", style: Appstyles.greyNormal16))),),

                                                  Text("${cartProvider.cartItems[index].quntity}",
                                                  style: Appstyles.blackNormal16.copyWith(color: Appcolors.blue)),

                                      Container(width: 20,
                                        decoration: BoxDecoration(borderRadius:
                                        BorderRadius.circular(16),
                                            color: Appcolors.blue)
                                        ,
                                        child: Center(child: InkWell(onTap: (){

                                          cartProvider.addItem(cartProvider.cartItems[index]);
                                        },
                                            child: Text("+", style: Appstyles.whiteMedium18))),)
                                                  ],
                                                  ),)

                                                  ],)

                                                  ]
                                                  ,
                                                  ),
                          ),
                        )
                      ]
                      ,
                      )
                      );

                    }
                ):Text("the Cart is Empty"),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(child: CustomElevatedButton(title: "Check out", onPresed: (){})),
              )
            ],
          ),
        )

    );
  }
}
