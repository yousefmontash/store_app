import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:strore_app/helper/api.dart';
import 'package:strore_app/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  List<ProductModel> productsList = [];
  void getAllProducts() async {
    emit(ProductsLoading());
    try {
      List<dynamic> data =
          await Api().get(url: "https://fakestoreapi.com/products");
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJason(data[i]),
        );
      }
      emit(ProductsSuccess());
    } catch (e) {
      print(e);
      emit(ProductsFailed());
    }
  }
}
