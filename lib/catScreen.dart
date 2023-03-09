import 'package:flutter/material.dart';
import 'package:amhs/categoryDetails.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Widget textfield(String text, String identifier) {
    return SizedBox(
      width: 120,
      child: TextFormField(
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
            padding: const EdgeInsets.fromLTRB(400, 240, 350, 250),
            child: SizedBox(
              width: 400,
              height: 800,
              child: ListView(
                shrinkWrap: true,
                children: [
                  textfield('CATEGORY ID', 'Id'),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('CATEGORY NAME', 'name'),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('WEIGHT', 'weight'),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('COST', 'cost'),
                  const SizedBox(
                    height: 30,
                  ),
                  textfield('LOCATION', 'location'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          //container.remove(widget.listNum);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "BACK",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (Id.isEmpty ||
                              name.isEmpty ||
                              weight.isEmpty ||
                              cost.isEmpty ||
                              location.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('Error'),
                                  content: Text("Values cannot be empty!"),
                                );
                              },
                            );
                          } else {
                            setState(() {
                              catDetails.add(CategoryDetails());
                            });

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
                                'https://google.com',
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
