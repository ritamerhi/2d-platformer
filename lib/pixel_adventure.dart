import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure/levels/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30); // to remove the black sides on phone
  late final CameraComponent cam;

  final world = Level(
    levelName: 'Level-01'
  );

  @override
  FutureOr<void> onLoad() async {

    await images.loadAllImages(); // load all images into cache

    cam = CameraComponent.withFixedResolution(world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    return super.onLoad();
  }
}