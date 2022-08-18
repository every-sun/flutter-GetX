import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lv_two/controller/controller.dart';
import 'package:lv_two/view/product_tile.dart';

class MyPage extends StatelessWidget{
  MyPage({Key? key}): super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Obx(() => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
            ),
            itemBuilder: (context, index){
              return ProductTile(
                controller.productList[index],
              );
            },
            itemCount: controller.productList.length,
          )
          )
        )
      )
    );
  }
}