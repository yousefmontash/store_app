part of 'product_page_cubit.dart';

@immutable
abstract class ProductPageState {}

class ProductPageInitial extends ProductPageState {}

class ProductPageLoading extends ProductPageState {}

class ProductPageSucceed extends ProductPageState {}

class ProductPagefailed extends ProductPageState {
  String errMessage;
  ProductPagefailed({required this.errMessage});
}
