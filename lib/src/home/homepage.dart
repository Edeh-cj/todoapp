import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_mobile_application/provider/appcolor.dart';
import 'package:todo_mobile_application/provider/todolist.dart';
import 'package:todo_mobile_application/provider/weather.dart';
import 'package:todo_mobile_application/src/edit/editing_page.dart';
import 'package:todo_mobile_application/src/home/home_widgets.dart';
import 'package:todo_mobile_application/src/settings/settings_page.dart';
import 'package:todo_mobile_application/src/theming/theming_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
    bool drawerOpen = false;
    double? drawerWidth;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
        
    return Consumer<ColorThemeNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: const Icon(Icons.menu), 
            onPressed: (){
              setState(() {
                drawerOpen=true;
              });

            },),
            backgroundColor: value.appColor,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                        
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [                   
          
                    Expanded(
                      child: Stack(                    
                        children: [
                         Consumer<TodoNotifier>(
                           builder: (context, value, child) {
                             return ListView.builder(
                              itemCount: value.todoList.length, 
                              itemBuilder: (context, index) {
                                return todoTile(
                                  value.todoList[index],
                                  callbackRemove: () {
                                    Provider.of<TodoNotifier>(context, listen: false).deleteTodo(index);
                                  },   
                                  color: Colors.grey                         
                                );
                              }
                              );
                           }
                         ),
                         Align(
                          alignment: Alignment.bottomCenter,
                           child: Padding(
                             padding: const EdgeInsets.only(bottom: 8.0),
                             child: SizedBox(
                              height: screenHeight*0.25,
                              width: screenWidth,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => const EditingPage())//*********** */
                                    )
                                  );
                                },
                                child: ClipPath(
                                      clipper: AddButton(),
                                      child: Container(
                                        color: value.appColor,
                                        child: const Center(
                                          child: Icon(Icons.add, 
                                          size: 30,
                                          color: Colors.white,)),
                                      ),
                                   )                                                                  //
                              ),
                             ),
                           ),
                         ),                        
                        ],
                      ),
                    ),
                  ],
                ),
          
                //              Drawer
                
               Transform.translate(    
              offset: Offset(drawerOpen? 0: -screenWidth, 0),
              child: Row(
            children: [
              Container(
                width: screenWidth*0.7,
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: ListView(
                          children: [
                            Consumer<ColorThemeNotifier>(
                              builder: (context, value, child) {
                                return DrawerHeader(
                                  decoration: BoxDecoration(
                                    color: value.appColor
                                  ),
                                  child: Container(),
                                );
                              }
                            ),
                            Consumer<WeatherNotifier>(
                              builder: (context, value, child) {
                                return ListTile(
                                  title: Text(value.city),
                                  leading: value.icon,
                                  subtitle: Text('${value.temp} ${value.description}'),
                                );
                              }
                            ),
                            const ListTile(
                              leading: Icon(Icons.person),
                              trailing: Icon(Icons.arrow_forward_ios),
                              title: Text('My Account'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.done_all),
                              trailing: Icon(Icons.arrow_forward_ios),
                              title: Text('Done List'),
              
                            ),
                            const ListTile(
                              leading: Icon(Icons.translate),
                              trailing: Icon(Icons.arrow_forward_ios),
                              title: Text('Change Language'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.palette),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              title: const Text('Change Theme'),
                              onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => const ThemesPage())
                                    )
                                  );
                              },
                            ),
                            const ListTile(
                              leading: Icon(Icons.feed),
                              trailing: Icon(Icons.arrow_forward_ios),
                              title: Text('Feedback Wall'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.settings),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => const SettingsPage())
                                  )
                                );
                              },
                              title: Text('Settings'),
                            ),
              
                          ],
                        ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      drawerOpen = false;
                    });
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              )
            ],
              ),
            )
              ],
            ),
          ),
        );
      }
    );
  }
}