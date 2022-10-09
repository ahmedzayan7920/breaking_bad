import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/quote_model.dart';
import 'package:breaking_bad/data/repositories/quotes_repository.dart';
import 'package:meta/meta.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final QuotesRepository quotesRepository;
  late List<QuoteModel> quotes = [];

  QuotesCubit(this.quotesRepository) : super(QuotesInitial());

  List<QuoteModel> getCharacterQuotes(String characterName) {
    // quotes.clear();
    quotesRepository.getCharacterQuotes(characterName).then((quotes) {
      emit(QuotesLoaded(quotes));
      this.quotes = quotes;
    });
    return quotes;
  }
}
