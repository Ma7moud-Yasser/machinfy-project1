import '../../../core/models/categories_model.dart'; // استيراد الموديل بدلاً من إعادة تعريف Category

class BannerModel {
  bool status;
  dynamic message;
  List<BannerData> data;

  BannerModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      status: json['status'],
      message: json['message'],
      data: List<BannerData>.from(
        json['data'].map((x) => BannerData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class BannerData {
  int id;
  String image;
  Category? category;
  dynamic product;

  BannerData({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      id: json['id'],
      image: json['image'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      product: json['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'category': category?.toJson(),
      'product': product,
    };
  }
}
