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
  final List<String> _marvelPower =
      MarvelData().datamodel.powerStats.keys.toList();
  final List<String> _marvelPowerLevel =
      MarvelData().datamodel.powerStats.values.toList();

  bool _isLoading = true;
  String _imageUrl = "";

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    var urlImage = await _model.datamodel.image['url'].toString();
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
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Container(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  _imageUrl,
                  scale: 1,
                ),
              ),
            ),
            MarvelTextWidget(30, _model.datamodel.name.capitalize!),
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
