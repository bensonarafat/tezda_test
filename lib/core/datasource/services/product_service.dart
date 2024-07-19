import 'package:tezda_test/core/datasource/remote/api.dart';
import 'package:tezda_test/core/models/product.dart';

class ProductService {
  final ApiDataSource dataSource;

  ProductService(
    this.dataSource,
  );

  Future<List<Product>> getProducts() async {
    final response =
        await dataSource.get("https://api.escuelajs.co/api/v1/products");

    if (response.statusCode == 200) {
      List<dynamic> jsonresponse = response.data;
      List<Product> players =
          jsonresponse.map((player) => Product.fromJson(player)).toList();
      return players;
    } else {
      throw Exception("Server Error");
    }
  }
}
