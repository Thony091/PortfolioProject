
import '../../config/config.dart';
import '../../domain/domain.dart';

class ServiceMapper {

  static jsonToEntity( Map<String, dynamic> json) => Services(
    id: json['id'].toString(), 
    name: json['name'] ?? '', 
    description: json['description'] ?? '', 
    minPrice: double.parse( json['minPrice'].toString() ), 
    maxPrice: double.parse( json['maxPrice'].toString() ), 
    images: json['images'] != null 
      ? List<String>.from(json['images'].map(
        (image) => image.startsWith('http')
          ? image 
          : '${Enviroment.baseUrl}/service-rest/$image'
        ))
      : [], 
    isActive: json['active'],
  );

}