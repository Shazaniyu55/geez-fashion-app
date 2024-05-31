import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geez/UI/pages/splashscreen/splash.dart';
import 'package:geez/constants/colors.dart';
import 'package:geez/controller/auth.dart';
import 'package:geez/firebase_options.dart';
import 'package:geez/provider/user.dart';
import 'package:geez/responsive/mobile.dart';
import 'package:geez/responsive/res.dart';
import 'package:geez/responsive/web.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const CheckUserLoggedIn(),
      ),
    );
  }
}

class CheckUserLoggedIn extends StatefulWidget {
  const CheckUserLoggedIn({super.key});

  @override
  State<CheckUserLoggedIn> createState() => _CheckUserLoggedInState();
}

class _CheckUserLoggedInState extends State<CheckUserLoggedIn> {
  @override
  void initState() {
    AuthMethods.isLoggedIn().then((value) => {
          if (value)
            {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const ResponsiveLayout(
                      mobileScreenLayout: MobileScreenLayout(),
                      webScreenLayout: WebScreenLayout(),
                    ),
                  ),
                  (route) => false)
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
