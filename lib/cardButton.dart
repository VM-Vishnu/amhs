import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final int indexNum;
  final int listNum;
  const CardButton({required this.indexNum, required this.listNum,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("List in cardbutton $listNum");
        print("index in cardbutton  $indexNum");
        Navigator.pushNamed(context, '/catDisplayScreen', arguments: {'indexNum': indexNum + 1,'listNum' :listNum});
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 40, top: 20),
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
              '${indexNum + 1}',
              style: const TextStyle(
                  fontSize: 43,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
