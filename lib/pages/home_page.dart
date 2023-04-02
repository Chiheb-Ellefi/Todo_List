import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/components/dialogbox.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox=Hive.box('mybox');
  final _textController=TextEditingController();
  ToDoDataBase db=ToDoDataBase();
  @override
  void initState() {
    //if this is the first time opening the app ,then create default data
    if(_mybox.get('TODOLIST')==null){
      db.createInitialData();
    }

    else {
      //data already exists
      db.loadData();

    }


    super.initState();
  }

  void checkBoxChanged(bool? value , int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            textController: _textController,
            onCancel:()=>Navigator.of(context).pop(),
            onSave:saveNewTask,
          );
        },);
  }
  void saveNewTask() {
    setState(() {
      db.toDoList+=[[_textController.text,false]];
      _textController.clear();
    }

    );
    Navigator.of(context).pop();
}

//delete task function

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title:const Text(
          'TO DO',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,

          ),

        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask ,
        child:const Icon(Icons.add) ,
      ),
      body:ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
              taskCompleted: db.toDoList[index][1],
              taskName: db.toDoList[index][0],
              onChanged:(value)=> checkBoxChanged(value, index),
            deleteFunction: (context)=>deleteTask(index),
          );
        },
      ),
    );
  }
}

