import 'package:flutter/material.dart';
import 'package:litedex/model/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  
  const PokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Altura: ${pokemon.height}'),
        Text('Peso: ${pokemon.weight}'),
        Text('HP: ${pokemon.stats.hp}'),
        Text('Ataque: ${pokemon.stats.attack}'),
        Text('Defesa: ${pokemon.stats.defense}'),
        
      ],
    );
  }
}