import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/models.dart';
import 'package:rick_and_morty_application/episodes_screen.dart';

class CharacterTile extends StatelessWidget {
  final Character? character;

  const CharacterTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
        character?.name ?? "",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          height: 2.5,
        ),)
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EpisodesScreen(id: character?.id)));
        },
        child: Image(image: NetworkImage(character?.img ?? "")),
      ),
    );
  }
}
