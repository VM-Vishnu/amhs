import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';

class Button extends StatelessWidget {
  final int id;
  // final Function onPressed;
  const Button({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 90,
        width: 120,
        child: TextButton(
          
          onPressed: () {
            if (d[id - 1].row == -1) {
              Navigator.pushNamed(context, '/second', arguments: id);
            } else {
              print(id);
              Navigator.pushNamed(context, '/third', arguments: id);
            }
          },
          // style: TextButton.styleFrom(fixedSize: Size.fromHeight(70),
          // backgroundColor: Colors.amber,),
           style: ButtonStyle(
            //shape: Material,
            backgroundColor: MaterialStateProperty.all(Colors.amber),
          ),
          child: Text("$id",
          style: TextStyle(fontSize: 40),),
        ),
      ),
    );
  }
}
