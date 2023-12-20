import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // waits for flutter to be initialized
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  PixelAdventure game = PixelAdventure();
  runApp(GameWidget(game: kDebugMode ? PixelAdventure() : game)); // when debugging, restart game at every save; otherwise, game
}
