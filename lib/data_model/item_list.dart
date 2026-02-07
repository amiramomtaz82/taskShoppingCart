import 'package:task_add_to_cart/core/app_assets.dart';

class ItemDM {
  String name;
  String? brand;
  String imagePath;
  double price;

  String rating;
  String review;
  int quntity;

  ItemDM ({required this.imagePath,required this.name,required this.price,this.rating="4.5",this.review="(132 views),",this.brand,this.quntity=1});


}


List <ItemDM> products=[
  
  ItemDM(imagePath: Appassets.tv, name:"Samsung 65-Inch Neo QLED 4K Smart TV QA6...", price: 32899,rating: "4.5",review: "(132 views)",brand: "Samsung",quntity: 0),
  ItemDM(imagePath:Appassets.tablet , name: "Apple 2025 MacBook Air 13-inch Laptop with....", price: 51000,rating: "4.5",review: "(132 views)",brand:"Appel",quntity: 0),
  ItemDM(imagePath:Appassets.watch , name: "POLAR Ignite 3 GPS Smartwatch iPhone ....", price:19500,rating: "4.5",review: "(132 views)",brand: "Polar",quntity: 0),
  ItemDM(imagePath:Appassets.headPhone , name: "Soundcore by Anker Life Q30 Hybrid Active Noise...", price: 3950,rating: "4.5",review: "(132 views)",brand: "Anker",quntity: 0),
  ItemDM(imagePath: Appassets.mobile, name: "HONOR 400 5G Smartphone, 200MP AI ....", price: 21999,rating: "4.5",review: "(132 views)",brand: "Honor",quntity: 0),
  ItemDM(imagePath:Appassets.speaker, name: "JBL Go 4 Portable Bluetooth Speaker with I...", price: 1890,rating: "4.5",review: "(132 views)",brand:"JBL",quntity: 0 )
];

