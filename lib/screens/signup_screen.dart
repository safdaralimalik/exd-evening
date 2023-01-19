// import 'package:firestore_app/auth/firebase_auth.dart';
// import 'package:firestore_app/screens/add_post_screen.dart';
// import 'package:firestore_app/screens/chat/chat_user_list_screen.dart';
// import 'package:firestore_app/screens/chat/rooms.dart';
// import 'package:flutter/material.dart';
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//
//   TextEditingController emailController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();
//   TextEditingController nameController=TextEditingController();
//   TextEditingController phoneController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           TextFormField(
//            controller: emailController,
//             decoration: InputDecoration(
//               hintText: "Email"
//             ),
//           ),
//           TextFormField(
//             controller: passwordController,
//             decoration: InputDecoration(
//                 hintText: "Password"
//             ),
//           ),
//           TextFormField(
//             controller: nameController,
//             decoration: InputDecoration(
//                 hintText: "name"
//             ),
//           ),
//           TextFormField(
//             controller: phoneController,
//             decoration: InputDecoration(
//                 hintText: "Phone"
//             ),
//           ),
//
//           TextButton(onPressed: ()async{
//             await Auth.signupUser(email: emailController.text, password: passwordController.text, fullName: nameController.text, phoneNumber: phoneController.text);
//
//
//             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RoomsPage()));
//
//           }, child: Text("Sign Up"))
//         ],
//       ),
//     );
//   }
// }
