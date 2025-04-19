import 'package:kiosk_book_reader/models/book.dart';
import 'package:kiosk_book_reader/models/author.dart';
import 'package:kiosk_book_reader/service/language_provider.dart';

class BooksRepository {
  static final BooksRepository _singleton = BooksRepository._internal();

  factory BooksRepository() {
    return _singleton;
  }

  final List<Book> allBooks = [
    // Tjehaja Sijang
    Book(
      id: 'tjehaja_sijang_0',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Tjahaja Siang',
      date: {AppLanguage.id: '1917'},
      contentTitle: {AppLanguage.id: '“Djempoetan Bagi Bangsa Perempoean”'},
      content: {
        AppLanguage.id:
            'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan pendidik pertama bagi anak-anak. Ia mengajak perempuan Minahasa untuk sadar akan tanggung jawab mereka dalam membentuk generasi yang bermoral dan cerdas. Maria menyoroti ketimpangan pendidikan bagi perempuan dan pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Ia percaya bahwa kemajuan bangsa dimulai dari perempuan yang berdaya dan terdidik.',
      },
      numberOfPage: 4,
      authorId: 'maramis',
      highlight: BookHighlight(page: 1, centerX: 0.79, centerY: 0.74, width: 0.27, height: 0.35),
      collection: {AppLanguage.id: 'Tjahaja Sjiang'},
      edition: {AppLanguage.id: 'Edisi 15 Juni 1917'},
      editionId: 'tjehaja_sjiang',
      isOtherEdition: false,
    ),
    Book(
      id: 'tjehaja_sijang_1',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Tjahaja Siang',
      date: {AppLanguage.id: '1918'},
      contentTitle: {AppLanguage.id: '“Siapa Poenja Salah?”'},
      content: {
        AppLanguage.id:
            'Dalam tulisan reflektifnya, Maria Walanda Maramis menyamakan perjuangan menjadi ibu dengan “peperangan sembilan bulan”. Ia menekankan bahwa pekerjaan dan pikiran seorang ibu berkaitan langsung dengan masa depan anak dan masyarakat. “Pekerjaan dan pikiran seorang ibu,” tulisnya, “berhubungan erat—seperti telepon—dengan tubuh dan waktu yang akan datang.',
      },
      numberOfPage: 3,
      authorId: 'maramis',
      highlight: null,
      collection: {AppLanguage.id: 'Tjahaja Sjiang'},
      edition: {AppLanguage.id: 'Edisi 1 Oktober 1918'},
      editionId: 'tjehaja_sjiang',
      isOtherEdition: true,
    ),
    Book(
      id: 'tjehaja_sijang_2',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Tjahaja Siang',
      date: {AppLanguage.id: '1918'},
      contentTitle: {AppLanguage.id: '“Siapa Poenja Salah? (Sambungan)”'},
      content: {
        AppLanguage.id:
            'Dalam tulisan sambungan ini, Maria Walanda Maramis mengajak para orang tua—khususnya perempuan Minahasa—untuk lebih sadar terhadap pola asuh yang tanpa disadari dapat menanamkan kebiasaan buruk sejak dini, seperti memberi janji palsu, membenarkan kekerasan, atau membiarkan anak mengambil milik orang lain. Ia menekankan bahwa masa depan anak bergantung pada kesadaran, keteladanan, dan tanggung jawab orang tua hari ini.',
      },
      numberOfPage: 2,
      authorId: 'maramis',
      highlight: null,
      collection: {AppLanguage.id: 'Tjahaja Sjiang'},
      edition: {AppLanguage.id: 'Edisi 15 Oktober 1918'},
      editionId: 'tjehaja_sjiang',
      isOtherEdition: true,
    ),

    // Soenting
    Book(
      id: 'soenting_0',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Soenting Melajoe',
      date: {AppLanguage.id: '7 Agustus 1912'},
      contentTitle: {AppLanguage.id: '“Pakaian Perhiasan”'},
      content: {
        AppLanguage.id:
            'Dalam artikelnya, Ruhanna Kuddus menguraikan beragam keterampilan yang dimiliki oleh para perempuan Minangkabau, khususnya dalam bidang kerajinan tangan berbahan kain. Namun, ia mengemukakan kekhawatirannya terhadap tidak berlanjutnya proses alih pengetahuan dari generasi tua kepada generasi muda, yang dapat menyebabkan terputusnya tradisi keterampilan tersebut. Ruhanna juga menyampaikan bahwa organisasi “Kerajinan Amai Setia” memiliki tujuan utama untuk menghidupkan kembali dan melestarikan keahlian-keahlian tradisional yang dahulu dimiliki oleh para perempuan Melayu. Ia menekankan pentingnya berbagi pengetahuan, dalam konteks ini, ilmu yang diperoleh melalui kegiatan di Kerajinan Amai Setia, karena hal tersebut diyakini dapat mempermudah dan menopang keberlangsungan hidup di masa depan.',
      },
      numberOfPage: 3,
      authorId: 'kuddus',
      highlight: BookHighlight(page: 1, centerX: 0.3542663973345178, centerY: 0.6005361544966039, width: 0.5769200408423047, height: 0.6902042549992871),
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
      edition: {AppLanguage.id: 'Edisi No. 10 Tahun 1'},
      editionId: 'soenting',
      isOtherEdition: false,
    ),
    Book(
      id: 'soenting_1',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Soenting Melajoe',
      date: {AppLanguage.id: '13 Desember 1918'},
      contentTitle: {AppLanguage.id: '“Perempoean” '},
      content: {
        AppLanguage.id:
            'Artikel ini membahas tentang kedudukan perempuan Melayu di wilayah Minangkabau. Penulis memulai tulisannya dengan melakukan perbandingan antara kondisi perempuan Melayu di tanah Minang dan perempuan Hindu di Hindustan (India). Dalam tulisannya, Ruhanna Kuddus mengungkapkan situasi perempuan di Hindustan yang bahkan harus menjalani tradisi kematian bersama (sati) ketika suaminya meninggal dunia. Meskipun demikian, ia mencatat bahwa gerakan perempuan di India menunjukkan kemajuan yang signifikan, salah satunya dengan keberhasilan mendirikan institusi pendidikan tinggi khusus perempuan, yaitu Universitas Ja’ni. Melalui artikel ini, penulis mengajak pembaca untuk melakukan refleksi bahwa secara hak dan kedudukan, perempuan Melayu sejatinya telah berada dalam posisi yang lebih maju dibandingkan perempuan di bangsa lain. Hal ini disebabkan oleh pandangan budaya lokal yang menjunjung tinggi kemerdekaan, kehormatan, dan martabat perempuan.',
      },
      numberOfPage: 4,
      authorId: 'kuddus',
      highlight: BookHighlight(page: 1, centerX: 0.21226246422054304, centerY: 0.8045121596350856, width: 0.29241970456709726, height: 0.293483125703462),
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
      edition: {AppLanguage.id: 'Edisi No. 48 Tahun 7'},
      editionId: 'soenting',
      isOtherEdition: true,
    ),

    // Pahesan
    Book(
      id: 'pahesan',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Pahesan',
      date: {AppLanguage.id: '1937 - 1941'},
      contentTitle: {AppLanguage.id: 'Majalah Pahésan, Edisi 15 April 1941'},
      content: {
        AppLanguage.id:
            'Edisi ini memuat tulisan untuk mengenang R.A. Kartini, pandangan tentang pentingnya pendidikan campuran antara perempuan dan laki-laki, perkembangan seni rupa Bali, serta pembahasan seputar gaya busana dan ekspresi diri perempuan. Disertai puisi dan prosa, Pahésan menghadirkan perspektif perempuan muda terhadap isu sosial, budaya, dan gaya hidup pada masanya.',
      },
      numberOfPage: 12,
      authorId: 'pahesan',
      highlight: null,
      edition: {AppLanguage.id: 'Edisi 15 April 1941'},
      isOtherEdition: false,
      isMedia: true
    ),

    // Sedar
    Book(
      id: 'sedar',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Sedar',
      date: {AppLanguage.id: '1930'},
      contentTitle: {AppLanguage.id: '“Tentang Hak dan Kewajiban Perempoean Indonesia” '},
      content: {
        AppLanguage.id:
            'Melalui nama pena “Doro Petak”, penulis artikel ini mengkritik anggapan bahwa perempuan adalah makhluk lemah. Ia menekankan pentingnya kesetaraan hak dan kewajiban antara laki-laki dan perempuan, serta perlunya pemahaman tentang dinamika sosial. Penulis membandingkan situasi di Hindia Belanda dengan kondisi di negara-negara di Eropa, di mana perempuan telah memiliki hak untuk menduduki berbagai jenis pekerjaan, termasuk hak untuk memilih dan dipilih dalam pemilihan umum. Di Rusia, bahkan perempuan dapat terlibat dalam upaya mempertahankan kemerdekaan bangsa. Kondisi ini kemudian dikontraskan dengan keadaan di negeri jajahan seperti Hindia Belanda, di mana masih terdapat ketimpangan dalam relasi antara laki-laki dan perempuan. Tulisan ini menyerukan kerja sama antara perempuan dan laki-laki demi menghapus penderitaan bangsa dan membangun masa depan yang lebih setara.',
      },
      numberOfPage: 8,
      authorId: 'sedar',
      highlight: null,
      edition: {AppLanguage.id: 'Edisi November 1930'},
      isOtherEdition: false,
      isMedia: true
    ),

    // Soeara Iboe
    Book(
      id: 'soeara_iboe',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Soeara Iboe',
      date: {AppLanguage.id: '1932'},
      contentTitle: {AppLanguage.id: '“Perloenja Perempoean Disekolahkan”'},
      content: {
        AppLanguage.id:
            'Artikel ini menyoroti pentingnya pendidikan bagi perempuan. Pada masa itu, masyarakat masih memegang teguh pandangan tradisional yang menyatakan bahwa “Bukankah perempuan pada akhirnya akan kembali ke dapur juga?” Pandangan semacam ini, menurut penulis, menjadi hambatan serius bagi perempuan dalam mengakses pendidikan. Dalam tulisan yang ditulis oleh V. Diaviance, ditegaskan bahwa seorang ibu yang berpendidikan akan mampu mengelola rumah tangga dengan lebih baik dibandingkan perempuan yang tidak pernah mengenyam pendidikan formal. Penulis juga mengajak pembaca untuk merenung melalui pertanyaan retoris: “Tidakkah hati kita merasa bangga apabila anak atau cucu perempuan kita mampu berkembang dan sejajar dengan saudara laki-lakinya?” Menurut penulis, siapa pun yang ingin menjadi ibu yang baik harus terlebih dahulu memiliki kemampuan untuk memberikan teladan yang baik bagi anak-anaknya.',
      },
      numberOfPage: 4,
      authorId: 'soeara_iboe',
      highlight: null,
      edition: {AppLanguage.id: 'Edisi 2 Mei 1932'},
      isOtherEdition: false,
      isMedia: true
    ),

    // Doenia Kita
    Book(
      id: 'doenia_kita',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Doenia Kita',
      date: {AppLanguage.id: 'Sejak 1932'},
      contentTitle: {AppLanguage.id: '“Ilmoe Penjoeloeh Djalan” '},
      content: {
        AppLanguage.id:
            'Artikel berjudul “Ilmoe Penjoeloeh Djalan” yang ditulis oleh Siti Salimah dan dimuat dalam majalah Doenia Kita edisi Agustus 1938 membahas pentingnya kaum ibu memiliki aktivitas di luar urusan domestik. Dalam tulisannya, Salimah menekankan bahwa para ibu sebaiknya meluangkan waktu untuk membaca buku-buku yang bermanfaat bagi pengembangan diri. Selain itu, ia juga menganjurkan agar kaum ibu memperluas jaringan pergaulan di luar rumah tangga. Menurutnya, pergaulan yang luas memungkinkan perempuan untuk senantiasa mengikuti perkembangan zaman dan memperoleh informasi baru. Meskipun tugas utama perempuan terletak pada pengasuhan anak, peran sebagai istri, dan pengelolaan rumah tangga, penulis meyakini bahwa semakin luas pengetahuan dan keterampilan yang dimiliki seorang ibu, maka akan semakin baik pula kemampuannya dalam menjalankan peran domestik dan mendidik anak-anaknya.',
      },
      numberOfPage: 26,
      authorId: 'doenia_kita',
      highlight: null,
      edition: {AppLanguage.id: 'Edisi Agustus 1938'},
      isOtherEdition: false,
      isMedia: true
    ),

    // Dunia Wanita
    Book(
      id: 'dunia_wanita',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Dunia Wanita',
      date: {AppLanguage.id: 'Sejak 1949'},
      contentTitle: {AppLanguage.id: '“TODO” '},
      content: {
        AppLanguage.id:
            'TODO',
      },
      numberOfPage: 25,
      authorId: 'dunia_wanita',
      highlight: null,
      edition: {AppLanguage.id: 'TODO'},
      isOtherEdition: false,
      isMedia: true
    ),

    // KPWI
    Book(
      id: 'kpwi',
      type: {AppLanguage.id: 'Buku'},
      title: 'Peringatan 30 Tahun Kesatuan Pergerakan Wanita Indonesia',
      date: {AppLanguage.id: '22 Desember 1958'},
      contentTitle: {AppLanguage.id: '“TODO” '},
      content: {
        AppLanguage.id:
            'TODO',
      },
      numberOfPage: 26,
      authorId: 'kpwi',
      highlight: null,
      edition: {AppLanguage.id: 'TODO'},
      isOtherEdition: false,
      isMedia: true
    ),

  ];

