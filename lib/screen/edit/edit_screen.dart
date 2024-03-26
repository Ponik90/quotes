import 'package:flutter/material.dart';
import 'package:quotes/model/factory.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  List<Color> changecolor = [
    Colors.white,
    Colors.black,
    ...Colors.primaries,
  ];
  List<Color> changeborder = [
    Colors.white,
    Colors.black,
    ...Colors.accents,
  ];
  List<String> chagefamily = [
    "smooch",
    "tilana",
  ];
  List<String> changeImage = [
    "assets/bgimage/bg1.jpg",
    "assets/bgimage/bg2.jpg",
    "assets/bgimage/bg3.jpg",
    "assets/bgimage/bg4.jpg",
  ];

  Color textcolor = Colors.white;
  Color bgcolor = Colors.red;
  Color bordercolor = Colors.red;
  String bgimage = "assets/bgimage/bg1.jpg";
  String font = "";
  bool istext = true;
  bool isimage =true;

  @override
  Widget build(BuildContext context) {
    MaptoModel data = ModalRoute.of(context)!.settings.arguments as MaptoModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("edit"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).width,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: bgcolor,
              border: Border.all(
                color: bordercolor,
                width: 3,
              ),
            ),
            child: Stack(
              children: [
                Visibility(
                  visible:  !isimage,
                  child: Image.asset(
                    bgimage,
                    height: MediaQuery.sizeOf(context).width,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data.quotes}",
                      style: TextStyle(
                        color: textcolor,
                        fontSize: 20,
                        fontFamily: font,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "~ ${data.author}",
                        style: TextStyle(
                          color: textcolor,
                          fontSize: 20,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //text
              FloatingActionButton.extended(
                elevation: 3,
                onPressed: () {
                  setState(
                    () {
                      istext = true;
                    },
                  );
                },
                label: const Text("Text"),
                icon: const Icon(Icons.text_format_outlined),
                backgroundColor: Colors.blueAccent,
              ),
              //background
              FloatingActionButton.extended(
                elevation: 3,
                onPressed: () {
                  setState(
                    () {
                      istext = false;
                    },
                  );
                },
                label: const Text("background"),
                icon: const Icon(Icons.color_lens),
                backgroundColor: Colors.blueAccent,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: istext,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: changecolor.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                textcolor = changecolor[index];
                              },
                            );
                          },
                          child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                              color: changecolor[index],
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: chagefamily.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                font = chagefamily[index];
                              },
                            );
                          },
                          child: Container(
                            width: 80,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: Text(
                              "Hello",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: chagefamily[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !istext,
            child: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Change Background Color ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: changecolor.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  isimage=!isimage;
                                  bgcolor = changecolor[index];
                                });
                              },
                              child: Container(
                                width: 50,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: changecolor[index],
                                  border: Border.all(width: 1),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: changeImage.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  bgimage = changeImage[index];
                                });
                              },
                              child: Container(
                                width: 80,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                ),
                                child: Image.asset(
                                  changeImage[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Change Border Color ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: changeborder.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  bordercolor = changeborder[index];
                                });
                              },
                              child: Container(
                                width: 50,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: changeborder[index],
                                  border: Border.all(width: 1),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
