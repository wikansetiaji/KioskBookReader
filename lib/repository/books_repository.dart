import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/models/author.dart';

class BooksRepository {
  static final BooksRepository _singleton = BooksRepository._internal();

  factory BooksRepository() {
    return _singleton;
  }

  final List<Book> allBooks = [
    Book(
      id: "tjehaja_sijang",
      type: "Surat Kabar",
      title: "Tjehaja Sijang",
      date: "15 Juni 1917",
      contentTitle: '“Djempoetan bagi bangsa perempuan”',
      content:
          'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
      numberOfPage: 4,
      authorId: "maramis",
      collection: "Koleksi PERPUSNAS",
      edition: "Edisi 1 tahun 1917",
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
      editionId: "tjehaja_sijang",
    ),
    Book(
      // TODO: This book is a mock
      id: "tjehaja_sijang",
      type: "Surat Kabar",
      title: "Tjehaja Sijang",
      date: "15 Juli 1917",
      contentTitle: '“Djempoetan bagi bangsa perempuan”',
      content:
          'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
      numberOfPage: 4,
      authorId: "maramis",
      collection: "Koleksi PERPUSNAS",
      edition: "Edisi 2 tahun 1917",
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
      isOtherEdition: true,
      editionId: "tjehaja_sijang",
    ),
    Book(
      // TODO: This book is a mock
      id: "tjehaja_sijang",
      type: "Surat Kabar",
      title: "Tjehaja Sijang",
      date: "15 Agustus 1917",
      contentTitle: '“Djempoetan bagi bangsa perempuan”',
      content:
          'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
      numberOfPage: 4,
      authorId: "maramis",
      collection: "Koleksi PERPUSNAS",
      edition: "Edisi 3 tahun 1917",
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
      isOtherEdition: true,
      editionId: "tjehaja_sijang",
    ),
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

  final List<Author> allAuthors = [
    Author(
      id: "maramis",
      name: "Maria Walanda Maramis",
      birthDeathDate: "15 Juni 1917 - 28 Desember 1945",
      background:
          "Maria Walanda Maramis adalah seorang penulis dan jurnalis asal Indonesia. Ia dikenal sebagai salah satu penulis perempuan pertama di Indonesia.",
      image: "assets/images/maramis.jpg",
    ),
  ];

  List<Book> getAllBooks() {
    return allBooks.where((b) => !b.isOtherEdition).toList();
  }

  Author? getAuthor({required Book book}) {
    for (var author in allAuthors) {
      if (book.authorId == author.id) {
        return author;
      }
    }
    return null;
  }

  List<Book> getBooksFromAuthor({required Author author}) {
    return allBooks
        .where((b) => b.authorId == author.id && !b.isOtherEdition)
        .toList();
  }

  List<Book> getBookEditions({required Book book}) {
    return allBooks
        .where((b) => b.editionId == book.editionId && b != book)
        .toList();
  }

  List<Author> getAllAuthors() {
    return allAuthors;
  }

  List<Book> getBooksWithoutAuthor() {
    return allBooks.where((b) => b.authorId == null).toList();
  }

  BooksRepository._internal();
}
