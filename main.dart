import 'package:clothify/authentication/authentication.dart';
import 'package:clothify/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String StripePublishKey ='pk_live_51Ny7b4AnquU4BVUVWwYa7BhKPdRPxRbG2qn14k9UIXJEeY7O89M4DSU1rPKWII9R010Yf5O1J2HKORgYdqeA0Ll40021cxWkQf';
  Stripe.publishableKey=StripePublishKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
        initialData: null,
        value: Authservice().authStateChanges,
    child: MaterialApp(
    home: Wrapper(),
    )
    );
  }
}

