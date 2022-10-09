import 'package:breaking_bad/data/models/quote_model.dart';
import 'package:breaking_bad/data/web_services/quotes_web_services.dart';

class QuotesRepository {
  final QuotesWebServices quotesWebServices;

  QuotesRepository(this.quotesWebServices);

  Future<List<QuoteModel>> getCharacterQuotes(String characterName) async {
    final quotesData =
        await quotesWebServices.getCharacterQuotes(characterName);
    return quotesData.map((quote) => QuoteModel.fromJson(quote)).toList();
  }
}
