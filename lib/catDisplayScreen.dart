import 'package:flutter/material.dart';
import 'package:amhs/categoryDetails.dart';
class CatDisplayScreen extends StatefulWidget {
  final index;
  CatDisplayScreen({required this.index,super.key});

  @override
  State<CatDisplayScreen> createState() => _CatDisplayScreenState();
}

class _CatDisplayScreenState extends State<CatDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(catDetails[widget.index].catName),
            Text('${catDetails[widget.index].catID}'),
          ],
        ),
      ),
    );
  }
}
