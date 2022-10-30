import 'package:flutter/material.dart';
import 'package:todo_mobile_application/provider/appcolor.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            backgroundColor: value.appColor,
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
               icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: Consumer<ColorThemeNotifier>(
            builder: (context, value, child) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text('Background Gradient'),
                    leading: const Icon(Icons.invert_colors),
                    trailing: Switch(
                      activeColor: value.appColor,
                      value: true,
                       onChanged: (bool onchanged){}),
                  ),
                  ListTile(
                    title: const Text('Background ground follow task icon color'),
                    leading: const Icon(Icons.format_color_fill),
                    trailing: Switch(
                      activeColor: value.appColor,
                      value: true,
                       onChanged: (bool onchanged){}),
                  ),
                  ListTile(
                    title: const Text('Task icon follow background'),
                    leading: const Icon(Icons.colorize),
                    trailing: Switch(
                      activeColor: value.appColor,
                      value: true,
                       onChanged: (bool onchanged){}),
                  ),
                  ListTile(
                    title: const Text('Turn on the weather'),
                    leading: const Icon(Icons.sunny),
                    trailing: Switch(
                      activeColor: value.appColor,
                      value: true,
                       onChanged: (bool onchanged){}),
                  ),
                  ListTile(
                    title: const Text('Turn on the net-picture background'),
                    leading: const Icon(Icons.image),
                    trailing: Switch(
                      activeColor: value.appColor,
                      value: true,
                       onChanged: (bool onchanged){}),
                  ),
                  ListTile(
                    title: const Text('Task card cycle slide'),
                    leading: const Icon(Icons.slideshow),
                    trailing: Switch(
                      activeColor: value.appColor,
                      value: true,
                       onChanged: (bool onchanged){}),
                  ),
                  ListTile(
                    title: const Text('Icon Setting'),
                    leading: const Icon(Icons.emoji_emotions_outlined),
                    trailing: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    title: const Text('Navigator Setting'),
                    leading: const Icon(Icons.navigation),
                    trailing: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    title: const Text('About'),
                    leading: const Icon(Icons.info_outline),
                    trailing: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                ],
              );
            }
          ),
        );
      }
    );
  }
}