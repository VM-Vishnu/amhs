import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';

class Button extends StatelessWidget {
  final int listNum;
  // final Function onPressed;
  const Button({super.key, required this.listNum});
  // MQuerry mQuerry = MQuerry();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: height * 0.10,
        width: width * 0.1,
        child: TextButton(
          onPressed: () {
            print(height);
            print(width);
            if (d[listNum - 1].row == -1) {
              Navigator.pushNamed(context, '/second', arguments: listNum);
            } else {
              print(listNum);
              Navigator.pushNamed(context, '/third', arguments: {
                'index': listNum,
                'value': false,
              });
            }
          },
          // style: TextButton.styleFrom(fixedSize: Size.fromHeight(70),
          // backgroundColor: Colors.amber,),
          style: ButtonStyle(
            //shape: Material,
            backgroundColor: MaterialStateProperty.all(const Color(0xFF4BC4E3)),
          ),
          child: Text(
            "$listNum",
            style: const TextStyle(fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
