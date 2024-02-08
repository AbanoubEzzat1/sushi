import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/models/shoop.dart';
import 'package:sushi/sushi_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Shop(),
      child: const Sushi(),
    ),
  );
}
