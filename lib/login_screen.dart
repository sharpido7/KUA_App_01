import 'package:flutter/material.dart';
import 'package:kua_app_01/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  child: Text("Welcome Back",style: TextStyle(fontSize: 30,
                  color: Colors. white
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                   margin: EdgeInsets.only(right: 230),
                  child: Text('LOGIN',style: TextStyle(fontSize: 40,
                  color: Color.fromARGB(255, 241, 153, 55),fontWeight:FontWeight.bold,
                  ),),
                ),
              ),
                       SizedBox(height: 10),
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
                              hintText: 'Username or PhoneNumber',
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
                      onPressed: () {
                        Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=>HomePage())
               );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('LOGIN' ,style: TextStyle(fontSize: 25,color: Colors. black),),
                      ),
                    ),
                 ),
               ),
             ],
           ),SizedBox(height:10),
 Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Already Registered? ',
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