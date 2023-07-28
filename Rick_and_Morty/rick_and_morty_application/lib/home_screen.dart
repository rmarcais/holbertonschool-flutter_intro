import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_application/models.dart';
import 'package:rick_and_morty_application/character_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  fetchBbCharacters() {
      return Future.delayed(const Duration(seconds: 1), () async {
        try {
          final res = await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));
          final characters = jsonDecode(res.body)["results"];
          return characters;
      } catch (error) {
          throw Exception(error);
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty Characters"),
      ),
      body: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else if (snapshot.hasData) {
              List<dynamic> data = snapshot.data as List<dynamic>;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                  itemCount: data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return (CharacterTile(character: Character.fromJson(data[index])));
                });
            }
          }
          return const Center(
              child: CircularProgressIndicator(),
          );
        }),
        future: fetchBbCharacters(),
      ),
    );
  }
}
