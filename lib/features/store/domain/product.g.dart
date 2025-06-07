// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
      name: json['name'] as String,
      brand: json['brand'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'model': instance.model,
    };
