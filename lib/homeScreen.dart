import 'package:amhs/button.dart';
import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MQuerry mQuerry=MQuerry();
  var count = 1;
  List<Widget> textButton = [];
  List<int> num = [];
  var map = Map();
  @override
  Widget build(BuildContext context) {
    mQuerry.init(context);
    return Stack(
      children: [
        Container(
          //padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Images/Picture 1.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              
              padding: (mQuerry.width>800)?const EdgeInsets.fromLTRB(60,0, 0,20):const EdgeInsets.fromLTRB(40,0, 0,10),
              child: SizedBox(
                height: (mQuerry.width>800)?100:55,
                width: (mQuerry.width>800)?100:55,
                child: FloatingActionButton(
                  //shape: ,
                  onPressed: () {
                    setState(() {
                      // print(width);
                      // print(height);
                      d.add(Dimensions());
                      // map[0]=TextButton(onPressed: (){},child: Text(""),);
                      // textButton.add(
                      //   TextButton(
                      //     onPressed: () {
                      //       //d[0].row;
                      //       Navigator.pushNamed(context, '/second',
                      //               arguments: count)
                      //           .then((value) => {
                      //                 count++,
                      //                 //print(count),
                      //               });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //           MaterialStateProperty.all(Colors.amber),
                      //     ),
                      //     child: Text('$count'),
                      //   ),
                      //   // d.add(Dimensions()),
                      // );
                      textButton.add(
                        Button(
                          id: count,
                        ),
                      );
                      count++;
                    });
                  },
                  child: const Icon(Icons.add,size: 50,),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:(mQuerry.width>800)?const EdgeInsets.fromLTRB(0,50, 0,0):const EdgeInsets.fromLTRB(40,0, 0,10),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 700,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            Column(
                              children: textButton,
                            ),
                            //SizedBox(height: 40,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   width: 50,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     //crossAxisAlignment: CrossAxisAlignment.center,
                //     children: const [
                //       //SizedBox(width: double.infinity,),
                //       Image(
                //         image: AssetImage('Images/Picture 2.png'),
                //         width: 100,
                //         height: 100,
                //       ),
                //       Text("AUTOMATIC MATERIAL HANDLING"),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       Text("IN INVENTORY MANAGEMENT SYSTEM"),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
