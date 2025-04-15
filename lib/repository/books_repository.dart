import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/models/author.dart';

class BooksRepository {
  static final BooksRepository _singleton = BooksRepository._internal();

  factory BooksRepository() {
    return _singleton;
  }

  final List<Author> authorWithBooks = [
    Author(
      name: "Maria Walanda Maramis",
      birthDeathDate: "15 Juni 1917 - 28 Desember 1945",
      background:
          "Maria Walanda Maramis adalah seorang penulis dan jurnalis asal Indonesia. Ia dikenal sebagai salah satu penulis perempuan pertama di Indonesia.",
      image: "assets/images/maria_walanda_maramis.jpg",
      books: [
        Book(
          id: "tjehaja_sijang",
          type: "Surat Kabar",
          title: "Tjehaja Sijang",
          date: "15 Juni 1917",
          contentTitle: '“Djempoetan bagi bangsa perempuan”',
          content:
              'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
          numberOfPage: 4,
          collection: "Koleksi PERPUSNAS",
          edition: "Edisi 1 tahun 1917",
          highlight: BookHighlight(
            page: 1,
            centerX: 0.79,
            centerY: 0.73,
            width: 0.3,
            height: 0.38,
          ),
          // TODO: otherEdition IS A MOCK DATA, NEED TO BE REPLACED
          otherEdition: [
            Book(
              id: "tjehaja_sijang",
              type: "Surat Kabar",
              title: "Tjehaja Sijang",
              date: "15 Juni 1917",
              contentTitle: '“Djempoetan bagi bangsa perempuan”',
              content:
                  'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
              numberOfPage: 4,
              collection: "Koleksi PERPUSNAS",
              edition: "Edisi 1 tahun 1917",
              highlight: BookHighlight(
                page: 1,
                centerX: 0.79,
                centerY: 0.73,
                width: 0.3,
                height: 0.38,
              ),
            ),
            Book(
              id: "tjehaja_sijang",
              type: "Surat Kabar",
              title: "Tjehaja Sijang",
              date: "15 Juni 1917",
              contentTitle: '“Djempoetan bagi bangsa perempuan”',
              content:
                  'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
              numberOfPage: 4,
              collection: "Koleksi PERPUSNAS",
              edition: "Edisi 1 tahun 1917",
              highlight: BookHighlight(
                page: 1,
                centerX: 0.79,
                centerY: 0.73,
                width: 0.3,
                height: 0.38,
              ),
            ),
          ],
        ),
      ],
    ),
    // TODO: NEXT AUTHORS ARE MOCK DATAS, NEED TO BE REPLACED
  ];

  final List<Book> booksWithoutAuthor = [
    Book(
      id: "pahesan",
      title: "Pahesan",
      type: "Buku",
      date: "1940",
      contentTitle: '“This is a mock”',
      content:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      numberOfPage: 12,
      collection: "Koleksi PERPUSNAS",
      highlight: BookHighlight(
        page: 3,
        centerX: 0.72,
        centerY: 0.76,
        width: 0.39,
        height: 0.20,
      ),
    ),
  ];

  List<Book> getAllBooks() {
    List<Book> allBooks = [];
    for (var author in authorWithBooks) {
      allBooks.addAll(author.books);
    }
    allBooks.addAll(booksWithoutAuthor);
    return allBooks;
  }

  Author? getAuthor({required Book book}) {
    for (var author in authorWithBooks) {
      if (author.books.contains(book)) {
        return author;
      }
    }
    return null;
  }

  BooksRepository._internal();
}
