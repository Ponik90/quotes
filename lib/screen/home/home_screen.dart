import 'package:flutter/material.dart';

import '../../utilies/global_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    g1.create();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quotes List",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              showDialog(context: context, builder: (context) => const AlertDialog(title: Text("hello"),),barrierDismissible: false);
            }, icon: const Icon(Icons.add,),),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              g1.quotes.length,
              (index) => Center(
                child: Container(
                  height: 150,
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.red,
                      width: 4,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${g1.quotes[index].quotes}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "author : ${g1.quotes[index].author}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
