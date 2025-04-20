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
      date: {AppLanguage.id: '15 Juni 1917'},
      contentTitle: {AppLanguage.id: '“Djempoetan Bagi Bangsa Perempoean”'},
      content: {
        AppLanguage.id:
            'Dalam artikelnya, Maria Walanda Maramis menekankan pentingnya peran perempuan sebagai ibu dan pendidik pertama bagi anak-anak. Ia mengajak perempuan Minahasa untuk sadar akan tanggung jawab mereka dalam membentuk generasi yang bermoral dan cerdas. Maria menyoroti ketimpangan pendidikan bagi perempuan dan pentingnya mendidik anak sejak dini, baik secara fisik maupun spiritual. Ia percaya bahwa kemajuan bangsa dimulai dari perempuan yang berdaya dan terdidik.',
      },
      numberOfPage: 4,
      authorId: 'maramis',
      highlight: BookHighlight(
        page: 1,
        centerX: 0.79,
        centerY: 0.74,
        width: 0.27,
        height: 0.35,
      ),
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
      edition: {AppLanguage.id: 'Edisi No. 12 Tahun 48'},
      editionId: 'tjehaja_sjiang',
      isOtherEdition: false,
    ),
    Book(
      id: 'tjehaja_sijang_1',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Tjahaja Siang',
      date: {AppLanguage.id: '1 Oktober 1918'},
      contentTitle: {AppLanguage.id: '“Siapa Poenja Salah?”'},
      content: {
        AppLanguage.id:
            'Dalam tulisan reflektifnya, Maria Walanda Maramis menyamakan perjuangan menjadi ibu dengan “peperangan sembilan bulan”. Ia menekankan bahwa pekerjaan dan pikiran seorang ibu berkaitan langsung dengan masa depan anak dan masyarakat. “Pekerjaan dan pikiran seorang ibu,” tulisnya, “berhubungan erat—seperti telepon—dengan tubuh dan waktu yang akan datang.',
      },
      numberOfPage: 3,
      authorId: 'maramis',
      highlight: BookHighlight(
        page: 1,
        centerX: 0.8070919247945535,
        centerY: 0.8816236856458013,
        width: 0.2785716272457427,
        height: 0.1406850873856222,
      ),
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
      edition: {AppLanguage.id: 'Edisi No. 19 Tahun 49'},
      editionId: 'tjehaja_sjiang',
      isOtherEdition: true,
    ),
    Book(
      id: 'tjehaja_sijang_2',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Tjahaja Siang',
      date: {AppLanguage.id: '15 Oktober 1918'},
      contentTitle: {AppLanguage.id: '“Siapa Poenja Salah? (Sambungan)”'},
      content: {
        AppLanguage.id:
            'Dalam tulisan sambungan ini, Maria Walanda Maramis mengajak para orang tua—khususnya perempuan Minahasa—untuk lebih sadar terhadap pola asuh yang tanpa disadari dapat menanamkan kebiasaan buruk sejak dini, seperti memberi janji palsu, membenarkan kekerasan, atau membiarkan anak mengambil milik orang lain. Ia menekankan bahwa masa depan anak bergantung pada kesadaran, keteladanan, dan tanggung jawab orang tua hari ini.',
      },
      numberOfPage: 2,
      authorId: 'maramis',
      highlight: BookHighlight(
        page: 2,
        centerX: 0.21890775584626136,
        centerY: 0.4938281339561144,
        width: 0.2896971087706898,
        height: 0.8616827871297706,
      ),
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
      edition: {AppLanguage.id: 'Edisi No. 20 Tahun 49'},
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
        AppLanguage.en:
            'In this article, Ruhana Kuddus outlines the various skills possessed by Minangkabau women, especially in textile handcrafts. However, she expresses concern about the lack of knowledge transfer from the older to the younger generation, which could lead to the loss of these traditions. Ruhana also mentions the organization “Kerajinan Amai Setia,” which aims to revive and preserve traditional skills once mastered by Malay women. She emphasizes the importance of knowledge sharing, particularly skills gained through the activities of Kerajinan Amai Setia, as these are believed to ease and support future livelihoods.',
      },
      numberOfPage: 3,
      authorId: 'kuddus',
      highlight: BookHighlight(
        page: 1,
        centerX: 0.3542663973345178,
        centerY: 0.6005361544966039,
        width: 0.5769200408423047,
        height: 0.6902042549992871,
      ),
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
        AppLanguage.en:
            "This article discusses the status of Malay women in the Minangkabau region. The writer starts by comparing the condition of Malay women in Minangkabau and Hindu women in Hindustan (India). Ruhana Kuddus reveals the plight of women in Hindustan, who were even subjected to the tradition of sati—dying with their husbands. Nevertheless, she noted the significant progress of the women's movement in India, including the establishment of women-only higher education institutions such as Ja’ni University. Through this article, the author invites readers to reflect that, in terms of rights and status, Malay women are essentially in a more advanced position compared to women of other nations. This is due to local cultural values that uphold the freedom, honor, and dignity of women.",
      },
      numberOfPage: 4,
      authorId: 'kuddus',
      highlight: BookHighlight(
        page: 1,
        centerX: 0.21226246422054304,
        centerY: 0.8045121596350856,
        width: 0.29241970456709726,
        height: 0.293483125703462,
      ),
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
      edition: {AppLanguage.id: 'Edisi No. 48 Tahun 7'},
      editionId: 'soenting',
      isOtherEdition: true,
    ),

    // Pahesan
    Book(
      id: 'pahesan',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Pahésan',
      date: {AppLanguage.id: '15 Juni 1917'},
      contentTitle: {AppLanguage.id: 'Majalah Pahésan, Edisi 15 April 1941'},
      content: {
        AppLanguage.id:
            'Edisi ini memuat tulisan untuk mengenang R.A. Kartini, pandangan tentang pentingnya pendidikan campuran antara perempuan dan laki-laki, perkembangan seni rupa Bali, serta pembahasan seputar gaya busana dan ekspresi diri perempuan. Disertai puisi dan prosa, Pahésan menghadirkan perspektif perempuan muda terhadap isu sosial, budaya, dan gaya hidup pada masanya.',
      },
      numberOfPage: 12,
      authorId: 'pahesan',
      highlight: null,
      edition: {AppLanguage.id: 'Edisi No. 12 Tahun 48'},
      isOtherEdition: false,
      isMedia: true,
    ),

    // Sedar
    Book(
      id: 'sedar',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Sedar',
      date: {AppLanguage.id: 'November 1930'},
      contentTitle: {
        AppLanguage.id: '“Tentang Hak dan Kewajiban Perempoean Indonesia” ',
      },
      content: {
        AppLanguage.id:
            'Melalui nama pena “Doro Petak”, penulis artikel ini mengkritik anggapan bahwa perempuan adalah makhluk lemah. Ia menekankan pentingnya kesetaraan hak dan kewajiban antara laki-laki dan perempuan, serta perlunya pemahaman tentang dinamika sosial. Penulis membandingkan situasi di Hindia Belanda dengan kondisi di negara-negara di Eropa, di mana perempuan telah memiliki hak untuk menduduki berbagai jenis pekerjaan, termasuk hak untuk memilih dan dipilih dalam pemilihan umum. Di Rusia, bahkan perempuan dapat terlibat dalam upaya mempertahankan kemerdekaan bangsa. Kondisi ini kemudian dikontraskan dengan keadaan di negeri jajahan seperti Hindia Belanda, di mana masih terdapat ketimpangan dalam relasi antara laki-laki dan perempuan. Tulisan ini menyerukan kerja sama antara perempuan dan laki-laki demi menghapus penderitaan bangsa dan membangun masa depan yang lebih setara.',
      },
      numberOfPage: 8,
      authorId: 'sedar',
      highlight: BookHighlight(
        page: 1,
        centerX: 0.49782504409153174,
        centerY: 0.6699519553314609,
        width: 0.8922842922264999,
        height: 0.6182387442811139,
      ),
      edition: {AppLanguage.id: 'Edisi No. 4 Tahun 1'},
      isOtherEdition: false,
      isMedia: true,
    ),

    // Soeara Iboe
    Book(
      id: 'soeara_iboe',
      type: {AppLanguage.id: 'Surat Kabar'},
      title: 'Soeara Iboe',
      date: {AppLanguage.id: '2 Mei 1932'},
      contentTitle: {AppLanguage.id: '“Perloenja Perempoean Disekolahkan”'},
      content: {
        AppLanguage.id:
            'Artikel ini menyoroti pentingnya pendidikan bagi perempuan di tengah pandangan tradisional bahwa perempuan pada akhirnya hanya akan “kembali ke dapur.” V. Diaviance menegaskan bahwa ibu berpendidikan lebih mampu mengelola rumah tangga dibandingkan yang tidak. Ia mengajak pembaca merenung lewat pertanyaan retoris: “Tidakkah kita bangga jika anak atau cucu perempuan kita mampu sejajar dengan saudara laki-lakinya?” Menurutnya, untuk menjadi ibu yang baik, perempuan harus mampu memberi teladan melalui pendidikan.',
      },
      numberOfPage: 4,
      authorId: 'soeara_iboe',
      highlight: BookHighlight(
        page: 1,
        centerX: 0.6533516531018382,
        centerY: 0.7767897084801051,
        width: 0.620725511654897,
        height: 0.4005513058340456,
      ),
      edition: {AppLanguage.id: 'Edisi 1 Tahun 1'},
      isOtherEdition: false,
      isMedia: true,
    ),

    // Doenia Kita
    Book(
      id: 'doenia_kita',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Doenia Kita',
      date: {AppLanguage.id: 'Agustus 1938'},
      contentTitle: {AppLanguage.id: '“Ilmoe Penjoeloeh Djalan” '},
      content: {
        AppLanguage.id:
            'Artikel berjudul “Ilmoe Penjoeloeh Djalan” yang ditulis oleh Siti Salimah dan dimuat dalam majalah Doenia Kita edisi Agustus 1938 membahas pentingnya kaum ibu memiliki aktivitas di luar urusan domestik. Dalam tulisannya, Salimah menekankan bahwa para ibu sebaiknya meluangkan waktu untuk membaca buku-buku yang bermanfaat bagi pengembangan diri. Selain itu, ia juga menganjurkan agar kaum ibu memperluas jaringan pergaulan di luar rumah tangga. Menurutnya, pergaulan yang luas memungkinkan perempuan untuk senantiasa mengikuti perkembangan zaman dan memperoleh informasi baru. Meskipun tugas utama perempuan terletak pada pengasuhan anak, peran sebagai istri, dan pengelolaan rumah tangga, penulis meyakini bahwa semakin luas pengetahuan dan keterampilan yang dimiliki seorang ibu, maka akan semakin baik pula kemampuannya dalam menjalankan peran domestik dan mendidik anak-anaknya.',
      },
      numberOfPage: 26,
      authorId: 'doenia_kita',
      highlight: BookHighlight(
        page: 13,
        centerX: 0.48246904802827065,
        centerY: 0.41575593432139366,
        width: 0.8924461137349179,
        height: 0.7774322119843885,
      ),
      edition: {AppLanguage.id: 'Edisi No. 10 Tahun 1'},
      isOtherEdition: false,
      isMedia: true,
    ),

    // Dunia Wanita
    Book(
      id: 'dunia_wanita',
      type: {AppLanguage.id: 'Majalah'},
      title: 'Dunia Wanita',
      date: {AppLanguage.id: '15 Juni 1917'},
      contentTitle: {AppLanguage.id: '“TODO” '},
      content: {AppLanguage.id: 'TODO'},
      numberOfPage: 25,
      authorId: 'dunia_wanita',
      highlight: null,
      edition: {AppLanguage.id: 'Edisi No. 12 Tahun 48'},
      isOtherEdition: false,
      isMedia: true,
      collection: {AppLanguage.id: 'Koleksi PERPUSNAS'},
    ),

    // KPWI
    Book(
      id: 'kpwi',
      type: {AppLanguage.id: 'Buku'},
      title: 'Kesatuan Pergerakan Wanita Indonesia',
      date: {AppLanguage.id: '22 Desember 1958'},
      contentTitle: {AppLanguage.id: '“TODO” '},
      content: {AppLanguage.id: 'TODO'},
      numberOfPage: 26,
      authorId: 'kpwi',
      highlight: null,
      edition: {AppLanguage.id: 'TODO'},
      isOtherEdition: false,
      isMedia: true,
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
        AppLanguage.en:
            "Ruhana Kuddus, also known as the Mother of Indonesian Press, was born on December 20, 1884, in Koto Gadang, Agam Regency, West Sumatra. Roehana had a deep concern for the fate of women and fought for women's education. In 1912, she founded Soenting Melajoe, one of the first women’s newspapers in the Dutch East Indies based in Padang.",
      },
      contentType: {AppLanguage.id: 'Surat Kabar'},
      contentTitle: 'Soenting Melajoe',
      contentDescription: {
        AppLanguage.id:
            'Soenting Melajoe adalah majalah yang memuat tajuk rencana, puisi, tulisan-tulisan perempuan, serta biografi tokoh-tokoh ternama. Terbit pertama kali pada 10 Juli 1912 dan berhenti pada 28 Januari 1921, majalah ini merekam diskusi perempuan Hindia Belanda seputar pendidikan, kesehatan, agama, dan budaya dalam tiap edisi empat halamannya.',
        AppLanguage.en:
            "Soenting Melajoe was a magazine that featured editorials, poetry, writings by women, and biographies of prominent figures. First published on July 10, 1912, and ending on January 28, 1921, the magazine captured discussions among women in the Dutch East Indies about education, health, religion, and culture in each of its four-page editions.",
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
      name: 'Utami Suryadarma',
      birthDeathDate: '6 Desember 1912',
      background: {
        AppLanguage.id:
            'Utami Suryadarma merupakan tokoh perempuan yang pernah mewakili Indonesia dalam Inter-Asian Women Conference pada Desember 1947. Saat remaja, bersama sang kakak, Utami mendirikan Pahésan. Melalui media ini, ia mendorong perempuan untuk berpikir, bersuara, dan menyuarakan harapan atas masa depan bangsanya.',
      },
      contentType: {AppLanguage.id: 'Majalah'},
      contentTitle: 'Pahésan',
      contentDescription: {
        AppLanguage.id:
            'Majalah Pahésan (berarti “cermin”) didirikan di Solo dan terbit antara tahun 1937 hingga 1941. Mengangkat tema sosial-budaya serta peran perempuan, Pahésan menjadi ruang bagi perempuan muda menyuarakan pandangan dan membangun kesadaran kolektif di tengah perjuangan menuju kemerdekaan. Meski menggunakan bahasa Belanda yang menjadi bahasa pendidikan formal bagi anak-anak priyayi masa itu, suara-suara kritis dan emansipasi terasa pada tiap halamannya.',
      },
      isMediaAuthor: true,
    ),
    Author(
      id: 'sedar',
      name: 'Sedar',
      birthDeathDate: 'Sejak Agustus 1930',
      contentType: {AppLanguage.id: 'Majalah'},
      contentTitle: 'Sedar',
      contentDescription: {
        AppLanguage.id:
            'Organisasi Persatuan Wanita Sedar didirikan di Bandung pada tahun 1930 sebagai ruang perjuangan bagi perempuan kelas pekerja. Salah satu media yang diterbitkan organisasi ini adalah Majalah Sedar, yang memuat tulisan-tulisan tentang pendidikan, perjuangan perempuan, serta pemikiran-pemikiran progresif. Banyak di antaranya menyuarakan keresahan terhadap kondisi perempuan, termasuk penolakan terhadap praktik poligami yang dianggap merugikan perempuan. Majalah ini juga berfungsi sebagai sarana pendidikan rakyat.',
      },
      isMediaAuthor: true,
    ),
    Author(
      id: 'soeara_iboe',
      name: 'Soeara Iboe',
      birthDeathDate: '2 Mei 1932',
      contentType: {AppLanguage.id: 'Surat Kabar'},
      contentTitle: 'Soeara Iboe',
      contentDescription: {
        AppLanguage.id:
            'Soeara Iboe adalah surat kabar yang terbit di Sibolga pada 2 Mei 1932, lahir dari semangat kolektif organisasi kaum ibu bernama Comite Kaoem Iboe yang berdiri pada 8 November 1931. Surat kabar ini hadir untuk mempererat hubungan antar ibu, menyebarkan informasi dari luar wilayah, serta menjadi alat perlawanan terhadap kekuasaan adat. Isinya mencakup berbagai topik seperti masakan, kesehatan ibu dan anak, pendidikan, iklan, berita umum, hingga karya sastra berupa puisi dan cerita.',
      },
      isMediaAuthor: true,
    ),
    Author(
      id: 'doenia_kita',
      name: 'Doenia Kita',
      birthDeathDate: 'Sejak 1937',
      contentType: {AppLanguage.id: 'Majalah'},
      contentTitle: 'Doenia Kita',
      contentDescription: {
        AppLanguage.id:
            'Majalah Doenia Kita (DK) adalah majalah bulanan yang pertama kali terbit pada tahun 1937. Majalah ini didirikan oleh Siti Alimah untuk memenuhi aspirasi kaum perempuan yang mengalami kesulitan akibat zaman baru. Istilah Doenia Kita mengandung makna dunia kelahiran dan kebatinannya kaum putri. Haluan dari majalah ini adalah kemajuan seluruh perempuan Indonesia.',
      },
      isMediaAuthor: true,
    ),
    Author(
      id: 'dunia_wanita',
      name: 'Ani Idrus',
      birthDeathDate: '25 NOVEMBER 1918 – 9 JANUARI 1999',
      background: {
        AppLanguage.id:
            'Ani Idrus, tokoh pers dan wartawan perempuan Indonesia, lahir di Sawahlunto pada 25 November 1918. Ia mendirikan majalah Dunia Wanita yang mengangkat isu-isu perempuan di bidang sosial, politik, dan ekonomi untuk mendorong kemajuan kaum perempuan. Atas jasanya di bidang jurnalistik, ia menerima penghargaan Satya Penegak Pers Pancasila dari Menteri Penerangan RI pada tahun 1998.',
      },
      contentType: {AppLanguage.id: 'Majalah'},
      contentTitle: 'Dunia Wanita',
      contentDescription: {
        AppLanguage.id:
            'Majalah Dunia Wanita didirikan pada tahun 1949 di Medan. Dunia Wanita menjadi salah satu majalah perempuan yang populer pasca kemerdekaan Indonesia. Memuat berbagai isu perempuan dari bidang sosial, politik hingga ekonomi untuk memberikan informasi dan kemajuan bagi perempuan. Di bawah pimpinan Ani Idrus, majalah ini juga menyuarakan tentang pentingnya keterlibatan laki-laki dalam rumah tangga.',
      },
      isMediaAuthor: true,
    ),
    Author(
      id: 'kpwi',
      name: 'Kesatuan Pergerakan Wanita Indonesia',
      birthDeathDate: 'Sejak 1928',
      contentType: {AppLanguage.id: 'KETERANGAN'},
      contentTitle: '',
      contentDescription: {
        AppLanguage.id:
            'Perjuangan kolektif perempuan Indonesia secara historis ditandai dengan terselenggaranya Kongres Perempuan Pertama pada 28 Desember 1928. Momentum tersebut menjadi tonggak penting bagi terbentuknya kesadaran bersama akan perlunya pengorganisasian perempuan dalam memperjuangkan hak-hak sosial, politik, dan budaya. Salah satu wujud konkret dari perkembangan ini adalah pendirian Perikatan Perkumpulan Isteri Indonesia.',
      },
      isMediaAuthor: true,
    ),
  ];

  List<Book> getAllBooks({bool showEditions = false}) {
    List<Book> books =
        allBooks.where((b) => !b.isOtherEdition || showEditions).toList();
    books.sort((a, b) => a.title.compareTo(b.title));
    return books;
  }

  Author? getAuthor({required Book book}) {
    for (var author in allAuthors) {
      if (book.authorId == author.id) {
        return author;
      }
    }
    return null;
  }

  List<Book> getBooksFromAuthor({
    required Author author,
    bool showEditions = false,
  }) {
    return allBooks
        .where(
          (b) => b.authorId == author.id && (!b.isOtherEdition || showEditions),
        )
        .toList();
  }

  List<Book> getBookEditions({required Book book}) {
    return allBooks
        .where(
          (b) =>
              b.editionId == book.editionId &&
              b != book &&
              book.editionId != null,
        )
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
