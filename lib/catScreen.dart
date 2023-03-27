import 'package:flutter/material.dart';
import 'package:amhs/categoryDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:amhs/dimensions.dart';
import 'package:amhs/cardButton.dart';
import 'package:provider/provider.dart';

class CatScreen extends StatefulWidget {
  final int indexNum;
  final int listNum;
  CatScreen({required this.indexNum, required this.listNum, super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
//   @override
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
            //hintText: (identifier.contains(weight)?(widget.indexNum<=3)?"Weight should be less than 10Kg":(widget.indexNum>=4&&widget.indexNum<=6)?"Weight should be less than 20Kg":"Weight should be less than 30kg":""),
            labelText: text,
            labelStyle: const TextStyle(fontSize: 30)),
        onChanged: (var value) {
          switch (identifier) {
            case 'Id':
              Id = value;
              //print('Value =$Id');
              break;
            case 'name':
              name = value;
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
    // final controller = Get.put(ContainerValue());
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Images/Picture 2.png',
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
                  // textfield('WEIGHT', 'weight', TextInputType.number),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: (widget.indexNum <= 2)
                              ? "Weight should be less than 10 Kgs"
                              : (widget.indexNum <= 5)
                                  ? "Weight should be less than 20 Kgs"
                                  : "Weight should be less than 30 Kgs",
                          labelText: "WEIGHT",
                          labelStyle: const TextStyle(fontSize: 30)),
                      onChanged: (var value) {
                        weight = value;
                      },
                    ),
                  ),
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
                          //Navigator.pop(context,true);
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
                          //Provider.of<Ctainer>(context,listen: false).create(widget.listNum,widget.indexNum);
                          container[widget.listNum - 1].add(
                            CardButton(id: widget.indexNum),
                          );
                          print("Hai");
                          if (Id.isEmpty ||
                              name.isEmpty ||
                              weight.isEmpty ||
                              cost.isEmpty ||
                              location.isEmpty) {
                            if (!await launchUrl(
                              Uri.parse(
                                'https://project-amhs.w3spaces.com/psg.html',
                              ),
                              mode: LaunchMode.platformDefault,
                            )) ;
                          } else {
                            print("setstate");
                            setState(() {
                              // container[widget.listNum - 1].add(
                              //   CardButton(id: widget.indexNum),
                              // );

                              catDetails.add(CategoryDetails());
                            });

                            catName[widget.listNum - 1].add(name);
                            catDetails[widget.indexNum].catID = int.parse(Id);
                            catDetails[widget.indexNum].catName = name;
                            catDetails[widget.indexNum].weight =
                                int.parse(weight);
                            catDetails[widget.indexNum].cost = int.parse(cost);
                            catDetails[widget.indexNum].location = location;
                            // setState(() {
                            //   //container[widget.listNum-1].add(CardButton(id: widget.indexNum));
                            //   print(container[widget.listNum - 1]);
                            // });
                            //Navigator.pop(context);
                            if (widget.indexNum <= 2 &&
                                catDetails[widget.indexNum].weight > 10) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          "Weight value cannot exceed 10 Kg"),
                                    );
                                  });
                            } else if (widget.indexNum <= 5 &&
                                catDetails[widget.indexNum].weight > 20) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          "Weight value cannot exceed 20 Kg"),
                                    );
                                  });
                            } else if (widget.indexNum <= 8 &&
                                catDetails[widget.indexNum].weight > 30) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          "Weight value cannot exceed 30 Kg"),
                                    );
                                  });
                            } else {
                              if (!await launchUrl(
                                Uri.parse(
                                  'https://project-amhs.w3spaces.com/psg.html',
                                ),
                                mode: LaunchMode.platformDefault,
                              )) {
                                print('hai');
                                print("Could not launch");
                              }
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
