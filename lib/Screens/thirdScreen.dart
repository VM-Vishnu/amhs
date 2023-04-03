import 'package:amhs/Details/customDelegate.dart';
import 'package:flutter/material.dart';
import 'package:amhs/Details/dimensions.dart';
import 'package:amhs/Details/categoryDetails.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatefulWidget {
  final int listNum;
  final bool value;
  const ThirdPage({required this.listNum, required this.value, super.key});
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();

    if (widget.value) {
      color[widget.listNum - 1] = List.filled(
          d[widget.listNum - 1].col * d[widget.listNum - 1].row, Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Images/Picture 3.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: width * 0.01, horizontal: height * 0.02),
                  child: Text(
                    d[widget.listNum - 1].name,
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              SizedBox(
                height: height * 0.96,
                width: width * 0.5,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.19,
                      left: width * 0.02,
                      right: width * 0.04),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisSpacing: 100,
                              mainAxisSpacing: 30,
                              crossAxisCount: 3),
                      itemCount:
                          d[widget.listNum - 1].row * d[widget.listNum - 1].col,
                      itemBuilder: (BuildContext context, index) {
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              if (color[widget.listNum - 1][index] ==
                                  Colors.green) {
                                color[widget.listNum - 1][index] = Colors.red;
                              } else {
                                color[widget.listNum - 1][index] = Colors.green;
                              }
                            });
                            Navigator.pushNamed(
                              context,
                              '/catScreen',
                              arguments: {
                                'indexNum': index,
                                'listNum': widget.listNum
                              },
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                color[widget.listNum - 1][index]),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.16,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 80),
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: CustomDelegate(
                              intIndex: widget.listNum,
                            ),
                          );
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      width: 230,
                      child: Consumer(
                        builder: (context, value, child) {
                          return ListView(
                            shrinkWrap: true,
                            children:
                                Provider.of<Ctainer>(context, listen: true)
                                    .container[widget.listNum - 1],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
