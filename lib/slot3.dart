import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:parke/styles.dart';

import 'mainmenu.dart';



class slot3 extends StatefulWidget {
  const slot3({Key? key}) : super(key: key);
  @override
  State<slot3> createState() => _slot3PageState();
}

class _slot3PageState extends State<slot3> {
  final Duration = ['4 hrs','12 hr','one day' ];
  final vehicle = ['Car','Bike','Heavy vehicle', ];
  String? value;
  var dropdownValue;
  var dropdownValue2;
  TextEditingController VehicleNocontroller= new TextEditingController();
  TextEditingController Namecontroller= new TextEditingController();




  @override
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slot-3 Registeration', style: TextStyle(fontSize:30,color: Colors.black),),
          backgroundColor: Colors.grey,
        ),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/bg.jpg'),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.color),
                      fit: BoxFit.fill,
                    )),
                child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                                controller: Namecontroller,
                                style: inputstyle(),
                                // controller: uc.uname,
                                decoration:
                                inputdec("Eneter your Name", Icons.person_outline)),),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                                controller: VehicleNocontroller,
                                style: inputstyle(),
                                // controller: uc.uname,
                                decoration:
                                inputdec("Vehicle NO", Icons.person_outline)),),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text(dropdownValue!=null?dropdownValue:"Select Your Vehicle",
                                    style: TextStyle(color: Colors.grey),
                                  ),


                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                  items: vehicle.map(buildMenuItem).toList(),
                                  onChanged: (value)=> setState(() => this.dropdownValue = value),
                                ),),),),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width:350,
                            child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black)
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(hint: Text(dropdownValue2!=null?dropdownValue2:"Select Your Duration",
                                  style: TextStyle(color: Colors.grey),
                                ),

                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                  items: Duration.map(buildMenuItem).toList(),
                                  onChanged: (value)=> setState(() => this.dropdownValue2 = value),


                                ),
                              ),),),
                          SizedBox(
                            height: 20,),
                          FlatButton(
                            onPressed: () {
                              showDialog(
                                context: context, barrierDismissible: false,
                                builder: (context) => Center(child: CircularProgressIndicator()),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Mainmenu()),
                              );
                              Map <String,dynamic> data= {"Name":Namecontroller.text.trim(),"Vehicle NO":VehicleNocontroller.text.trim(),"Vehicle":dropdownValue,
                                "Duration":dropdownValue2};
                              final docUser= FirebaseFirestore.instance.collection('Slot3').doc(Namecontroller.text);
                              docUser.set(data);
                            },
                            child: Text(
                              "Register Slot",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue[600],
                            minWidth: 160,
                          ),
                        ])))
        )
    );}
  DropdownMenuItem<String>buildMenuItem(String item) =>
      DropdownMenuItem(value: item,
          child: Text(
              item,
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20)));
}