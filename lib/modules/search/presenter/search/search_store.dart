import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:mobx/mobx.dart';
import 'package:async/async.dart';
import 'states/search_state.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final SearchByText searchByText;
  CancelableOperation cancellableOperation;

  _SearchStoreBase(this.searchByText) {
    reaction((_) => searchText, (text) async {
      stateReaction(text, cancellableOperation);
    }, delay: 500);
  }

  Future stateReaction(String text,
      [CancelableOperation cancellableOperation]) async {
    await cancellableOperation?.cancel();
    cancellableOperation =
        CancelableOperation<SearchState>.fromFuture(makeSearch(text));
    if (text.isEmpty) {
      setState(StartState());
      return;
    }

    setState(LoadingState());

    setState(await cancellableOperation.valueOrCancellation(LoadingState()));
  }

  Future<SearchState> makeSearch(String text) async {
    var result = await searchByText(text);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  @observable
  String searchText = "";

  @observable
  SearchState state = StartState();

  @action
  setSearchText(String value) => searchText = value;

  @action
  setState(SearchState value) => state = value;
}
