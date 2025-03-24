



import 'dart:developer';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:sizer/sizer.dart';

import 'package:telegram_clone/presentation/bloc/authentication/authentication_bloc.dart';

import 'package:telegram_clone/presentation/screen/profile_setup_screen.dart';
import 'package:telegram_clone/presentation/screen/tabbar.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
// 105271650663618787169)JcLY4gqMvnOeS5hK2DKPA9igwIy1

class _LoginState extends State<Login> {
  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      log('User is currently signed out!');
    return;
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
        return Tabbar();
      }), (route) => false);
      // Navigator.push( context, MaterialPageRoute(builder: (context){
      //   return Tabbar();
      // }));
      log('User is signed in! $user');
    }
  });
    super.initState();
  }
   @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: const Color.fromARGB(255, 84, 62, 248),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
        
        
          Transform.rotate(
              angle: -1 / 8,
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.white),
                  height: 8.h,
                  width: MediaQuery.sizeOf(context).width * 0.56,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, top: 3),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/persondp2.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(20))),
                    height: 62,
                    width: 49,
                  ),
                ),
                Positioned(
                  left: 68,
                  top: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Danial Garcia",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("Hi Guyzz!"),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: -10,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.blueAccent.shade100),
                      height: 27,
                      width: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "❤️",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text("4")
                        ],
                      )),
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RotationTransition(
              turns: AlwaysStoppedAnimation(3 / 360),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: const Color.fromARGB(255, 255, 236, 230)),
                height: 8.h,
                width: MediaQuery.sizeOf(context).width * 0.65,
                child: Row(
                  spacing: 15,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Amelia joicy",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("Let's meet guys, have fun?")
                      ],
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/dp12.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(20))),
                      width: 49,
                      height: 62,
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              height: 70,
              width: MediaQuery.sizeOf(context).width * 0.54,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/dp2.jpg',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(12)),
                          color: Colors.yellow),
                      height: 62,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Eric Ison",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text("What's up ?")
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: -10,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.blueAccent.shade100),
                  height: 27,
                  width: 46,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🤩",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("1")
                    ],
                  )),
            )
          ]),
         
             
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Text(
            textAlign: TextAlign.center,
            "Chatting,\nMade Simple.",
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.14),
           BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          if (state.userCredential?.additionalUserInfo?.isNewUser == true) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Tabbar()),
              (route) => false,
            );
          }
        }

        if (state is AuthenticationFailed) {
          // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(
      state.message,
      style: TextStyle(color: Colors.white), // White text for contrast
    ),
    backgroundColor: Colors.indigo.shade700, // Darker blue for better visibility
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating, // Makes it look more modern
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Soft edges for a better look
    ),
  ),
);
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          // Show Circular Progress Indicator instead of button
          return Center(
            child: SpinKitWanderingCubes(color: Colors.white,)
          );
        }

        return SizedBox(
          height: 6.h,
          child: SignInButton(
            Buttons.google,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () {
            //   Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => Tabbar()),
            //   (route) => false,
            // );
              context.read<AuthenticationBloc>().add(AuthenticationByGoogle());
            },
          ),
        );
      },
    )
          // SizedBox(height: 6.h,child: 
          // SignInButton(
          //                   Buttons.google,
          //                   shape: RoundedRectangleBorder(
          //                     side: const BorderSide(color: Colors.black12),
          //                     borderRadius: BorderRadius.circular(8),
          //                   ),
          //                   onPressed: ()async {
          //                     context.read<AuthenticationBloc>().add(AuthenticationByGoogle());
          //                     BlocBuilder<AuthenticationBloc, AuthenticationState>(
          //                       builder: (context, state) {
          //                         if(state is AuthenticationAuthenticated){

                                  
          //                         state.userCredential.additionalUserInfo?.isNewUser == true ?
                      
          //                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          //                       return ProfileSetupScreen();
          //                     }), (route) => false)
          //                         :Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          //                       return Tabbar();
          //                     }), (route) => false);
                              
          //                    log(state.userCredential.toString());
          //                         }
          //                         if(state is AuthenticationFailed){
          //                           log(state.message);
          //                         }
          //                        return Text("Please wait");
          //                         // TODO: implement listener
          //                       },
                                
          //                     );
                             
         
                              
          //                   },
          //                 ),
          //      ),
          
        ]),
      ),
      
       

    );
}
   
















//   final FocusNode _focusNode = FocusNode();
//   final FocusNode _phoneFocusNode = FocusNode();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController countryController = TextEditingController();

//   String phonecode = '';
//   String countryName = "";
//   String flagicon = '';


