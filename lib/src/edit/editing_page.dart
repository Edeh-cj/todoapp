import 'package:flutter/material.dart';
import 'package:todo_mobile_application/provider/appcolor.dart';
import 'package:todo_mobile_application/provider/todolist.dart';
import 'package:provider/provider.dart';


class EditingPage extends StatefulWidget {
  const EditingPage({Key? key}) : super(key: key);

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {

  final myTextController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    

    return Consumer<ColorThemeNotifier>(
      builder: (context, value, child) {
        
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Todo'),
            backgroundColor: value.appColor,
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
               icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: SingleChildScrollView(
            child: 
              Column(
                children: [
              
                  Container(
                    height: screenHeight*0.4,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextField(
                      controller: myTextController,
                      onSubmitted: (string){Provider.of<TodoNotifier>(context, listen: false).addTodo(string);},
                      maxLines: 5,
                      cursorColor: value.appColor, 
                      cursorHeight: 5,             
                      decoration: const InputDecoration(
                        border: InputBorder.none
                      ),
                      
                    ),
                  ),
                  SizedBox(
                    height: screenHeight*0.1,
                    child: 
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: value.appColor
                          ),                          
                          onPressed: (){
                            Navigator.of(context).pop();
                            Provider.of<TodoNotifier>(context, listen: false).addTodo(myTextController.text);
                          }, child: const Text('ADD')),
                      )))
                ],
              ),
            
          ),
        );
      }
    );
  }
}