import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lv_one/controller/cart_controller.dart';
import 'package:lv_one/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  final ScrollController controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Scrollbar(
        controller: controllerOne,
        thumbVisibility: true,
        child: Column(  // Column 위젯 내에서 ListView 위젯을 불러왔을 때 반드시 Expanded 위젯으로 감싸주어야 한다.
          children: [
            Expanded(
                child: GetX<ShoppingController>(builder: (controller){
                  return ListView.builder(
                    controller: controllerOne,
                    itemCount: controller.products.length,
                    itemBuilder: (context, index){
                      return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.products[index].productName,
                                              style: const TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                                controller.products[index].productDescription
                                            ),
                                          ],
                                        ),
                                        Text(
                                            '${controller.products[index].price}',
                                            style: const TextStyle(fontSize: 24)
                                        )
                                      ]
                                  ),
                                  ElevatedButton(
                                      onPressed: (){
                                        cartController.addToItem(controller.products[index]);
                                      },
                                      child: const Text('Add to cart')
                                  )
                                ],
                              )
                          )
                      );
                    },
                  );
                }
                )
            ),
            const SizedBox(
              height: 30,
            ),
            GetX<CartController>(
                builder: (controller){
                  return Text(
                    'Total mount: \$ ${controller.totalPrice}',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  );
                }
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: GetX<CartController>(
            builder: (controller){
              return  Text(
                cartController.count.toString(),
                style: const TextStyle(
                    fontSize: 20
                ),
              );
            },
          ),
          icon: Icon(Icons.add_shopping_cart_rounded),
          backgroundColor: Colors.black87
      ),
    );
  }
}
