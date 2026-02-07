import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/models/product_model.dart';
import 'package:to_do_app_bloc/repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit(this.productRepo) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    try {
      final List<ProductModel> products =
          await productRepo.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductErrorMessage(e.toString()));
    }
  }
}
