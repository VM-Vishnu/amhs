import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';

class Button extends StatelessWidget {
  final int id;
  // final Function onPressed;
  Button({super.key, required this.id});
  // MQuerry mQuerry = MQuerry();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: height * 0.10,
        width: width * 0.05,
        child: TextButton(
          onPressed: () {
            print(height);
            print(width);
            if (d[id - 1].row == -1) {
              Navigator.pushNamed(context, '/second', arguments: id);
            } else {
              print(id);
              Navigator.pushNamed(context, '/third', arguments: {
                'index': id,
                'value': false,
              });
            }
          },
          // style: TextButton.styleFrom(fixedSize: Size.fromHeight(70),
          // backgroundColor: Colors.amber,),
          style: ButtonStyle(
            //shape: Material,
            backgroundColor: MaterialStateProperty.all(Colors.amber),
          ),
          child: Text(
            "$id",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
