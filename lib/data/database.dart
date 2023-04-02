import 'package:hive_flutter/hive_flutter.dart';


class ToDoDataBase {
//refrence our box
  final _myBox =Hive.box('mybox');
  List toDoList=[];

  //run this method if this is the first time ever opening the app
  void createInitialData (){
    toDoList=[
      ['Make tutoriol',false],
      ['Do exercise',false],
    ];
  }
  //load the data from database
void loadData(){
    toDoList=_myBox.get('TODOLIST');
}

//update the database
void updateDataBase(){
    _myBox.put('TODOLIST',toDoList);
}

}