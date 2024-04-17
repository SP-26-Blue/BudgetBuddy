// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart'; // For PlatformException
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);
//
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//
//   Future<bool> isUsernameUnique(String username) async {
//     final query = await FirebaseFirestore.instance
//         .collection('users')
//         .where('username', isEqualTo: username)
//         .get();
//     return query.docs.isEmpty;
//   }
//
//   Future<void> signUp() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Create user with email and password
//         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//         // Add additional user information (e.g., username) to Firestore
//         await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//           'username': _nameController.text,
//           // Other fields can be added here
//         });
//         // Navigate to the next page or show success message
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up successful')));
//         // Navigator.pushReplacementNamed(context, '/dashboard');
//       } on FirebaseAuthException catch (e) {
//         // Handle errors, e.g., email already in use
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Unknown error')));
//       } catch (e) {
//         // Handle any other errors
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to sign up')));
//       }
//     }
//   }
