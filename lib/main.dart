import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gobarber/pages/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página Inicial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Este é o tema da sua aplicação;
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Página inicial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) print("Erro encontrado ao setar o firebase");
          if (snapshot.connectionState == ConnectionState.done) {
            return _introScreen();
          } else
            return CircularProgressIndicator();
        });
  }

  Widget _introScreen() {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            loaderColor: Colors.transparent,
            routeName: "/",
            navigateAfterSeconds: new LoginScreen(),
            backgroundColor: '#312E38'.toColor(),
          ),
          Center(
            child: Container(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
          )
        ],
      ),
    );
  }
}
