import 'package:flutter/material.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';
import 'package:kiosk_book_reader/service/size_config.dart';
import 'package:provider/provider.dart';

class LanguageToggleSwitch extends StatelessWidget {
  const LanguageToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final isEnglish = provider.isEnglish;

    return GestureDetector(
      onTap: () => provider.toggleLanguage(),
      child: Container(
        width: 132.sc,
        height: 66.sc,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFF4B4B4B),
          borderRadius: BorderRadius.circular(33.sc),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sc),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                alignment:
                    isEnglish ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  width: 48.sc,
                  height: 48.sc,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'EN',
                      style: TextStyle(
                        color: isEnglish ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Archivo',
                        fontSize: 30.sc,
                        letterSpacing: -2.5
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'ID',
                      style: TextStyle(
                        color: isEnglish ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Archivo',
                        fontSize: 30.sc
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
