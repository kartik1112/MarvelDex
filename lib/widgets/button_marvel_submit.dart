import 'package:flutter/material.dart';

class MarvelButton extends StatelessWidget {
  const MarvelButton(this.changeScreen, {super.key});
  
  final void Function() changeScreen;
  // final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        changeScreen;
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          elevation: 10,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 240, 20, 30)),
      child: const Text(
        "Search My Supe..!",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
