/// * The product identifier is an important concept and can have its own type.
typedef ItemID = String;

/// Class representing a product.
class Item {
  const Item({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  /// Unique product id
  final ItemID id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  @override
  String toString() {
    return 'Product(id: $id, imageUrl: $imageUrl, title: $title, description: $description, proposal: $price';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    imageUrl.hashCode ^
    title.hashCode ^
    description.hashCode ^
    price.hashCode;
  }

  Item copyWith({
    ItemID? id,
    String? imageUrl,
    String? name,
    String? surname,
    double? proposal
  }) {
    return Item(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: name ?? this.title,
      description: surname ?? this.description,
      price: proposal ?? this.price,
    );
  }
}