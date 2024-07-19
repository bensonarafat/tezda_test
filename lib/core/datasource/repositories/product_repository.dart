import 'package:tezda_test/core/datasource/services/product_service.dart';
import 'package:tezda_test/core/models/product.dart';

abstract class ProductRepository {
  Stream<List<Product>> getProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;
  ProductRepositoryImpl(this.productService);
  @override
  Stream<List<Product>> getProducts() =>
      productService.getProducts().asStream();
}
