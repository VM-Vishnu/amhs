import 'package:flutter/material.dart';
import 'package:amhs/categoryDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:amhs/dimensions.dart';
import 'package:amhs/cardButton.dart';

class CatScreen extends StatefulWidget {
  final int indexNum;
  final int listNum;
  const CatScreen({required this.indexNum, required this.listNum, super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  String Id = "";
  String name = "";
  String weight = "";
  String cost = "";
  String location = "";
  Widget textfield(String text, String identifier, TextInputType type) {
    return SizedBox(
      width: 120,
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
            labelText: text, labelStyle: TextStyle(fontSize: 30)),
        onChanged: (var value) {
          switch (identifier) {
            case 'Id':
              Id = value;
              //print('Value =$Id');
              break;
            case 'name':
              name = value;
              break;
            case 'weight':
              weight = value;
              break;
            case 'cost':
              cost = value;
              break;
            case 'location':
              location = value;
              break;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Images/Picture 4.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.16, horizontal: width * 0.31),
            child: SizedBox(
              width: width * 0.29,
              height: height * 0.60,
              child: ListView(
                shrinkWrap: true,
                children: [
                  textfield('CATEGORY ID', 'Id', TextInputType.number),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('CATEGORY NAME', 'name', TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('WEIGHT', 'weight', TextInputType.number),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('COST', 'cost', TextInputType.number),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('LOCATION', 'location', TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                         

                          // if (Id.isEmpty ||
                          //     name.isEmpty ||
                          //     weight.isEmpty ||
                          //     cost.isEmpty ||
                          //     location.isEmpty) {
                          //   // container.remove(widget.listNum);
                          //   print('B' + '${container.length}');
                          //   //container.removeLast();
                          //   //container.removeAt(widget.indexNum);
                          //   print('A' + '${container.length}');
                          // }
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "BACK",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      TextButton(
                        onPressed: () async {
                           setState(() {
                            container[widget.listNum - 1].add(
                              CardButton(id: widget.indexNum),
                            );
                          });
                          if (Id.isEmpty ||
                              name.isEmpty ||
                              weight.isEmpty ||
                              cost.isEmpty ||
                              location.isEmpty) {
                            if (!await launchUrl(
                              Uri.parse(
                                'https://amhs.w3spaces.com/psg.html',
                              ),
                              mode: LaunchMode.platformDefault,
                            )) ;
                          } else {
                            setState(() {
                              catDetails.add(CategoryDetails());
                            });
                            catName[widget.listNum-1].add(name);
                            catDetails[widget.indexNum].catID = int.parse(Id);
                            catDetails[widget.indexNum].catName = name;
                            catDetails[widget.indexNum].weight =
                                int.parse(weight);
                            catDetails[widget.indexNum].cost = int.parse(cost);
                            catDetails[widget.indexNum].location = location;
                            setState(() {
                              //container[widget.listNum-1].add(CardButton(id: widget.indexNum));
                              print(container[widget.listNum - 1]);
                            });
                            //Navigator.pop(context);

                            if (!await launchUrl(
                              Uri.parse(
                                'https://amhs.w3spaces.com/psg.html',
                              ),
                              mode: LaunchMode.platformDefault,
                            )) {
                              print('hai');
                              print("Could not launch");
                            }
                            //await launchUrl(Uri.parse('www.google.com'))
                          }
                        },
                        child: const Text(
                          "NEXT",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
