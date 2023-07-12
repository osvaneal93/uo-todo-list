import 'package:flutter/material.dart';

enum FlavorsEnvironment {
  dev(name: 'Developer', apiKey: '01', colorScheme: Colors.blue),
  prod(name: 'Prod', apiKey: '02', colorScheme: Colors.yellow);

  final String apiKey, name;
  final Color colorScheme;

  const FlavorsEnvironment({required this.apiKey, required this.colorScheme, required this.name});
}
