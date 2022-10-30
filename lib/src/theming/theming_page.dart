import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo_mobile_application/provider/appcolor.dart';
import 'package:todo_mobile_application/src/theming/theme_widgets.dart';
import 'package:provider/provider.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ColorThemeNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Change Theme'),
            backgroundColor: value.appColor,
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              
              ),
            children: [
              themeTile(Colors.pink, 'pink', (){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.pink);
              }),
              themeTile(Colors.black, 'dark', (){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.black);
              }),
              themeTile(Colors.green, 'green',(){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.green);
              }),
              themeTile(Colors.purple, 'purple', (){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.purple);
              }),
              themeTile(Colors.blueGrey, 'blue-grey', (){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.blueGrey);
              }),
              themeTile(Colors.cyan, 'cyan',(){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.cyan);
              }),
              themeTile(Colors.brown.shade500, 'coffee', (){
                Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(Colors.brown.shade500);
              }),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(context: context,
                     builder: (context){
                      return AlertDialog(
                        title: const Text('Pick a color!'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        content: SingleChildScrollView(
                          child: MaterialPicker(
                            pickerColor: Colors.blue, 
                            onColorChanged: (Color color){
                              Provider.of<ColorThemeNotifier>(context, listen: false).changeColorTo(color);
                            }),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){}, 
                            child: const Text('cancel',style: TextStyle(color: Colors.red),)),
                          TextButton(
                            onPressed: (){}, 
                            child: Text('ok', ))  
                        ],
                      );
                     }
                     );
                  },
                  child: Card(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red, Colors.green, Colors.blue
                          ])
                      ),
                      child: const Icon(Icons.add, color: Colors.white,),
                    ),
                  ),
                ),
              )

            ],
          ),
        );
      }
    );
  }
}