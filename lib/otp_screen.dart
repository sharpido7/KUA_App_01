import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kua_app_01/homepage.dart';
import 'package:kua_app_01/login_screen.dart';
import 'package:kua_app_01/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpPage extends StatefulWidget {
   final String phone;
   
  OtpPage( this.phone);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  //final _pinPutController = TextEditingController();

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
   final TextEditingController _fieldFive = TextEditingController();
    final TextEditingController _fieldSix = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
   String Code='';
  
   User? user;
  String verificationID = '' ;

   @override
 void initState(){
  super.initState();


  loginWithPhone();

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black87,
        title: Text('KUA APP'),
      ),
      backgroundColor: Colors.black,
      body: Center(

        child: Column(

          
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:150),
              child: Text(
                'ENTER OTP',style: TextStyle(fontSize: 49,color: Colors. white),
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.symmetric(horizontal:50),
              child: Form(
                
                child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                     SizedBox(
                        height: 55,
                       width:40,
                       child: TextFormField(
                            decoration:  InputDecoration(
                            filled: true,
                             fillColor: Color.fromARGB(255, 36, 36, 36),
                           // hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                                controller: _fieldOne,
                       onChanged: (value){
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       },
                       style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign:TextAlign.center,
                       inputFormatters: [LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly
                       ],
                       ),
                     ),

                     SizedBox(
                       height: 55,
                       width:40,
                       child: TextFormField(
                         decoration:  InputDecoration(
                              filled: true,
                             fillColor: Color.fromARGB(255, 36, 36, 36),
                             
                           // hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                                controller: _fieldTwo,
                         onChanged: (value){
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       },
                       style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign:TextAlign.center,
                       inputFormatters: [LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly
                       ],
                       ),
                     ),

                     SizedBox(
                        height: 55,
                       width:40,
                       child: TextFormField(
                       decoration:  InputDecoration(
                             filled: true,
                             fillColor: Color.fromARGB(255, 36, 36, 36),
                           // hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                                controller: _fieldThree,
                        onChanged: (value){
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       }, 
                      style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign:TextAlign.center,
                       inputFormatters: [LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly
                       ],
                       ),
                     ),

                     SizedBox(
                       height: 55,
                       width:40,
                       child: TextFormField(
                         
                       decoration:  InputDecoration(
                             filled: true,
                             fillColor: Color.fromARGB(255, 36, 36, 36),
                           // hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                               controller: _fieldFour,
                         onChanged: (value){
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       }, 
                       style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign:TextAlign.center,
                       inputFormatters: [LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly
                       ],
                       ),
                     ),

                     SizedBox(
                       height: 55,
                       width:40,
                       child: TextFormField(
                         
                       decoration:  InputDecoration(
                             filled: true,
                             fillColor: Color.fromARGB(255, 36, 36, 36),
                           // hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                               controller: _fieldFive,
                         onChanged: (value){
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       }, 
                       style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign:TextAlign.center,
                       inputFormatters: [LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly
                       ],
                       ),
                     ),

                     SizedBox(
                       height: 55,
                       width:40,
                       child: TextFormField(
                         
                       decoration:  InputDecoration(
                             filled: true,
                             fillColor: Color.fromARGB(255, 36, 36, 36),
                           // hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                               controller: _fieldSix,
                         onChanged: (value){
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       }, 
                       style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign:TextAlign.center,
                       inputFormatters: [LengthLimitingTextInputFormatter(1),
                       FilteringTextInputFormatter.digitsOnly
                       ],
                       ),
                     )


                ],
              ),),
            ),
            SizedBox(height: 35),
           Row(
             children: [
               Expanded(
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal:10),
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Color.fromARGB(255, 241, 153, 55)
                     ),
                      onPressed: () {
             Code=_fieldOne.text +_fieldTwo.text + _fieldThree.text +_fieldFour.text
        +_fieldFive.text+_fieldSix.text;
                  verifyOTP();
      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('VERIFY',style: TextStyle(fontSize: 25,color: Colors. black),),
                      ),
                    ),
                 ),
               ),
             ],
           ),


          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  
void loginWithPhone() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+255${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
    
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60)
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: Code);

    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login of code "+ Code + " is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }

}
