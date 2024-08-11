class ProductEntity {
  String? id;
  String? name;
  String? image;
  String? shortDescription;
  String? description;
  String? vendor;
  int? basePrice;
  int? discountedPrice;
  int? minimumSellingPrice;
  int? comission;
  String? category;
  ProductDataEntity? data;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductEntity({
    this.id,
    this.name,
    this.image,
    this.shortDescription,
    this.description,
    this.vendor,
    this.basePrice,
    this.discountedPrice,
    this.minimumSellingPrice,
    this.comission,
    this.category,
    this.data,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}

class ProductDataEntity {
  String? level;
  String? group;

  ProductDataEntity({
    this.level,
    this.group,
  });
}
