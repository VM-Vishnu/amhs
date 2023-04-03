import 'package:amhs/Details/categoryDetails.dart';
import 'package:flutter/material.dart';
import 'package:amhs/Details/dimensions.dart';

class CatDisplayScreen extends StatefulWidget {
  final int indexNum;
  final int listNum;
  const CatDisplayScreen(
      {required this.indexNum, required this.listNum, super.key});

  @override
  State<CatDisplayScreen> createState() => _CatDisplayScreenState();
}

class _CatDisplayScreenState extends State<CatDisplayScreen> {
  Widget displayField(String display, int value) {
    return Row(
      children: [
        Text(
          "$display  :  ",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        if (value == 1)
          Text(
            '${catDetails[widget.listNum - 1][widget.indexNum - 1].catID}',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        if (value == 2)
          Text(
            catDetails[widget.listNum - 1][widget.indexNum - 1].catName,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        if (value == 3)
          Text(
            '${catDetails[widget.listNum - 1][widget.indexNum - 1].weight}',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        if (value == 4)
          Text(
            '${catDetails[widget.listNum - 1][widget.indexNum - 1].cost}',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        if (value == 5)
          Text(
            catDetails[widget.listNum - 1][widget.indexNum - 1].location,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
      ],
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
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.25, horizontal: width * 0.31),
            child: SizedBox(
              height: height * .92,
              width: width * .32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  displayField('CATEGORY ID        ', 1),
                  const SizedBox(
                    height: 30,
                  ),
                  displayField('CATEGORY NAME', 2),
                  const SizedBox(
                    height: 30,
                  ),
                  displayField('WEIGHT                  ', 3),
                  const SizedBox(
                    height: 30,
                  ),
                  displayField('COST                      ', 4),
                  const SizedBox(
                    height: 30,
                  ),
                  displayField('LOCATION             ', 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
