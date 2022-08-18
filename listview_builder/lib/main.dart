import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage()
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final titleList = [
    'Dentist',
    'Pharmacist',
    'School teacher',
    'IT manager',
    'Account',
    'Lawyer',
    'Web developer'
  ];

  final imageList = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png',
    'images/5.png',
    'images/6.png',
    'images/7.png'
  ];

  final description = [
    '1. There are different types of careers you can pursue in your life.',
    '2. There are different types of careers you can pursue in your life. ',
    '3. There are different types of careers you can pursue in your life. ',
    '4. There are different types of careers you can pursue in your life. ',
    '5. There are different types of careers you can pursue in your life. ',
    '6. There are different types of careers you can pursue in your life. ',
    '7. There are different types of careers you can pursue in your life. '
  ];

  void showPopup(context, title, image, description){
    showDialog(
        context: context,
        builder: (context)
    {
      return Dialog(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                          description,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500]
                          ),
                          textAlign: TextAlign.center
                      )
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('close')
                  )
                ],
              )
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              debugPrint(titleList[index]);
              showPopup(context, titleList[index], imageList[index], description[index]);
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index])
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(titleList[index],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            description[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500]
                            )
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            ),
          );
        },
      )
    );
  }
}
