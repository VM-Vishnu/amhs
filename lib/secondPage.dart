import 'package:flutter/material.dart';
import 'package:amhs/dimensions.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class SecondPage extends StatefulWidget {
  final int value;
  const SecondPage(this.value, {super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  MQuerry mQuerry=MQuerry();
  //int value=0;
  //List<Dimensions> d=[];
  bool isRowEmpty = false;
  bool isColEmpty = false;
  bool isNameEmpty = false;
  String r = "";
  String c = "";
  String n = "";
  @override
  Widget build(BuildContext context) {
    MQuerry().init(context);
    MediaQueryData _mediaQuery=MediaQuery.of(context);
     double width=_mediaQuery.size.width;
     double height=_mediaQuery.size.height;
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
            padding: const EdgeInsets.symmetric(vertical: 160,horizontal: 380),
            child: SizedBox(
              height: (width >800)?700:100,
              width: (width >800)?590:100,
              child: ListView(
                //shrinkWrap: true,
                children: [
                  
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "RACK NAME",
                      
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                  const SizedBox(
                    //margin: EdgeInsets.all(10),
                    height: 25,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      scrollPadding: EdgeInsets.only(bottom: 20),
                      style: const TextStyle(
                        fontSize: 30,
                        height: 1.5,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
                      //decoration: InputDecoration(),
                      onChanged: (String name) {
                        n = name;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SLOTS",
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          style: const TextStyle(fontSize: 35),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                              hintStyle: const TextStyle(
                                fontSize: 40,
                              ),
                              hintText: 'Row',
                              errorText: isRowEmpty ? 'Value required' : null),
                          //controller: TextEditingController(text: "Hai"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (var row) {
                            r = row;
                          },
                          // onSubmitted: (var row){
                          //   d[widget.value - 1].row = int.parse(row);
                          // },
                          // onEditingComplete: () {
                          //   d[widget.value - 1].row = int.parse(r);
                          // },
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          style: const TextStyle(fontSize: 35),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Column',
                            hintStyle: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (var col) {
                            c = col;
                          },
                          // onSubmitted: (var col){
                          //       d[widget.value - 1].col = int.parse(col);
                          // },
                          // onEditingComplete: () {
                    
                          // },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                 //const  SizedBox(height: 50,),
                  Row(
                    children: [
                      SizedBox(
                        //height: 100,
                        width: 250,
                        child: TextButton(
                          
                          onPressed: () {
                            Navigator.pop(context, widget.value + 1);
                          },
                          child: const Text(
                            "BACK",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 72,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextButton(
                          onPressed: () {
                            // if(r.isEmpty){
                            //   setState(() {
                            //     isRowEmpty=true;
                            //   });
                            // }
                            //  if(c.isEmpty){
                            //   setState(() {
                            //     isColEmpty=true;
                            //   });
                            // }
                            //  if(name.isEmpty){
                            //   setState(() {
                            //     isNameEmpty=true;
                            //   });
                            // }
                            print(widget.value);
                            //List.empty();
                            //container[widget.value-1].add(List<Widget>.empty());
                            if (n.isEmpty || r.isEmpty || c.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text('Error'),
                                      content: Text("Values cannot be empty!"),
                                    );
                                  });
                            } else {
                              d[widget.value - 1].name = n;
                              d[widget.value - 1].row = int.parse(r);
                              d[widget.value - 1].col = int.parse(c);
                              Navigator.pushNamed(context, '/third',
                                  arguments: widget.value);
                            }
                          },
                          child: const Text(
                            "NEXT",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
