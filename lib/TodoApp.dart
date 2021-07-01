import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:todo_app/constants.dart';


class TodoApp extends StatefulWidget {
  const TodoApp({ Key? key }) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

                                  //! Todo List & Todo Count List               
  var addItem;
  List<dynamic> todos = ["My Todo App"];

  List<dynamic> _counterList = [1];
  
                                    //! Add Todo Function   

  dynamic addTodo(){
    showDialog(context: context, 
    builder: (context){
      var alertDialog = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
          title: Row(
            children: [
              Text("Add Todo...", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),),
              Icon(Icons.edit)
            ],
          ),

          content: TextField(
            onChanged: (value){addItem = value;},
            // obscureText: true,  
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[50],
               enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 2,color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: Colors.greenAccent.shade400),
              ), 
              labelText: 'Add Item',
              labelStyle: TextStyle(fontSize: 18.5,color: Colors.blue[900]),
              prefixIcon: Icon(Icons.edit_outlined, color: Colors.greenAccent[400],)
              // hintText: 'Add Item',  
            ),  
          ), 

          actions: [Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  
              children: [
                GestureDetector(
                child: Icon(Icons.edit_outlined, size: 40, color: Colors.green[700],),
                onTap: (){
                  if (addItem.isNotEmpty) {
                    setState(() {
                    todos.add(addItem);
                    int count = todos.length;
                    _counterList.add(count);
                    Navigator.of(context).pop();});
                  }
                },),
                GestureDetector(
                child: Icon(Icons.close, size: 40, color: Colors.red),
                onTap: (){
                  Navigator.of(context).pop();
                },),
              ],
            ),
          )
          ],
        );
      return  Container(
        child: alertDialog,
      );
    });
  }

                                    //! Edit Todo Function
                                    
  dynamic edit(index){
    showDialog(context: context, builder: (context){
      var alertDialog = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
          title: Row(
            children: [
              Text("Edit Todo...", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),),
              Icon(Icons.edit)
            ],
          ),

          content: TextField(
            onChanged: (value){addItem = value;},
            // obscureText: true,  
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[50],
               enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 2,color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: Colors.greenAccent.shade400),
              ), 
              labelText: 'Edit Item',
              labelStyle: TextStyle(fontSize: 18.5,color: Colors.blue[900]),
              prefixIcon: Icon(Icons.edit_outlined, color: Colors.greenAccent[400],)
              // hintText: 'Add Item',  
            ),  
          ), 

          actions: [Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  
              children: [
                GestureDetector(
                child: Icon(Icons.edit_outlined, size: 40, color: Colors.green[700]),
                onTap: (){
                  if (addItem.isNotEmpty) {
                    setState(() {
                    todos.replaceRange(index, index+1, {addItem});
                    Navigator.of(context).pop();});
                  }
                },),
                GestureDetector(
                  child: Icon(Icons.close, size: 40, color: Colors.red),
                onTap: (){
                  Navigator.of(context).pop();
                },),
              ],
            ),
          )
          ],
        );
      return  Container(
        child: alertDialog,
      );
    });
  }

                                    //! Delete Todo Function

  dynamic deleteTodo(index){
    setState(() {
      todos.removeAt(index);
    });
  }

                                    //! Delete All Todo Function

  dynamic deleteAllTodos(){
    setState(() {
      todos = [];
    });
  }

  dynamic showTodo(index){
    showDialog(context: context, builder: (context){
      return
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: [
              BoxShadow(color: Colors.black,offset: Offset(0,10),
              blurRadius: 10
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10,),
              Text(todos[index],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600, letterSpacing: 1.2),),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  child: Text("Back" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                   style: ElevatedButton.styleFrom(
                    primary: Colors.teal[400],
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 40,
              child: Container(
                child: Text('${_counterList[index]}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),),
              ),
            ),
        ),
      ],
    )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          centerTitle: true,
          backgroundColor: Colors.red[900],
          
        ),
                                        //! Main Container
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/BG (2).jpg"),
              fit: BoxFit.cover
            ),
            // gradient: LinearGradient(colors: [
            //   Color(0xfffcb045),
            //   Color(0xfffd1d1d),
            //   Color(0xff833ab4),
            // ])
          ),
                                        //! Main Container Chlid STACK
          child: Stack(  
            children: [
              Container(
                // height: MediaQuery.of(context).size.height*0.8,
                                              //! ListView
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index){
                    return Container(
                      height: 65,
                      margin: EdgeInsets.only(top: 25, right: 5, left: 5),
                      padding: EdgeInsets.only(top: 2.5, left: 5),
                      decoration: BoxDecoration(
                      // color: Colors.blueGrey[200], 
                      color: Colors.black,
                        border: Border.all(
                          color: Colors.white,
                          width: 2  // red as border color
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ListTile(
                                            //! Todo Count

                        onTap: () => showTodo(index),

                        leading: Text('${_counterList[index]}.', 
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 2
                        )),

                                              //! Todo List

                        title: SingleChildScrollView (
                          child: Text("${todos[index]}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1.3
                          ),),
                        ),
                        trailing: Container(
                          width: 93,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent[400],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.2  // red as border color
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),

                                                          //! Edit Todo 

                                child:GestureDetector(
                                  onTap: () => edit(index),
                                  child: Icon(Icons.edit, color: Colors.black,)
                                )
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent[400],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.2  // red as border color
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                                          //! Delete Todo
                                child:GestureDetector(
                                  onTap: () => deleteTodo(index),
                                  child: Icon(Icons.delete, color: Colors.black,),
                                )
                              ),
                            ],
                          ),
                        )
                      ),
                    );
                  }
                  ),
              ),
              
            ],
          ),
        ),
                                                  //! FLoating Button
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 17),
        child: FabCircularMenu(
          alignment: Alignment.bottomCenter,
          fabColor: Colors.amber,
          fabOpenColor: Colors.purple[900],
          // ringColor: Colors.blue[200],
          ringColor: Colors.purpleAccent,
          fabElevation: 15,
          // animationCurve: Curves.easeInSine,
          animationCurve: Curves.elasticOut,
          fabOpenIcon: Icon(Icons.home, size: 33,),
          fabCloseIcon: Icon(Icons.close_sharp, size: 33, color: Colors.white,),
          ringWidth: 100,
          ringDiameter: 400,
          animationDuration: Duration(milliseconds: 1000),

                                                  //! Children
          children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(26)),
              border: Border.all(
                width: 4,
                color: Colors.black
                // color: Colors.blueGrey.shade600
              )
            ),
                                                  //! Add Todo

            child: IconButton(onPressed: addTodo,
            splashColor: Colors.greenAccent[700], 
            splashRadius: 25,
            color: Colors.teal[900],
            iconSize: 30, 
            icon: Icon(Icons.add_circle)),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.redAccent[700],
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(26)),
              border: Border.all(
                width: 4,
                color: Colors.black
              )
            ),
                                                  //! Delete All

            child: IconButton(onPressed: deleteAllTodos,
            splashColor: Colors.red, 
            splashRadius: 25,
            color: Colors.redAccent[700],
            iconSize: 27,
            icon: Icon(Icons.delete_sharp)),
          ),
        ],),
      )
      ),
      
    );
  }
}




