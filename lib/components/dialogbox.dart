import 'package:flutter/material.dart';
import 'package:todo/components/button.dart';


class DialogBox extends StatelessWidget {
  final textController ;
  VoidCallback onSave;
  VoidCallback onCancel ;
  DialogBox({Key? key , required this.textController, required this.onCancel,required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:textController ,
              decoration:const  InputDecoration(border: OutlineInputBorder(),
              hintText: 'Add a new Task',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: 'Save', onPressed: onSave),
                const SizedBox(width: 8.0),
                //delete button
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
