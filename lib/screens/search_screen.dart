import 'dart:async';
// import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:icon_swither/data/marvel_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:icon_swither/models/marvelmodel.dart';
import 'package:icon_swither/widgets/power_level_indicator.dart';
import 'package:svg_flutter/svg_flutter.dart';

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
    // return Image.network("https://picsum.photos/250?image=9");

    return ClipRRect(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 240, 20, 30),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 156.0,
          )
        ],
      ),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          // Text("data"),
          //logo
          // SvgPicture.asset('lib/assets/marvel.svg'),
          Image.network(
            _imageUrl,
            scale: 1,
            height: 100,
          ),
          Text(_model.datamodel.name),
          Column(
            children: [
              ...List.generate(_marvelPower.length, (index) => 
              PowerLevelIndicator(_marvelPower[index],double.parse(_marvelPowerLevel[index]) / 100))
            ],
          )
          // createImageCodecFromUrl(Uri(path: datamodel.image['url'].toString()))
          // CachedNetworkImage(imageUrl: _model.datamodel.image['url'].toString(), placeholder: (context, url) => const CircularProgressIndicator(), errorWidget: (context, url, error) => const Icon(Icons.abc_outlined)),

          // Image.network('https://picsum.photos/250?image=9')
        ],
      ),
    ));
  }
}
