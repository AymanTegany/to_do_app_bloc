part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

// الحالة الابتدائية
final class ProductInitial extends ProductState {}

// تحميل
final class ProductLoading extends ProductState {}

// نجاح + الداتا
final class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

// خطأ + رسالة
final class ProductErrorMessage extends ProductState {
  final String message;

  const ProductErrorMessage(this.message);

  @override
  List<Object?> get props => [message];
}
