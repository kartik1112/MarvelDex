import 'package:flutter/material.dart';
import 'package:icon_swither/widgets/button_marvel_submit.dart';
import 'package:icon_swither/widgets/textfield_search_bar.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen(this.changeScreen,{super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 240, 20, 30),
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 216.0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
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
                  const SizedBox(
                      height: 50, width: 300, child: SearchBarTextField()),
                  //button
                  const SizedBox(
                    height: 24,
                  ),
                  MarvelButton(changeScreen),
                  // ElevatedButton(onPressed: (){changeScreen;}, child: Text("data")),
                  //created by
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          );
  }
}