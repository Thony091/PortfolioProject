import '../../domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository {

  final ProductsDatasource datasource;

  ProductsRepositoryImpl( this.datasource );

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productSimilar) {
    return datasource.createUpdateProduct(productSimilar);
  }

  @override
  Future<Product> getProductById(String id) {
    return datasource.getProductById(id);
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) {
    return datasource.getProductsByCategory(categoryId);
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) {
    return datasource.getProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    return datasource.searchProductByTerm(term);
  }
  
  @override
  Future<void> deleteProduct(String id) {
    return datasource.deleteProduct(id);
  }

}