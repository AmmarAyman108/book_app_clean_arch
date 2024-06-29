 import 'package:hive/hive.dart';
  part 'book_entity.g.dart';
  
 @HiveType(typeId: 0)
class BookEntity extends HiveObject {
   @HiveField(0)
  String? image;
   @HiveField(1)
  String bookId;
   @HiveField(2)
  String title;
   @HiveField(3)
  String? authorName;
   @HiveField(4)
  String? rating;
   @HiveField(5)
  num? price;
   @HiveField(6)
  String? url;
  BookEntity({
    required this.image,
    required this.bookId,
    required this.title,
    required this.authorName,
    required this.rating,
    required this.price,
    required this.url
  });
}
