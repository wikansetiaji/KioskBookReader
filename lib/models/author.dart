import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:provider/provider.dart';

class Author {
  final String id;
  final String name;
  final String birthDeathDate;
  final Map<AppLanguage, String> background; // Translatable
  final Map<AppLanguage, String>? contentType; // Translatable
  final String? contentTitle; // Translatable
  final Map<AppLanguage, String>? contentDescription; // Translatable

  Author({
    required this.id,
    required this.name,
    required this.birthDeathDate,
    required this.background,
    this.contentType,
    this.contentTitle,
    this.contentDescription
  });

  String getTranslated(BuildContext context, Map<AppLanguage, String>? field) {
    if (field == null) return '';
    return field[context.watch<LanguageProvider>().language] ??
        field[AppLanguage.en] ??
        field.values.first;
  }

  String getBackgrond(BuildContext context) => getTranslated(context, background);
  String getContentType(BuildContext context) => getTranslated(context, contentType);
  String getContentDescription(BuildContext context) => getTranslated(context, contentDescription);
}