import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';

class ProductsResponseModel {
  String? message;
  List<ProductModel>? products;

  ProductsResponseModel({
    this.message,
    this.products,
  });

  ProductsResponseModel copyWith({
    String? message,
    List<ProductModel>? products,
  }) =>
      ProductsResponseModel(
        message: message ?? this.message,
        products: products ?? this.products,
      );

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductsResponseModel(
        message: json["message"],
        products: json["products"] == null
            ? []
            : List<ProductModel>.from(
                json["products"]!.map((x) => ProductModel.fromJson(x))),
      );
}

class ProductDetailsResponseModel {
  String? message;
  ProductModel? product;

  ProductDetailsResponseModel({
    this.message,
    this.product,
  });

  ProductDetailsResponseModel copyWith({
    String? message,
    ProductModel? product,
  }) =>
      ProductDetailsResponseModel(
        message: message ?? this.message,
        product: product ?? this.product,
      );

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResponseModel(
        message: json["message"],
        product: json["product"] == null
            ? null
            : ProductModel.fromJson(json["product"]),
      );
}

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.name,
    super.image,
    super.shortDescription,
    super.description,
    super.vendor,
    super.basePrice,
    super.discountedPrice,
    super.minimumSellingPrice,
    super.comission,
    super.category,
    super.data,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? image,
    String? shortDescription,
    String? description,
    String? vendor,
    int? basePrice,
    int? discountedPrice,
    int? minimumSellingPrice,
    int? comission,
    String? category,
    ProductDataModel? data,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
        vendor: vendor ?? this.vendor,
        basePrice: basePrice ?? this.basePrice,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        minimumSellingPrice: minimumSellingPrice ?? this.minimumSellingPrice,
        comission: comission ?? this.comission,
        category: category ?? this.category,
        data: data ?? this.data,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        shortDescription: json["short_description"],
        description: json["description"],
        vendor: json["vendor"],
        basePrice: json["base_price"],
        discountedPrice: json["discounted_price"],
        minimumSellingPrice: json["minimum_selling_price"],
        comission: json["comission"],
        category: json["category"],
        data: json["data"] == null
            ? null
            : ProductDataModel.fromJson(json["data"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class ProductDataModel extends ProductDataEntity {
  ProductDataModel({
    super.level,
    super.group,
  });

  ProductDataModel copyWith({
    String? level,
    String? group,
  }) =>
      ProductDataModel(
        level: level ?? this.level,
        group: group ?? this.group,
      );

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        level: json["level"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "group": group,
      };
}
