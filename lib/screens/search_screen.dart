import 'package:flutter/material.dart';
import 'package:icon_swither/data/marvel_data.dart';
import 'package:icon_swither/widgets/marvel_text.dart';
import 'package:icon_swither/widgets/power_level_indicator.dart';
import 'package:string_extensions/string_extensions.dart';

class SearchScreenWidget extends StatefulWidget {
  const SearchScreenWidget({super.key});

  @override
  State<SearchScreenWidget> createState() => _SearchScreenWidgetState();
}

class _SearchScreenWidgetState extends State<SearchScreenWidget> {
  final MarvelData _model = MarvelData();
  final index1 = 0;
  final List<String> _marvelPower =
      MarvelData().datamodel[3].powerStats.keys.toList();
  final List<String> _marvelPowerLevel =
      MarvelData().datamodel[3].powerStats.values.toList();

  bool _isLoading = true;
  String _imageUrl = "";

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    var urlImage = await _model.datamodel[3].image['url'].toString();
    setState(() {
      _imageUrl = urlImage;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized;

    return Container(
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // boxShadow: ,
          color: Colors.grey.shade200.withOpacity(0.5),
          shape: BoxShape.rectangle),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Container(
              // width: double.infinity,
              // alignment: Alignment.bottomCenter,
              // decoration: BoxDecoration(color: Colors.white),
              child: Row(
                // mainAxisAlignment: ,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      _imageUrl,
                      scale: 1,
                    ),
                  ),
                  SizedBox(width: 24,),
                  MarvelTextWidget(30, _model.datamodel[3].name.capitalize!),

                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                ...List.generate(
                    _marvelPower.length,
                    (index) => PowerLevelIndicator(_marvelPower[index],
                        double.parse(_marvelPowerLevel[index]) / 100))
              ],
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            
          ],
        ),
      );
  }
}
