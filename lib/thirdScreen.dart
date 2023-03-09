import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';
import 'package:amhs/cardButton.dart';
import 'package:amhs/categoryDetails.dart';

class ThirdPage extends StatefulWidget {
  final int index;
  const ThirdPage({required this.index, super.key});
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  d[widget.index - 1].name,
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              const SizedBox(
                width: 160,
              ),
              SizedBox(
                height: 600,
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: GridView.builder(
                    shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.35,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 30,
                              crossAxisCount: 3),
                      itemCount:
                          d[widget.index - 1].row * d[widget.index - 1].col,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20,right: 40,bottom: 30),
                          child: SizedBox(
                            height: 60,
                            child: TextButton(
                              onPressed: () {
                                print(index);
                                print(widget.index);
                                container[widget.index - 1].add(
                                  CardButton(id: index),
                                );
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
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white,fontSize: 30),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
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
