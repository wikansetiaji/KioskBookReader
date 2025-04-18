import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:provider/provider.dart';

class Book {
  final String id;
  final Map<AppLanguage, String> type; // Translatable
  final String title;
  final Map<AppLanguage, String> date; // Translatable
  final Map<AppLanguage, String> contentTitle; // Translatable
  final Map<AppLanguage, String> content; // Translatable
  final int numberOfPage;
  final String? authorId;
  final BookHighlight? highlight;
  final Map<AppLanguage, String>? collection; // Translatable
  final Map<AppLanguage, String>? edition; // Translatable
  final String? editionId;
  final bool isOtherEdition;
  final bool isMedia;

  Book({
    required this.id,
    required this.type,
    required this.title,
    required this.date,
    required this.contentTitle,
    required this.content,
    required this.numberOfPage,
    this.authorId,
    this.highlight,
    this.collection,
    this.edition,
    this.editionId,
    this.isOtherEdition = false,
    this.isMedia = false,
  });

  String getTranslated(BuildContext context, Map<AppLanguage, String>? field) {
    if (field == null) return '';
    return field[context.watch<LanguageProvider>().language] ??
        field[AppLanguage.en] ??
        field.values.first;
  }

  String getType(BuildContext context) => getTranslated(context, type);
  String getDate(BuildContext context) => getTranslated(context, date);
  String getContentTitle(BuildContext context) =>
      getTranslated(context, contentTitle);
  String getContent(BuildContext context) => getTranslated(context, content);
  String? getCollection(BuildContext context) =>
      getTranslated(context, collection);
  String? getEdition(BuildContext context) => getTranslated(context, edition);
}

class BookHighlight {
  final int page;
  final double centerX;
  final double centerY;
  final double width;
  final double height;

  BookHighlight({
    required this.page,
    required this.centerX,
    required this.centerY,
    required this.width,
    required this.height,
  });
}
