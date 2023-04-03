import 'package:amhs/Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:amhs/Details/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MQuerry mQuerry = MQuerry();
  var count = 1;
  List<Widget> textButton = [];
  List<int> num = [];

  @override
  Widget build(BuildContext context) {
    mQuerry.init(context);
    return Stack(
      children: [
        Container(
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
              padding:
                  EdgeInsets.only(left: width * 0.02, bottom: height * 0.001),
              child: SizedBox(
                height: height * 0.10,
                width: width * 0.10,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      d.add(Dimensions());

                      textButton.add(
                        Button(
                          listNum: count,
                        ),
                      );
                      count++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: width * .12,
                      height: height * .75,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            Column(
                              children: textButton,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
