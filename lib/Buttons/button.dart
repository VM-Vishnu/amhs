import 'package:flutter/material.dart';
import 'package:amhs/Details/dimensions.dart';

class Button extends StatelessWidget {
  final int listNum;

  const Button({super.key, required this.listNum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: height * 0.10,
        width: width * 0.1,
        child: TextButton(
          onPressed: () {
            if (d[listNum - 1].row == -1) {
              Navigator.pushNamed(context, '/second', arguments: listNum);
            } else {
              Navigator.pushNamed(context, '/third', arguments: {
                'index': listNum,
                'value': false,
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF4BC4E3)),
          ),
          child: Text(
            "$listNum",
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
