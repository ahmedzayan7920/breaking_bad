class QuoteModel {
  QuoteModel({
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.series,
  });

  late final int quoteId;
  late final String quote;
  late final String author;
  late final String series;

  QuoteModel.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quote_id'] = quoteId;
    _data['quote'] = quote;
    _data['author'] = author;
    _data['series'] = series;
    return _data;
  }
}
