// This is like a form we fill for each user
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? email;         // User's email address
  final String? uid;           // Unique ID from Firebase
  final bool isEmailVerified;  // Did they verify email?

  // Constructor to create a user
  UserModel({
    this.email,
    this.uid,
    this.isEmailVerified = false
  });

  // Special constructor from Firebase user
  factory UserModel.fromFirebase(User user) {
    return UserModel(
      email: user.email,               // Get email
      uid: user.uid,                   // Get unique ID
      isEmailVerified: user.emailVerified, // Check verification
    );
  }
}