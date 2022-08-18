import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89dad0)
              ),
              child: Center(
                  child: Obx(
                    ()=> Text(
                      'Name : ${controller.person().name}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                )
              )
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF89dad0)
              ),
              child: Center(
                child: Obx(
                    ()=>Text(
                      'Age: ${controller.person().age}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF89dad0)
              ),
              child: const Center(
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.updateInfo();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      )
    );
  }
}
