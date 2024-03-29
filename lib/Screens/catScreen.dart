import 'package:flutter/material.dart';
import 'package:amhs/Details/categoryDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:amhs/Details/dimensions.dart';
import 'package:provider/provider.dart';

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
            labelText: text, labelStyle: const TextStyle(fontSize: 30)),
        onChanged: (var value) {
          switch (identifier) {
            case 'Id':
              Id = value;

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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.16, horizontal: width * 0.31),
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.36,
                  height: height * 0.6,
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
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
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
                        if (Id.isEmpty ||
                            name.isEmpty ||
                            weight.isEmpty ||
                            cost.isEmpty ||
                            location.isEmpty) {
                          if (!await launchUrl(
                            Uri.parse(
                              'https://am-19guv72dz-vmvishnuvpty-gmailcom.vercel.app/',
                            ),
                            mode: LaunchMode.externalApplication,
                          )) {}
                        } else {
                          setState(() {
                            catDetails[widget.listNum - 1]
                                .add(CategoryDetails());
                          });

                          catName[widget.listNum - 1].add(name);
                          catDetails[widget.listNum - 1][widget.indexNum]
                              .catID = int.parse(Id);
                          catDetails[widget.listNum - 1][widget.indexNum]
                              .catName = name;
                          catDetails[widget.listNum - 1][widget.indexNum]
                              .weight = int.parse(weight);
                          catDetails[widget.listNum - 1][widget.indexNum].cost =
                              int.parse(cost);
                          catDetails[widget.listNum - 1][widget.indexNum]
                              .location = location;

                          if (widget.indexNum <= 2 &&
                              catDetails[widget.listNum - 1][widget.indexNum]
                                      .weight >
                                  10) {
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
                              catDetails[widget.listNum - 1][widget.indexNum]
                                      .weight >
                                  20) {
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
                              catDetails[widget.listNum - 1][widget.indexNum]
                                      .weight >
                                  30) {
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
                            Provider.of<Ctainer>(context, listen: false)
                                .create(widget.listNum, widget.indexNum);
                            if (!await launchUrl(
                              Uri.parse(
                                'https://am-19guv72dz-vmvishnuvpty-gmailcom.vercel.app/',
                                //'https://amhs-psg.w3spaces.com'
                              ),
                              mode: LaunchMode.externalApplication,
                            )) {}
                          }
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
      ],
    );
  }
}
