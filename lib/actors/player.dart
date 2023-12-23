import 'dart:async';
import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState {idle, running}

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure>{

  String character;
  Player({position, required this.character}) : super(position: position) ; // constructor
  
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05; // better to use a variable like that since it could change in the future

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }
  
  void _loadAllAnimations() {

    // idleAnimation = SpriteAnimation.fromFrameData(game.images.fromCache('Main Characters/Ninja Frog/Idle (32x32).png'), SpriteAnimationData.sequenced(
    //   amount: 11, // nb of images (frames) in the animation
    //   stepTime: stepTime, // 50 ms i.e. 20 fps
    //   textureSize: Vector2.all(32),
    //   ));

    // runningAnimation = SpriteAnimation.fromFrameData(game.images.fromCache('Main Characters/Ninja Frog/Run (32x32).png'), SpriteAnimationData.sequenced(
    //   amount: 12,
    //   stepTime: stepTime,
    //   textureSize: Vector2.all(32),
    //   ));

    idleAnimation = _spriteAnimation('Idle', 11);
    runningAnimation = _spriteAnimation('Run', 12);

      // list of all animations
      animations = {
        PlayerState.idle: idleAnimation,
        PlayerState.running: runningAnimation
      };
      
      // set current animation
      current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) { // method to not repeat the same code over and over for different animations
    return SpriteAnimation.fromFrameData(game.images.fromCache('Main Characters/$character/$state (32x32).png'), SpriteAnimationData.sequenced(
      amount: amount, // nb of images(frames) in the animation
      stepTime: stepTime, // 50 ms i.e. 20 fps
      textureSize: Vector2.all(32),
      ));
  }
}