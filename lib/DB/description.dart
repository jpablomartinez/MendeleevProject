import 'package:hive/hive.dart';

part 'description.g.dart';

@HiveType(typeId: 1)
class Description extends HiveObject{
  @HiveField(0)
  final String atomicNumber;
  @HiveField(1)
  final String history;
  @HiveField(2)
  final String uses;
  @HiveField(3)
  final String bib;
  /*@HiveField(4)
  final String imagesPath;*/

  Description({
    this.atomicNumber,
    this.history,
    this.uses,
    this.bib
  });

  factory Description.fromJson(Map<dynamic, dynamic> obj){
    return Description(
        atomicNumber: obj['atomicNumber'],
        history: obj['history'],
        uses: obj['uses'],
        bib: obj['bib']
    );
  }

}

