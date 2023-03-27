import 'package:amhs/customDelegate.dart';
import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:amhs/categoryDetails.dart';

class ThirdPage extends StatefulWidget {
  final int index;
  final bool value;
  const ThirdPage({required this.index, required this.value, super.key});
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();
    print(value);
    if (widget.value) {
      print('Widget index ' + '${widget.index - 1}');

      color[widget.index - 1] = List.filled(
          d[widget.index - 1].col * d[widget.index - 1].row, Colors.green);
      print(color[widget.index - 1][0]);
    }
    //startAutoReload();
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
                    d[widget.index - 1].name,
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              ),
              // Container(
              // ),
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
                              childAspectRatio: 0.99,
                              crossAxisSpacing: 95,
                              mainAxisSpacing: 40,
                              crossAxisCount: 3),
                      itemCount:
                          d[widget.index - 1].row * d[widget.index - 1].col,
                      itemBuilder: (BuildContext context, index) {
                        return TextButton(
                          onPressed: () {
                            print(index);
                            print(widget.index);
                            //print('C' + '${container.length}');
                            setState(() {
                              if (color[widget.index - 1][index] ==
                                  Colors.green) {
                                color[widget.index - 1][index] = Colors.red;
                              } else {
                                color[widget.index - 1][index] = Colors.green;
                              }
                            });
                            Navigator.pushNamed(
                              context,
                              '/catScreen',
                              arguments: {
                                'indexNum': index,
                                'listNum': widget.index
                              },
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            //fixedSize: MaterialStatePropertyAll(),
                            backgroundColor: MaterialStateProperty.all(
                                color[widget.index - 1][index]),
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
                child: SizedBox(
                  height: 700,
                  width: 230,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 70),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            // setState(() {
                            //   container[widget.index];
                            // });
                            showSearch(
                              context: context,
                              delegate:
                                  CustomDelegate(intIndex: widget.index - 1),
                            );
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: container[widget.index - 1],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
