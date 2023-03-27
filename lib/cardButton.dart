import 'package:flutter/material.dart';
import 'package:amhs/categoryDetails.dart';
import 'package:amhs/catDisplayScreen.dart';

class CardButton extends StatelessWidget {
  final id;
  CardButton({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.pushNamed(context, '/catDisplayScreen', arguments: id+1);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 40,top: 20),
        child: Container(
          //shape: const RoundedRectangleBorder(side: BorderSide.strokeAlignCenter),
          //color: Colors.amber,
          decoration: BoxDecoration(
            color: const Color(0xFF03B6C9),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 90,
          width: 70,
          child: Center(
            child: Text(
              '${id + 1}',
              style: const TextStyle(fontSize: 43,
              fontWeight: FontWeight.bold,
              color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
