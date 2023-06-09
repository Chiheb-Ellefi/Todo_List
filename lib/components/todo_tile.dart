import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
  final String? taskName;
  final bool taskCompleted ;
  Function(bool?)? onChanged;
  Function (BuildContext)? deleteFunction;

  ToDoTile({Key? key,
  required this.taskCompleted ,
  required this.taskName ,
  required this.onChanged,
  required this.deleteFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
          onPressed: deleteFunction,
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
            borderRadius: BorderRadius.circular(12.0),
        ),]),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged:onChanged,activeColor: Colors.black54,),
              Text(
                  '$taskName',
                style: TextStyle(
                  fontSize: 20,
                    decoration:(taskCompleted )? TextDecoration.lineThrough:TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
