import 'package:portafolio_project/config/constants/enviroment.dart';

import '../../domain/domain.dart';

class ProductMapper {

  static jsonToEntity( Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    price: double.parse( json['price'].toString()),
    stock: json['stock'],
    // categoryId: json['category_id'],
    images: List<String>.from( 
      json['images'].map(
        (image) => image.startsWith('http') 
        ? image 
        : '${Enviroment.baseUrl}/$image',
      )
    ),
    isActive: json['is_active'], 
    categoryId: json['category_id'],
  );

}