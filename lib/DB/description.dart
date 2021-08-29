import 'package:hive/hive.dart';

part 'description.g.dart';

@HiveType(typeId: 1)
class Description extends HiveObject{
  @HiveField(0)
  final int atomicNumber;
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
        atomicNumber: obj['z'],
        history: obj['desc1'],
        uses: obj['desc2'],
        bib: obj['bib']
    );
  }

}

