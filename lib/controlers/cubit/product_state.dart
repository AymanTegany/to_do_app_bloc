part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

final class ProductLoding extends ProductState {


}
final class ProductLoaded extends ProductState {}
final class ProductErrorMessage extends ProductState {}


