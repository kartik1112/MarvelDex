import 'package:flutter/material.dart';
import 'package:icon_swither/screens/home_screen.dart';
import 'package:icon_swither/screens/search_screen.dart';

class BaseScreenWidget extends StatefulWidget {
  const BaseScreenWidget({super.key});

  @override
  State<BaseScreenWidget> createState() => _BaseScreenWidgetState();
}

class _BaseScreenWidgetState extends State<BaseScreenWidget> {
  var activeScreen = "Home-Screen";
  void switchScreen() {
    setState(() {
      activeScreen = "Search-Screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Widget screenWidget = HomeScreen(switchScreen);
    
    // if (activeScreen=="Search-Screen"){
    //   screenWidget = const SearchScreenWidget();
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)),
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            centerTitle: true,
            title: const Text(
              "Marvel  Dex",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // body: (activeScreen == 'Home-Screen')?HomeScreen(switchScreen):const SearchScreenWidget()
          body: SearchScreenWidget(),
        ),
      ),
    );
  }
}
