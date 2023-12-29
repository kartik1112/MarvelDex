import 'package:flutter/material.dart';
import 'package:icon_swither/data/marvel_data.dart';
import 'package:icon_swither/widgets/button_marvel_submit.dart';
import 'package:icon_swither/widgets/supe_card.dart';
import 'package:icon_swither/widgets/textfield_search_bar.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MarvelData _model = MarvelData();

  final index1 = 0;

  // final List<String> _marvelPower =
  //     MarvelData().datamodel[3].powerStats.keys.toList();

  // final List<String> _marvelPowerLevel =
  //     MarvelData().datamodel[3].powerStats.values.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        children: [

          
          // Flexible(
          //   flex: 1,
          //   child: Container(),
          // ),
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
          MarvelButton(widget.changeScreen),

          // Lottie.network('https://lottie.host/a999842e-66c1-443a-9419-5d2894dd2981/5CmnsWsFMC.json'),

          SizedBox(
            height: 300,
            child: GridView.count(
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              // crossAxisCount: 2,
              shrinkWrap: true,
                childAspectRatio: 1,
              physics: const ClampingScrollPhysics(),
              // itemCount: _model.datamodel.length,
              // itemBuilder: (context, index) {
              //   SuperHeroCard(_model.datamodel[index].name,
              //       _model.datamodel[index].image['url'].toString());
              // },
              children: [
                ...List.generate(
                  _model.datamodel.length,
                  (index) => SuperHeroCard(
                    _model.datamodel[index].name,
                    _model.datamodel[index].image['url'].toString()
                    )
              )
              ],
            ),
          ),

          // Card(color: Colors.amber,child: Text("data")),

          // Flexible(
          //   flex: 1,
          //   child: Container(),
          // ),
        ],
      ),
    );
  }
}
