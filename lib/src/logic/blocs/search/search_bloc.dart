import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterzon/src/data/models/product.dart';
import 'package:flutterzon/src/data/repositories/account_repository.dart';
import 'package:flutterzon/src/data/repositories/product_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductsRepository searchProductRepository;
  final AccountRepository accountRepository = AccountRepository();

  SearchBloc(this.searchProductRepository) : super(SearchLoadingS()) {
    on<SearchEvent>(_searchEventHandler);
  }

  void _searchEventHandler(event, emit) async {
    try {
      emit(SearchLoadingS());
      List<Product> searchProducts;
      List<double> averageRatingList = [];
      double rating;

      searchProducts =
          await searchProductRepository.searchProducts(event.searchQuery);

      for (int i = 0; i < searchProducts.length; i++) {
        rating =
            await accountRepository.getAverageRating(searchProducts[i].id!);
        averageRatingList.add(rating);
      }

      emit(
        SearchSuccessS(
          searchProducts: searchProducts,
          averageRatingList: averageRatingList,
        ),
      );
    } catch (e) {
      emit(SearchErrorS(errorString: e.toString()));
    }
  }
}
