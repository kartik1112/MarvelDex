import 'package:flutter/material.dart';
import 'package:icon_swither/widgets/button_marvel_submit.dart';
import 'package:icon_swither/widgets/textfield_search_bar.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        // physics: ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          //logo
          SvgPicture.asset(
            'lib/assets/marvel.svg',
            height: 100,
          ),
          const SizedBox(
            height: 24,
          ),
          //searchbar
          const SizedBox(height: 50, width: 300, child: SearchBarTextField()),
          //button
          const SizedBox(
            height: 24,
          ),
          MarvelButton(changeScreen),

          // Lottie.network('https://lottie.host/a999842e-66c1-443a-9419-5d2894dd2981/5CmnsWsFMC.json'),

          Container(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              )),

          // Card(color: Colors.amber,child: Text("data")),

          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
