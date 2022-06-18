import 'package:flutter/material.dart';
import 'package:kua_app_01/course.dart';
//import 'package:kua_app_01/main.dart';
import 'package:kua_app_01/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kua_app_01/new_homepage.dart';

 


class Registration extends StatefulWidget {
  
  const Registration({ Key? key }) : super(key: key);
  

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
                        //  String  firstname="";
                        //   String lastname="";
                        //   String phone="";
                        //    String username="";
                        //   String password="";
  FirebaseFirestore db = FirebaseFirestore.instance;

  _saveUserInfo(){
    db.collection('Users')
                .add({
                  
                         "Firstname": _firstname.text,
                          "Lastname": _lastname.text,
                          "Phone": _controller.text,
                          "Username": _username.text,
                          "Password":_password.text        
                }).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));
     
  }

   bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        title: Text("KUA APP"), 
        backgroundColor: Colors.black38,
      ) ,
      body: SingleChildScrollView(
        child: Center(
          
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 350,
                  margin: EdgeInsets.only(right: 20),
                  child: Text("Welcome!!!",style: TextStyle(fontSize: 30,
                  color: Colors. white
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                   margin: EdgeInsets.only(right: 230),
                  child: Text('REGISTER',style: TextStyle(fontSize: 40,
                  color: Color.fromARGB(255, 241, 153, 55),fontWeight:FontWeight.bold,
                  ),),
                ),
              ),
                                   SizedBox(
                        //  height: 68,
                        //  width:64,
                         child: TextFormField(
                              //initialValue: 'First Name',
      
                              decoration:  InputDecoration(
                                
                              prefixIcon: Icon( Icons.person,
                              color: Color.fromARGB(255, 241, 153, 55)
                              ),
                              
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: 'First Name',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0))),
                        //  onChanged: (value){
                        //    if(value.length==1){
                        //      FocusScope.of(context).nextFocus();
                        //    }
                        //  },
                        controller:_firstname,
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.name,
                        // textAlign:TextAlign.center,
                        //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                        //  FilteringTextInputFormatter.digitsOnly
                         
                         ),
                       ),
                       SizedBox( height: 10,),
      
                       SizedBox(
                        //  height: 68,
                        //  width:64,
                         child: TextFormField(
                              //initialValue: 'First Name',
      
                              decoration:  InputDecoration(
                                
                              prefixIcon: Icon( Icons.person,
                              color: Color.fromARGB(255, 241, 153, 55)
                              ),
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: 'Last Name',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0))),
                        //  onChanged: (value){
                        //    if(value.length==1){
                        //      FocusScope.of(context).nextFocus();
                        //    }
                        //  },
                        controller:_lastname,
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.name,
                        // textAlign:TextAlign.center,
                        //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                        //  FilteringTextInputFormatter.digitsOnly
                         
                         ),
                       ),SizedBox( height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SizedBox(
                         height: 68,
                         width:64,
                         child: TextFormField(
                              decoration:  InputDecoration(
      
                              hintText: 'Last Name',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              prefixIcon: Icon( Icons.phone,
                              color: Color.fromARGB(255, 241, 153, 55)
                              ),
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                             // hintText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                         onChanged: (value){
                           if(value.length==1){
                             FocusScope.of(context).nextFocus();
                           }
                         },
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign:TextAlign.center,
                         
                         ),
                       ),
      
                        SizedBox(
                         height: 68,
                         width:64,
                         child: TextFormField(
                           
                              decoration:  InputDecoration(
      
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: '255',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                         onChanged: (value){
                           if(value.length==1){
                             FocusScope.of(context).nextFocus();
                           }
                         },
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                         textAlign:TextAlign.center,
                         
                         ),
                       ),
                              SizedBox(
                         height: 68,
                         width:260,
                         child: TextFormField(
                              //initialValue: 'First Name',
                         
                              decoration:  InputDecoration(
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: '784765698',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                                             //  onChanged: (value){
                                             //    if(value.length==1){
                                             //      FocusScope.of(context).nextFocus();
                                             //    }
                                             //  },
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.number,
                          controller: _controller,
                                             // textAlign:TextAlign.center,
                                             //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                                             //  FilteringTextInputFormatter.digitsOnly
                         
                         ),
                       )   
      
                           ],
                       ),SizedBox(height: 10),
                        SizedBox(
                        //  height: 68,
                        //  width:64,
                         child: TextFormField(
                              //initialValue: 'First Name',
      
                              decoration:  InputDecoration(
                                
                              prefixIcon: Icon( Icons.account_circle,
                              color: Color.fromARGB(255, 241, 153, 55)
                              ),
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: 'Username',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0))),
                        //  onChanged: (value){
                        //    if(value.length==1){
                        //      FocusScope.of(context).nextFocus();
                        //    }
                        //  },
                        controller:_username,
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.text,
                        // textAlign:TextAlign.center,
                        //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                        //  FilteringTextInputFormatter.digitsOnly
                         
                         ),
                       ),
                       SizedBox( height: 10,),
      
                        SizedBox(
                        //  height: 68,
                        //  width:64,
                         child: TextFormField(
                              //initialValue: 'First Name',
                              obscureText: true,
                              decoration:  InputDecoration(
                                
                              prefixIcon: Icon( Icons.key,
                              color: Color.fromARGB(255, 241, 153, 55)
                              ),
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: 'Password',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0))),
                        //  onChanged: (value){
                        //    if(value.length==1){
                        //      FocusScope.of(context).nextFocus();
                        //    }
                        //  },
                        controller:_password,
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.text,
                        // textAlign:TextAlign.center,
                        //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                        //  FilteringTextInputFormatter.digitsOnly
                         
                         ),
                       ),
                       SizedBox( height: 10,),
      
                        SizedBox(
                        //  height: 68,
                        //  width:64,
                         child: TextFormField(
                              //initialValue: 'First Name',
                              obscureText: true,
                              decoration:  InputDecoration(
                                
                              prefixIcon: Icon( Icons.key,
                              color: Color.fromARGB(255, 241, 153, 55)
                              ),
                              filled: true,
                               fillColor: Color.fromARGB(255, 36, 36, 36),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0))),
                        //  onChanged: (value){
                        //    if(value.length==1){
                        //      FocusScope.of(context).nextFocus();
                        //    }
                        //  },
                         style: Theme.of(context).textTheme.headline6,
                         keyboardType: TextInputType.text,
                        // textAlign:TextAlign.center,
                        //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                        //  FilteringTextInputFormatter.digitsOnly
                         
                         ),
                       ),
                       SizedBox( height: 10,),

                       Row(
                       //  mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Checkbox(
              value: isChecked, onChanged:(bool? value) { // This is where we update the state when the checkbox is tapped
               setState(() {
              isChecked = value!;
                });
               },hoverColor: Colors.white,
                           checkColor: Color.fromARGB(255, 241, 153, 55),
                           ),
                           Text('Terms and Conditions ',
                           style: TextStyle(fontSize: 23.0,color:Colors.white) 
                           ), 
                         ],
                       ),SizedBox( height: 10,),

                                  Row(
             children: [
               Expanded(
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal:15),
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Colors.orange
                     ),

                      onPressed: ()async {  


                          
          //  _saveUserInfo();
                 




           // if(_form.currentState.validate()){
             
            //Here is whare we have the shared preferences 
             
                    //  final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
                    //        sharedpreferences.setString('phone', _controller.text);
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => OtpPage( _controller.text)));
                  
           // }

                     Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=>Home())
               );



          },
                      
              
                    
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('REGISTER' ,style: TextStyle(fontSize: 25,color: Colors. black),),
                      ),
                    ),
                 ),
               ),
             ],
           ),SizedBox(height:10),
 Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Already Registered?',
                           style:TextStyle( color:Colors.white,fontSize: 23) 
                           ), TextButton(onPressed: null, child:Text('LOGIN',style:TextStyle( color:Colors.orange,fontSize: 25)))
                         ],
                       )
            ],
          )
        ),
      )
    );
  }
}