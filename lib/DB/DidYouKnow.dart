import 'package:hive/hive.dart';

part 'DidYouKnow.g.dart';

@HiveType(typeId: 2)
class DidYouKnow extends HiveObject{

  @HiveField(0)
  final int amount;
  @HiveField(1)
  final String text;

  DidYouKnow({
    this.amount,
    this.text
  });
}