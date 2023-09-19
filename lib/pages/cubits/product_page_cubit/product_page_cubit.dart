import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:strore_app/models/product_model.dart';
import 'package:strore_app/services/put_product_service.dart';

part 'product_page_state.dart';

class ProductPageCubit extends Cubit<ProductPageState> {
  ProductPageCubit() : super(ProductPageInitial());

  Future<void> updateProduct(ProductModel product, String? name, String? price,
      String? desc, String? image) async {
    emit(ProductPageLoading());
    try {
      await PutProductService().putProduct(
          id: product.id,
          title: name == null ? product.title : name,
          price: price == null ? product.price.toString() : price,
          description: desc == null ? product.description : desc,
          image: image == null ? product.image : image,
          category: product.category);
      emit(ProductPageSucceed());
    } catch (e) {
      emit(ProductPagefailed(errMessage: e.toString()));
    }
  }
}
