import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/models/author.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';

class BooksRepository {
  static final BooksRepository _singleton = BooksRepository._internal();

  factory BooksRepository() {
    return _singleton;
  }

  final List<Book> allBooks = [
    Book(
      id: "tjehaja_sijang",
      type: {AppLanguage.id: "Surat Kabar", AppLanguage.en: "Newspaper"},
      title: "Tjehaja Sijang",
      date: {AppLanguage.id: "15 Juni 1917", AppLanguage.en: "15 June 1917"},
      contentTitle: {AppLanguage.id: '“Djempoetan bagi bangsa perempuan”'},
      content: {
        AppLanguage.id:
            'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
        AppLanguage.en:
            'In her article, Maria Walanda Maramis emphasizes the importance of women’s roles as mothers and the first teachers of their children. She calls on Minahasan women to recognize their responsibility in shaping a moral and knowledgeable generation. She highlights the lag of women in education and the importance of educating children from an early age, both physically and spiritually. Maria also stresses that the progress of a nation depends on the quality of its women as the primary educators within the family, and she urges Minahasan women to take an active role in community development through education and awareness of their strategic role. This article reflects the spirit of emancipation and the ideals of equality that she championed.',
      },
      numberOfPage: 4,
      authorId: "maramis",
      collection: {
        AppLanguage.id: "Koleksi PERPUSNAS",
        AppLanguage.en: 'PERPUSNAS collection',
      },
      edition: {
        AppLanguage.id: "Edisi 1 tahun 1917",
        AppLanguage.en: "First edition year 1917",
      },
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
      id: "tjehaja_sijang",
      type: {AppLanguage.id: "Surat Kabar", AppLanguage.en: "Newspaper"},
      title: "Tjehaja Sijang",
      date: {AppLanguage.id: "15 Juli 1917", AppLanguage.en: "15 July 1917"},
      contentTitle: {AppLanguage.id: '“Djempoetan bagi bangsa perempuan”'},
      content: {
        AppLanguage.id:
            'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
        AppLanguage.en:
            'In her article, Maria Walanda Maramis emphasizes the importance of women’s roles as mothers and the first teachers of their children. She calls on Minahasan women to recognize their responsibility in shaping a moral and knowledgeable generation. She highlights the lag of women in education and the importance of educating children from an early age, both physically and spiritually. Maria also stresses that the progress of a nation depends on the quality of its women as the primary educators within the family, and she urges Minahasan women to take an active role in community development through education and awareness of their strategic role. This article reflects the spirit of emancipation and the ideals of equality that she championed.',
      },
      numberOfPage: 4,
      authorId: "maramis",
      collection: {
        AppLanguage.id: "Koleksi PERPUSNAS",
        AppLanguage.en: 'PERPUSNAS collection',
      },
      edition: {
        AppLanguage.id: "Edisi 2 tahun 1917",
        AppLanguage.en: "Second edition year 1917",
      },
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
      editionId: "tjehaja_sijang",
      isOtherEdition: true,
    ),
    Book(
      id: "tjehaja_sijang",
      type: {AppLanguage.id: "Surat Kabar", AppLanguage.en: "Newspaper"},
      title: "Tjehaja Sijang",
      date: {
        AppLanguage.id: "15 Agustus 1917",
        AppLanguage.en: "15 August 1917",
      },
      contentTitle: {AppLanguage.id: '“Djempoetan bagi bangsa perempuan”'},
      content: {
        AppLanguage.id:
            'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan guru pertama bagi anak-anak. Ia mengajak para perempuan Minahasa untuk menyadari tanggung jawab mereka dalam membentuk generasi yang bermoral dan berpengetahuan. Ia menyoroti ketertinggalan perempuan dalam pendidikan serta pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Maria juga menekankan bahwa kemajuan bangsa bergantung pada kualitas perempuan sebagai pendidik utama dalam keluarga, dan menyerukan agar kaum perempuan Minahasa ikut aktif dalam pembangunan masyarakat melalui pendidikan dan kesadaran akan peran strategis mereka. Artikel ini mencerminkan semangat emansipasi dan cita-cita kesetaraan yang ia perjuangkan.',
        AppLanguage.en:
            'In her article, Maria Walanda Maramis emphasizes the importance of women’s roles as mothers and the first teachers of their children. She calls on Minahasan women to recognize their responsibility in shaping a moral and knowledgeable generation. She highlights the lag of women in education and the importance of educating children from an early age, both physically and spiritually. Maria also stresses that the progress of a nation depends on the quality of its women as the primary educators within the family, and she urges Minahasan women to take an active role in community development through education and awareness of their strategic role. This article reflects the spirit of emancipation and the ideals of equality that she championed.',
      },
      numberOfPage: 4,
      authorId: "maramis",
      collection: {
        AppLanguage.id: "Koleksi PERPUSNAS",
        AppLanguage.en: 'PERPUSNAS collection',
      },
      edition: {
        AppLanguage.id: "Edisi 3 tahun 1917",
        AppLanguage.en: "Third edition year 1917",
      },
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.73,
        width: 0.3,
        height: 0.38,
      ),
      editionId: "tjehaja_sijang",
      isOtherEdition: true,
    ),
    Book(
      id: "pahesan",
      title: "Pahesan",
      type: {AppLanguage.id: "Buku", AppLanguage.en: "Book"},
      date: {AppLanguage.id: "1940"},
      contentTitle: {
        AppLanguage.id: '"Ini mock bahasa indonesia',
        AppLanguage.en: '“This is a mock”',
      },
      content: {
        AppLanguage.id:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        AppLanguage.en: "English lorem ipsum",
      },
      numberOfPage: 12,
      collection: {
        AppLanguage.id: "Koleksi PERPUSNAS",
        AppLanguage.en: 'PERPUSNAS collection',
      },
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
      background: {
        AppLanguage.id:
            "Maria Walanda Maramis adalah seorang penulis dan jurnalis asal Indonesia. Ia dikenal sebagai salah satu penulis perempuan pertama di Indonesia.",
        AppLanguage.en:
            "Maria Walanda Maramis was a writer and journalist from Indonesia. She is known as one of the first female writers in the country.",
      },
      image: "assets/images/maramis.jpg",
      contentType: {AppLanguage.id: "Surat Kabar", AppLanguage.en: "Newspaper"},
      contentTitle: "Tjehaja Sjiang",
      contentDescription: {
        AppLanguage.id:
            "Tjahaja Siang adalah salah satu surat kabar berbahasa Melayu yang terbit di awal abad ke-20 di Hindia Belanda (sekarang Indonesia). Surat kabar ini menjadi wadah penting bagi kaum intelektual dan tokoh pergerakan nasional, termasuk perempuan seperti Maria Walanda Maramis, untuk menyuarakan gagasan tentang pendidikan, kesetaraan gender, dan emansipasi perempuan. Tjahaja Siang memiliki peran dalam membentuk opini publik dan menyebarkan semangat kebangsaan serta kesadaran sosial-politik di kalangan masyarakat pribumi.",
        AppLanguage.en:
            "Tjahaja Siang was one of the Malay-language newspapers published in the early 20th century in the Dutch East Indies (now Indonesia). This newspaper served as an important platform for intellectuals and national movement figures, including women such as Maria Walanda Maramis, to voice ideas on education, gender equality, and women's emancipation. Tjahaja Siang played a role in shaping public opinion and spreading the spirit of nationalism as well as socio-political awareness among the indigenous population.",
      },
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
