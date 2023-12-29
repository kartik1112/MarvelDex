import 'package:flutter/material.dart';
import 'package:icon_swither/screens/search_screen.dart';
import 'package:icon_swither/widgets/marvel_text.dart';
import 'package:string_extensions/string_extensions.dart';

class SuperHeroCard extends StatelessWidget {
  const SuperHeroCard(this.supeName, this.url, {super.key});

  final String url;
  final String supeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreenWidget(3)),
      ),
      child: Card(
        shadowColor: Colors.redAccent,
        elevation: 10,
        surfaceTintColor: Colors.red,
        color: Colors.grey.shade200.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                url,
                scale: 1,
              ),
            ),
            MarvelTextWidget(20, supeName.capitalize!),
            // Text("data"),
          ],
        ),
      ),
    );
  }
}
