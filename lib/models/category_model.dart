
class CategoryModel  {
  final String id;
  final String title;
  final String imageUrl;
 const CategoryModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

   get category {
     return title;
   }
}
