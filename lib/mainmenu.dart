import 'package:flutter/material.dart';
import 'package:parke/Login.dart';
import 'package:parke/slot%201.dart';
import 'package:parke/slot2.dart';
import 'package:parke/slot3.dart';
import 'package:parke/slot4.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({Key? key}) : super(key: key);

  @override
  State<Mainmenu> createState() => _LoginPageState();
}

class _LoginPageState extends State<Mainmenu> {
  @override
  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;

  Widget build(BuildContext context) =>
      Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(title: Text("Slot Booking",style: TextStyle(fontSize: 22,color: Colors.white),),),
      body: Column(
        children: <Widget> [
          SizedBox(
          height: 175,),

           Row(
            children: [
              SizedBox(
                height: 150,
                child:FlatButton(
                onPressed: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => slot1()),
                );
                  },
                child: Text("Slot-1", style: TextStyle(color: Colors
                    .indigo[900]),),
                color: Colors.blue[100],
                minWidth: 195,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white),),
              ),),

              SizedBox(
                height: 150,
                child:FlatButton(
                onPressed: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => slot2()),
                );
                },
                child: Text("Slot-2", style: TextStyle(color: Colors
                    .indigo[900]),),
                color: Colors.blue[100],
                minWidth: 195,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.white),),
              ),),
              SizedBox(
                height: 50,
              ),
            ]),

               Row(
                  children: [

                    SizedBox(
                      height: 150,
                      child:FlatButton(
                      onPressed: () { Navigator.push(context,
                        MaterialPageRoute(builder: (context) => slot3()),
                      );
                      },
                      child: Text("Slot-3", style: TextStyle(color: Colors
                          .indigo[900]),),
                      color: Colors.blue[100],
                      minWidth: 195,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),),
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                    child:FlatButton(
                      onPressed: () { Navigator.push(context,
                        MaterialPageRoute(builder: (context) => slot4()),
                      );
                      },
                      child: Text("Slot-4", style: TextStyle(color: Colors
                          .indigo[900]),),
                      color: Colors.blue[100],
                      minWidth: 195,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),),
                    ),),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
        ]),

      );
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
      child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      )
  );
  Widget buildHeader(BuildContext context) => Container(
    color: Colors.blue.shade700,
  );
  Widget buildMenuItems(BuildContext context) => Wrap(
      runSpacing: 16,
      children:[
        SizedBox(
          child: Image(
            image: AssetImage('images/logo.jpg'),),
          height: 200,),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Profile'),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );},
        ),
        const Divider(color:  Colors.black),
        ListTile(
          leading: const Icon(Icons.output_outlined),
          title: const Text('Sign Out'),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );},
        ),]
  );
}
