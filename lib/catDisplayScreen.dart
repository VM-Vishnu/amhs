import 'package:amhs/categoryDetails.dart';
import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';

class CatDisplayScreen extends StatefulWidget {
  final index;
  CatDisplayScreen({required this.index, super.key});

  @override
  State<CatDisplayScreen> createState() => _CatDisplayScreenState();
}

class _CatDisplayScreenState extends State<CatDisplayScreen> {
  Widget displayField(String display, int value) {
    return Row(
      children: [
        Text(display + "     :"),
        if (value == 1) Text('${catDetails[widget.index-1].catID}'),
        if (value == 2) Text('${catDetails[widget.index-1].catName}'),
        if (value == 3) Text('${catDetails[widget.index-1].weight}'),
        if (value == 4) Text('${catDetails[widget.index-1].cost}'),
        if (value == 5) Text('${catDetails[widget.index-1].location}'),
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
                'Images/Picture 3.png',
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
                //shrinkWrap: true,
                children: [
                  displayField('CATEGORY ID', 1),
                  const SizedBox(
                    height: 20,
                  ),
                  displayField('CATEGORY NAME', 2),
                  const SizedBox(
                    height: 20,
                  ),
                  displayField('WEIGHT', 3),
                  const SizedBox(
                    height: 20,
                  ),
                  displayField('COST', 4),
                  const SizedBox(
                    height: 20,
                  ),
                  displayField('LOCATION', 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
