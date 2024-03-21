import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes/model/factory.dart';

import '../../utilies/global_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isgrid = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    g1.create();


    Future.delayed(
      const Duration(seconds: 1),
      () {
        splash();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        {
          exitScreen();
        }
      },
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
            IconButton(
              onPressed: () {
                setState(
                  () {
                    isgrid = !isgrid;
                  },
                );
              },
              icon: Icon(
                isgrid ? Icons.grid_3x3 : Icons.list,
              ),
            )
          ],
        ),
        body: isgrid
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: g1.quotes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      MaptoModel data = g1.quotes[index];
                      Navigator.pushNamed(context, 'edit',arguments: data);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
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
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "author : ${g1.quotes[index].author}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: g1.quotes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      MaptoModel data = g1.quotes[index];
                      Navigator.pushNamed(context, 'edit',arguments: data);
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "author : ${g1.quotes[index].author}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void exitScreen() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black45,
          title: const Text(
            textAlign: TextAlign.center,
            "Sure to Exit!!",
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    exit(0);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 3,
                        color: Colors.red,
                      ),
                    ),
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 3,
                        color: Colors.red,
                      ),
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void splash ()
  {
    var rng =Random();


   // print(rng.nextInt(g1.quotes.length),);

    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          title: Text("${rng.nextInt(g1.quotes.length)}"),
        );
      },
    );
  }
}