// ValueNotifier<String> phoneNumber= ValueNotifier('');
//     // String phoneNumber = '';
  

//   void _onKeyTap(String value) {
//     // setState(() {
//       if (phoneNumber.value.length < 10) {
//         phoneNumber.value += value; // Append number to phone field
//         phoneController.text=phoneNumber.value;
        
//       }
//     // });
//   }

//   void _onBackspace() {

//       if (phoneNumber.value.isNotEmpty) {
//         phoneNumber.value = phoneNumber.value.substring(0, phoneNumber.value.length - 1);
//       }

//   }

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(milliseconds: 300), () {
//       FocusScope.of(context).requestFocus(_phoneFocusNode);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   backgroundColor: Colors.blueAccent,
//       //   child: Icon(Icons.arrow_forward, color: Colors.white),
//       // ),
//       body: SafeArea(
//           child: Column(
//             spacing: 20,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(height: 30,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 child: ValueListenableBuilder(valueListenable: phoneController,
//                 builder: (context, value, child) => 
//                    Column( spacing: 20,
//                     children: [
//                   Text("Your Phone number",style: AppTextStyle.mainTextStyle(context,fontSize: 22.sp),),
//                   Text(style: AppTextStyle.mainTextStyle(context,fontWeight: FontWeight.normal,),
//                     "Please confirm your country code\n and enter your phone number.",
//                     textAlign: TextAlign.justify,
//                   ),
//                    SizedBox(height: 3,),
//                   TextFormField(
//                     focusNode: _focusNode,
//                     readOnly: true,
//                     controller: countryController,
//                     onTap: () => showCountryPicker(
//                       context: context,
//                       onSelect: (value) {
//                         setState(() {
//                           phonecode = value.phoneCode!;
//                           countryName = value.name!;
//                           flagicon = value.flagEmoji;
//                           countryController.text = '$flagicon $countryName';
//                         });
//                           Future.delayed(Duration(milliseconds: 100), () {
//                           FocusScope.of(context).requestFocus(_phoneFocusNode);
//                         });
//                       },
//                     ),
//                     decoration: InputDecoration(suffixIcon: Icon(Icons.chevron_right),
//                       border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.greysearch)),
//                       labelText: countryName.isNotEmpty ? "Country" : null,
//                       hintText: "Country",
//                       hintStyle: AppTextStyle.mainTextStyle(context,fontWeight: FontWeight.w300),
//                       floatingLabelBehavior: FloatingLabelBehavior.auto,
//                     ),
//                   ),
//                    SizedBox(height: 7,),
//                   TextFormField( autofocus: true,
//                     focusNode: _phoneFocusNode,
//                     // keyboardType: TextInputType.phone,
//                     controller: phoneController,
//                     decoration: InputDecoration(
                          
//                         prefixText: '+$phonecode ',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         labelText: "Phone Number",
//                         labelStyle: TextStyle(color: Colors.blueAccent),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.blueAccent, width: 2)),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.blueAccent, width: 2))),
//                   ),
//                    SizedBox(height: 5,),
//                                Row(
//                    children: [Spacer(),
//                      FloatingActionButton(shape: CircleBorder(),
//                                onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                                   return Tabbar();
//                                 }));
//                                },
//                                backgroundColor: Colors.blueAccent,
//                                child: Icon(Icons.arrow_forward, color: Colors.white),
//                         ),
//                    ],
//                                ),]),
//                 ),
//               ),
            
//               buildKeyboard(),
//               SizedBox(height: 4,)
//             ],
//           )),
//     );
//   }
//   // Custom Keyboard Layout
//   Widget buildKeyboard() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: ["1", "2", "3"].map((e) => buildKey(e)).toList(),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: ["4", "5", "6"].map((e) => buildKey(e)).toList(),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: ["7", "8", "9"].map((e) => buildKey(e)).toList(),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(width: 138), // Empty Space
//             buildKey("0"),
//             buildKey("⌫", isBackspace: true),
//           ],
//         ),
//       ],
//     );
//   }

//   // Custom Key Button
//   Widget buildKey(String label, {bool isBackspace = false}) {
//     return InkWell(
//       onTap: isBackspace ? _onBackspace : () => _onKeyTap(label),
//       child: Container(
//         width: 128,
//         height: 60,
//         alignment: Alignment.center,
//         margin: EdgeInsets.all(3),
//         decoration: BoxDecoration(
//           color:  Colors.black12,
//           borderRadius: BorderRadius.circular(6)
//         ),
//         child: Text(
//           label,
//           style:AppTextStyle.mainTextStyle(context,fontSize: 20.sp)
//         ),
//       ),
//     );
//   }

 

}
