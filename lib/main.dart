import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';

var x = 0.0;
bool isMoveRight = false;
void main() {
  runApp(
     Center(
      child: Column(
        children: [
          Text(
        "Haha Game",
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.blue),
        ),
        Expanded(child: 
          GameWidget(
            game: MyGame(),
          ),
        )
         
        ],
      )
      
    ),
  );
}

class MyGame extends FlameGame {
  late final SpriteAnimationComponent player;

  @override
  Future<void> onLoad() async {
    final size = Vector2.all(32.0);
    final image = await images.load('character.png');
    final data = SpriteAnimationData.sequenced(
      textureSize: size,
      amount: 8,
      stepTime: 0.1,
      texturePosition: Vector2(0, 32)
    );
    player = SpriteAnimationComponent.fromFrameData(
      await images.load('character.png'),
      data,
    );
    player.position = Vector2(20, 50);
    // final spriteSheet = SpriteSheet(
    //   image: image,
    //   srcSize: Vector2.all(32.0),
    // );
    // final animation = spriteSheet.createAnimation(row: 1, stepTime: 0.1, to:8);
    // player = SpriteAnimationComponent(
    // animation: animation,
    // size: Vector2.all(32.0),
    // );
    add(player);
    add(MyComponent());
  }
}
// class MyWorld extends World {
//   @override
//   Future<void> onLoad() async {
//     add(
//       player
//     );
//     add(MyComponent());
//   }
// }

class Player extends SpriteComponent {
  Player({
    super.position,
  }) : super(
          size: Vector2.all(200),
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(
      'character.png',
    );
  }
}
class MyComponent extends PositionComponent with TapCallbacks, HasGameReference<MyGame> {
  MyComponent() : super(
    position: Vector2(0, 0),
    size: Vector2(600, 600));

  @override
  void onTapDown(TapDownEvent event) {
    game.player.position.x += 3;
    isMoveRight = true;
    print("tap down is herrrr");
  }
  @override
  void onTapUp(TapUpEvent event) {
    isMoveRight = false;
    print("tap up");
  }

  @override
  void update(double dt) {
    if (isMoveRight) {
    }
  }
}