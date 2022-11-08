import 'package:flutter/material.dart';
import 'package:todo_mobile_application/src/settings/settings_page.dart';

// ListTile
Widget todoTile (String text, {required VoidCallback callbackRemove, required Color color}){
  return Container(
    margin: const EdgeInsets.all(12),
    decoration: BoxDecoration(
     color: color, 
  
    ),
    
    child: ListTile(
      title: Text(text),
      enableFeedback: true,
      leading: IconButton(
        onPressed: callbackRemove, 
        icon: const Icon(Icons.cancel)),   
      // isThreeLine: true,
      shape: const CircleBorder(),
    ),
  );
}

Widget drawerWidget (double width_, double drawerOffset, BuildContext context){
  return Transform.translate(
    
    offset: Offset(drawerOffset, 0),
    child: Row(
      children: [
        Container(
          width: width_*0.7,
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: ListView(
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Colors.grey
                        ),
                        child: Container(),
                      ),
                      const ListTile(
                        title: Text('Enugu'),
                        leading: Icon(Icons.cloud),
                        subtitle: Text('24°C Partly Cloudy'),
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
                      const ListTile(
                        leading: Icon(Icons.palette),
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text('Change Theme'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.feed),
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text('Feedback Wall'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: (){
                          Navigator.of(context).pushReplacement(
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
        GestureDetector(
          onTap: () {
            
          },
          child: Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        )
      ],
    ),
  );
}

// AddButton
class AddButton extends CustomClipper<Path>{
  
  @override
  getClip(Size size) {
     Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width/2, size.height/2), 
          width: 75, 
          height: 75),
          const Radius.circular(30)
          ),
        );
    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

