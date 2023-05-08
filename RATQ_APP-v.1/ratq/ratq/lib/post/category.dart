class Category {
  final String id;
  final String categoryName;

  Category({
    required this.id,
    required this.categoryName,
  });
}

List<Category> categorys = [
  Category(
    id: 'A',
    categoryName: "All",
  ),
  Category(id: 'B', categoryName: "Books"),
  Category(id: 'T', categoryName: "Tools"),
  Category(id: 'F', categoryName: "furniture"),
  Category(id: 'E', categoryName: "Electrunic")
];
