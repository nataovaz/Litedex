import 'package:flutter/material.dart';
import 'package:litedex/components/not_found.dart';
import 'package:litedex/components/pokemon_info.dart';
import 'package:litedex/model/pokemon.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PokemonInfoScreen extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfoScreen({Key? key, required this.pokemon}) : super(key: key);

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name.toUpperCase());
    } else {
      return const Text("Pokémon não encontrado...");
    }
  }

  Widget buildStatRow(String label, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget buildStatList() {
    return Column(
      children: [
        buildStatRow("HP", pokemon!.stats.hp),
        buildStatRow("Ataque", pokemon!.stats.attack),
        buildStatRow("Defesa", pokemon!.stats.defense),
      ],
    );
  }

  List<Widget> buildTypeChips() {
    return pokemon!.types.map((type) {
      return Chip(
        label: Text(type),
        backgroundColor: _getColorByType(type),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    }).toList();
  }

  Color _getColorByType(String type) {
    switch (type) {
      case 'Fire':
        return Colors.orange;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.yellow;
      case 'Ice':
        return Colors.lightBlue;
      case 'Fighting':
        return Colors.red;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.brown;
      case 'Flying':
        return Colors.lightBlue;
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.green;
      case 'Rock':
        return Colors.brown;
      case 'Ghost':
        return Colors.purple;
      case 'Dragon':
        return Colors.indigo;
      case 'Dark':
        return Colors.black;
      case 'Steel':
        return Colors.grey;
      case 'Fairy':
        return Colors.pink;
      default:
        return Colors.white;
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: getTitle(),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "#${pokemon!.id}",
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "#${pokemon!.name}",
                  style: const TextStyle(
                    fontSize: 64.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    color: pokemon != null ? _getColorByType(pokemon!.types.first) : Colors.transparent,
                  ),
                  Center(
                    child: SvgPicture.network(
                      pokemon!.image,
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Stats",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildStatList(),
              ],
            ),
          ),
         
        ],
      ),
    ),
  );
}}