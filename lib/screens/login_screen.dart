// import 'package:firestore_app/auth/firebase_auth.dart';
// import 'package:firestore_app/screens/add_post_screen.dart';
// import 'package:firestore_app/screens/chat/chat_user_list_screen.dart';
// import 'package:firestore_app/screens/chat/rooms.dart';
// import 'package:flutter/material.dart';
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   TextEditingController emailController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [TextButton(onPressed: (){}, child: Text("Sign Up"))],
//       ),
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
//
//
//           TextButton(onPressed: ()async{
//             await Auth.loginUser(email: emailController.text, password: passwordController.text);
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