  final List<Author> allAuthors = [
    Author(
      id: 'kuddus',
      name: 'Ruhana Kuddus',
      birthDeathDate: '20 Desember 1884 – 17 Agustus 1972',
      background: {
        AppLanguage.id:
            'Ruhana Kuddus atau dikenal dengan Ibu Pers Indonesia, lahir pada 20 Desember 1884 di Koto Gadang, Kabupaten Agam, Sumatera Barat. Roehana memiliki perhatian terhadap nasib perempuan dan memperjuangkan pendidikan bagi kaum perempuan. Ia mendirikan Soenting Melajoe pada 1912, salah satu surat kabar perempuan pertama di Hindia Belanda yang didirikan di Padang. ',
      },
      contentType: {AppLanguage.id: 'Surat Kabar'},
      contentTitle: 'Soenting Melajoe',
      contentDescription: {
        AppLanguage.id:
            'Soenting Melajoe adalah majalah yang memuat tajuk rencana, puisi, tulisan-tulisan perempuan, serta biografi tokoh-tokoh ternama. Terbit pertama kali pada 10 Juli 1912 dan berhenti pada 28 Januari 1921, majalah ini merekam diskusi perempuan Hindia Belanda seputar pendidikan, kesehatan, agama, dan budaya dalam tiap edisi empat halamannya.',
      },
    ),
    Author(
      id: 'maramis',
      name: 'Maria Walanda Maramis',
      birthDeathDate: '1 Desember 1872 - 22 April 1924',
      background: {
        AppLanguage.id:
            'Maria Walanda Maramis, lahir di Sulawesi Utara pada 1 Desember 1872, adalah pelopor emansipasi perempuan yang menekankan peran ibu dalam keluarga dan pendidikan anak. Ia mengusulkan pendirian organisasi PIKAT, membuka Sekolah Rumah Tangga (Huishold School) untuk pendidikan gratis untuk anak-anak perempuan, menulis di Tjehaja Sijang, dan memperjuangkan hak politik perempuan lewat kampanye surat ke Batavia.',
      },
      contentType: {AppLanguage.id: 'Surat Kabar'},
      contentTitle: 'Tjehaja Sijang',
      contentDescription: {
        AppLanguage.id:
            'Tjehaja Sijang adalah salah satu surat kabar berbahasa Melayu yang terbit di awal abad ke-20 di Minahasa. Surat kabar ini menjadi wadah penting bagi kaum intelektual dan tokoh pergerakan nasional, termasuk perempuan seperti Maria Walanda Maramis, untuk menyuarakan gagasan tentang pendidikan, kesetaraan gender, dan emansipasi perempuan. Tjahaja Siang memiliki peran dalam membentuk opini publik dan menyebarkan kesadaran sosial-politik di kalangan masyarakat pribumi.',
      },
    ),
    Author(
      id: 'pahesan',
      name: 'Pahesan',
      birthDeathDate: '1937 - 1941',
      background: {AppLanguage.id: 'Utami Suryadarma merupakan tokoh perempuan yang pernah mewakili Indonesia dalam Inter-Asian Women Conference pada Desember 1947. Saat remaja, bersama sang kakak, Utami mendirikan Pahésan. Melalui media ini, ia mendorong perempuan untuk berpikir, bersuara, dan menyuarakan harapan atas masa depan bangsanya.'},
      contentType: {AppLanguage.id: 'Majalah'},
      contentTitle: 'Pahesan',
      contentDescription: {
        AppLanguage.id:
            'Majalah Pahésan (berarti “cermin”) didirikan di Solo dan terbit antara tahun 1937 hingga 1941. Mengangkat tema sosial-budaya serta peran perempuan, Pahésan menjadi ruang bagi perempuan muda menyuarakan pandangan dan membangun kesadaran kolektif di tengah perjuangan menuju kemerdekaan. Meski menggunakan bahasa Belanda yang menjadi bahasa pendidikan formal bagi anak-anak priyayi masa itu, suara-suara kritis dan emansipasi terasa pada tiap halamannya.',
      },
      isMediaAuthor: true
    ),
    Author(
      id: 'sedar',
      name: 'Sedar',
      birthDeathDate: 'Sejak Agustus 1930',
      background: {AppLanguage.id: 'Organisasi Persatuan Wanita Sedar didirikan di Bandung pada tahun 1930 sebagai ruang perjuangan bagi perempuan kelas pekerja. Salah satu media yang diterbitkan organisasi ini adalah Majalah Sedar, yang memuat tulisan-tulisan tentang pendidikan, perjuangan perempuan, serta pemikiran-pemikiran progresif. Banyak di antaranya menyuarakan keresahan terhadap kondisi perempuan, termasuk penolakan terhadap praktik poligami yang dianggap merugikan perempuan. Majalah ini juga berfungsi sebagai sarana pendidikan rakyat.'},
      isMediaAuthor: true
    ),
    Author(
      id: 'soeara_iboe',
      name: 'Soeara Iboe',
      birthDeathDate: '2 Mei 1932',
      background: {AppLanguage.id: 'Soeara Iboe adalah surat kabar yang terbit di Sibolga pada 2 Mei 1932, lahir dari semangat kolektif organisasi kaum ibu bernama Comite Kaoem Iboe yang berdiri pada 8 November 1931. Surat kabar ini hadir untuk mempererat hubungan antar ibu, menyebarkan informasi dari luar wilayah, serta menjadi alat perlawanan terhadap kekuasaan adat. Isinya mencakup berbagai topik seperti masakan, kesehatan ibu dan anak, pendidikan, iklan, berita umum, hingga karya sastra berupa puisi dan cerita.'},
      isMediaAuthor: true
    ),
    Author(
      id: 'doenia_kita',
      name: 'Doenia Kita',
      birthDeathDate: 'Sejak 1937',
      background: {AppLanguage.id: 'Majalah Doenia Kita (DK) adalah majalah bulanan yang pertama kali terbit pada tahun 1937. Majalah ini didirikan oleh Siti Alimah untuk memenuhi aspirasi kaum perempuan yang mengalami kesulitan akibat zaman baru. Istilah Doenia Kita mengandung makna dunia kelahiran dan kebatinannya kaum putri. Haluan dari majalah ini adalah kemajuan seluruh perempuan Indonesia.'},
      isMediaAuthor: true
    ),
    Author(
      id: 'dunia_wanita',
      name: 'Dunia Wanita',
      birthDeathDate: 'Sejak 1949',
      background: {AppLanguage.id: 'Ani Idrus, tokoh pers dan wartawan perempuan Indonesia, lahir di Sawahlunto pada 25 November 1918. Ia mendirikan majalah Dunia Wanita yang mengangkat isu-isu perempuan di bidang sosial, politik, dan ekonomi untuk mendorong kemajuan kaum perempuan. Atas jasanya di bidang jurnalistik, ia menerima penghargaan Satya Penegak Pers Pancasila dari Menteri Penerangan RI pada tahun 1998.'},
      isMediaAuthor: true
    ),
    Author(
      id: 'kpwi',
      name: 'Kesatuan Pergerakan Wanita Indonesia',
      birthDeathDate: 'Sejak 1928',
      background: {AppLanguage.id: 'Perjuangan kolektif perempuan Indonesia secara historis ditandai dengan terselenggaranya Kongres Perempuan Pertama pada 28 Desember 1928. Momentum tersebut menjadi tonggak penting bagi terbentuknya kesadaran bersama akan perlunya pengorganisasian perempuan dalam memperjuangkan hak-hak sosial, politik, dan budaya. Salah satu wujud konkret dari perkembangan ini adalah pendirian Perikatan Perkumpulan Isteri Indonesia.'},
      isMediaAuthor: true
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

  List<Book> getBooksFromAuthor({required Author author, bool showEditions = false}) {
    return allBooks
        .where((b) => b.authorId == author.id && (!b.isOtherEdition || showEditions))
        .toList();
  }

  List<Book> getBookEditions({required Book book}) {
    return allBooks
        .where((b) => b.editionId == book.editionId && b != book && book.editionId != null)
        .toList();
  }

  List<Author> getAllAuthors() {
    return allAuthors.where((b) => !b.isMediaAuthor).toList();
  }

  List<Book> getMediaBooks() {
    return allBooks.where((b) => b.isMedia).toList();
  }

  BooksRepository._internal();
}
