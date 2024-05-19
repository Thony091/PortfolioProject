import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

class ProductsDatasourceImpl extends ProductsDatasource {

  late final Dio dio;
  final String accessToken;

  ProductsDatasourceImpl({
    required this.accessToken
  }) : dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.baseUrl,
      headers: {
        'Authorization': 'Bearer $accessToken'
      }
    )
  );


  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productSimilar) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) async {
    
    final response = await dio.get('/products', queryParameters: {
      'limit': limit,
      'offset': offset
    });

    final List<Product> products = [];

    for ( final product in response.data ?? [] ) {
      products.add( ProductMapper.jsonToEntity(product) );
    }
    
    return products;
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }

}