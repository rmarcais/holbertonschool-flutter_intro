import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EpisodesScreen extends StatelessWidget {
  final int ? id;

  const EpisodesScreen({super.key, required this.id});

  fetchEpisodes(id) async {
    try {
        List<String> titles = [];
        final res = await http.get(Uri.parse("https://rickandmortyapi.com/api/character/$id"));
        final data = jsonDecode(res.body)["episode"];
        for (final url in data) {
          final episode = await http.get(Uri.parse(url));
          titles.add(jsonDecode(episode.body)["name"]);
        }
        return titles;
    } catch (error) {
        throw Exception(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty Episodes"),
      ),
      body: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else if (snapshot.hasData) {
              List<dynamic> episodes = snapshot.data as List<dynamic>;
              return ListView.builder(
                itemExtent: 38,
                itemCount: episodes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ListTile(
                      title: Text(
                        '* ${episodes[index]}',
                        style: const TextStyle(
                          fontSize: 20
                        ),
                  ))
                  );
                });
            }
          }
          return const Center(
              child: CircularProgressIndicator(),
          );
        }),
        future: fetchEpisodes(id),
      )
    );
  }
}
