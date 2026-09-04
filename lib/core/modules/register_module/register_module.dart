import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();


  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @singleton
  Stripe get stripe => Stripe.instance;

  @singleton
  FlutterSecureStorage get secureStorage => FlutterSecureStorage();

  @singleton
  Supabase get supabaseStorage => Supabase.instance;
}
