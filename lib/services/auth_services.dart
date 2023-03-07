import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:improvescap/models/daily_goals_model.dart';
import 'package:improvescap/models/user_model.dart' as model;

import '../utils/storage.dart';


class AuthResources{
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  Future<model.UserModel> getUserDetails()async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore
        .collection('user')
        .doc(currentUser.uid)
        .get();
    return model.UserModel.fromMap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String dateofBirth,
    required String country,
    required Uint8List file,
  }) async{
    String res = "some error occurred";
    try{
      // if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty)
      // {
      //   UserCredential cred = await _auth.createUserWithEmailAndPassword(
      //       email: email,
      //       password: password);
      //   print(cred.user!.uid);
      //   String  photoUrl = await StorageResource().
      //   uploadImageToStorage('profilePic', file, false);
      //   model.UserModel user = model.UserModel(
      //     username: username,
      //     uid : cred.user!.uid,
      //     email: email,
      //     dateofBirth: dateofBirth,
      //     country : country,
      //     photoUrl : photoUrl,
      //   );
      //   await _firestore.collection('user').doc(cred.user!.uid).set(user.toMap());
      //   res = "success";
      // }
      {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password);
        print(cred.user!.uid);
        String  photoUrl = await StorageResource().
        uploadImageToStorage('profilePic', file, false);
        model.UserModel user = model.UserModel(
          username: username,
          uid : cred.user!.uid,
          email: email,
          dateofBirth: dateofBirth,
          country : country,
          photoUrl : photoUrl,
        );
        await _firestore.collection('user').doc(cred.user!.uid).set(user.toMap());
        res = "success";
      }
    }
    // on FirebaseAuthException catch(err){
    //   if(err.code == "invalid-email"){
    //     res = "The Email is badly formatted";
    //   }else if(err.code == "weak-password"){
    //     res = "Your Password should be at least 6 characters";
    //     _isLoading = false;
    //   }
    //   else {
    //     res = "please enter all the fields";
    //     _isLoading = false;
    //   }
    // }
    catch(err){
      res = err.toString();
      _isLoading = false;
    }
    return res;
    _isLoading = false;
  }
  Future<String> loginUser({
    required String email,
    required String password,
  })async{
    String res = "some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty ){
        await _auth.signInWithEmailAndPassword(
            email: email,
            password: password);
        res = "success";
      }else{
        res = "please enter all the fields";
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;
  }
}
