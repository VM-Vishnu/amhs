import 'package:flutter/material.dart';
import 'package:amhs/categoryDetails.dart';
import 'package:amhs/catDisplayScreen.dart';
class CardButton extends StatelessWidget {
  final id;
  CardButton({required this.id,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //shape: const RoundedRectangleBorder(side: BorderSide.strokeAlignCenter),
      
      height: 110,
      width: double.infinity,
      child: TextButton(
        onPressed: (){
           Navigator.pushNamed(context,'/catDisplayScreen',arguments: id);
        },
        child: Center(child: Text('${id+1}',
        style: const TextStyle(fontSize: 40),),),
      ),);
  }
}


