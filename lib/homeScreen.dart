import 'package:amhs/button.dart';
import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';


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
          resizeToAvoidBottomInset: false,
          floatingActionButton: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              
              padding: EdgeInsets.only(left: width*0.02,bottom: height*0.001),
              child: SizedBox(
                height: height*0.10,
                width: width*0.10,
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
                          listNum: count,
                        ),
                      );
                      count++;
                    });
                  },
                  child: const Icon(Icons.add,size: 40,),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(top: height*0.05),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: width*.12,
                      height: height*.75,
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
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Container(
                //     height: 20,
                //     width: 20,
                //     child: IconButton(icon: Icon(Icons.search),
                //     onPressed: (){

                //       showSearch(context: context, delegate: CustomDelegate());
                //     },),
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
