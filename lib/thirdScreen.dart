import 'package:amhs/customDelegate.dart';
import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';

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
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: width * 0.01, horizontal: height * 0.02),
                    child: Text(
                      d[widget.index - 1].name,
                      style: const TextStyle(fontSize: 35),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomDelegate(intIndex: widget.index - 1),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 120,
              ),
              SizedBox(
                height: height * 0.96,
                width: width * 0.5,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.2,
                      left: width * 0.04,
                      right: width * 0.04),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.7,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 45,
                              crossAxisCount: 3),
                      itemCount:
                          d[widget.index - 1].row * d[widget.index - 1].col,
                      itemBuilder: (BuildContext context, index) {
                        return TextButton(
                          onPressed: () {
                            print(index);
                            print(widget.index);
                            print('C' + '${container.length}');

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
                padding: EdgeInsets.only(top: height * 0.12),
                child: SizedBox(
                  //height: double.infinity,
                  width: 250,
                  child: ListView(
                    children: container[widget.index - 1],

                    // GestureDetector(
                    //   onTap: (){
                    //     Navigator.pushNamed(context,'/catDisplayScreen');
                    //   },
                    //   child: SizedBox(
                    //     width: 150,
                    //     child: Text('${widget.index}'),
                    //   ),
                    // ),
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
