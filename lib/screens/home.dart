import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_add_to_cart/core/app_assets.dart';
import 'package:task_add_to_cart/core/card_widget.dart';
import 'package:task_add_to_cart/core/colors.dart';
import 'package:task_add_to_cart/core/elevated_button.dart';
import 'package:task_add_to_cart/core/textStyle.dart';
import 'package:task_add_to_cart/provider.dart';

import '../data_model/item_list.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routName="home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of(context);
    return Scaffold(
      backgroundColor: Appcolors.cardBG,
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Image.asset(Appassets.logo),
        actions: [Stack(
            children: [IconButton(onPressed: () {
              Navigator.pushNamed(context, CartScreen.rouatName);
            },
                icon: ImageIcon(AssetImage
                  (Appassets.basket), color: Appcolors.red
                  ,)),
              Positioned(top: 5, left: 5,
                child: ClipRRect(borderRadius: BorderRadius.circular(60),
                  child: Container(
                    height: 15, width: 15, color: Appcolors.red, child:
                  Center(child: Text("${cartProvider.itemCount}", style: Appstyles.whiteMedium10,)),),
                ),
              )
            ]

        )
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recommendations", style:
            Appstyles.blackNormal18,),
            SizedBox(height: 10,),

            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                    (crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,),

                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CardWidget(item: products[index]);
                  }),
            )
          ],

        ),
      ),
    );
  }

}
