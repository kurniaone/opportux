# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Category.all.blank?
  puts "Prepopulate Categories ..."
  Category.create([
    {:code => 'b', :name => 'Business'},
    {:code => 'p', :name => 'People'},
    {:code => 'j', :name => 'Project'}
  ])
end

if City.all.blank?
  puts "Prepopulate Countries ..."
  ActiveRecord::Base.connection.execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Countries.txt' INTO TABLE countries
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"

  ActiveRecord::Base.connection.execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Regions.txt' INTO TABLE regions
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"

  puts "Prepopulate Cities ..."
  ActiveRecord::Base.connection.execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Cities.txt' INTO TABLE cities
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"
end

# admin
if Admin.all.blank?
  puts "Create default admin ..."
  Admin.create(
    :fullname => 'Administrator',
    :email    => 'admin@opportux.com',
    :password => '123oppORtuX',
    :password_confirmation => '123oppORtuX'
  )
end

# content
if Content.all.blank?
  puts "Create default content ..."
  Content.create([
    {
      :code => "howitworks",
      :title => "How It Works",
      :value => "<p>\r\n\tApa sebenarnya &#39;Opportux&#39;?</p>\r\n<div>\r\n\tOpportux sebenarnya berasal dari 2 kata yaitu opportunity dan exchange yang artinya tempat bertukar ataupun mencari peluang.&nbsp;</div>\r\n<div>\r\n\tPeluang tentunya ada bermacam-macam yang bise berbentuk usaha,pekerjaan ataupun ide.&nbsp;</div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\tPemikiran tentang opportux ini berasal dari pengalaman kami bahwa ada 2 tipe manusia:&nbsp;</div>\r\n<ol>\r\n\t<li>\r\n\t\tYang punya modal tetapi tidak tahu apa yang mau dikerjakan, dan&nbsp;</li>\r\n\t<li>\r\n\t\tYang punya ide-ide cemerlang bahkan usaha yang sudah berjalan tetapi kesulitan untuk memulai ataupun berekspansi.</li>\r\n</ol>\r\n<div>\r\n\tNah, dari dua manusia itu diharapkan Opportux bisa mempertemukan keduanya jadi yang punya usaha bisa</div>\r\n<div>\r\n\tdapat suntikan modal dan sebaliknya yang punya modal bisa berkarya. Tujuan akhirya tentu supaya dunia usaha di Indonesia&nbsp;</div>\r\n<div>\r\n\tsemakin berkembang&nbsp;</div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\tCaranya,&nbsp;</div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\tMisalkan saya pengusaha warung sop buntut, karena modal saya terbatas maka saya berniat mencari investor untuk&nbsp;</div>\r\n<div>\r\n\tmendirikan cabang baru, maka saya akan tampilkan usaha sop buntut saya ini supaya nanti ada banyak investor yang melihat,&nbsp;</div>\r\n<div>\r\n\tbila ada yang teratrik tentu akan menghubungi saya dan kita bicarakan lebih Ianjut.&nbsp;</div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\tBagaimana cara saya menampilkan usaha saya di Opportux?</div>\r\n<div>\r\n\tInilah Iangkah-Iangkahnya:</div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\t1. Sign up dan kemudian login&nbsp;</div>\r\n<div>\r\n\t<img alt=\"\" src=\"/ckeditor_assets/pictures/1/content_hiw-signup.png\" style=\"width: 500px; height: 76px; \" /></div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\t2. Lalu upload usaha anda, click tombol upload dan ikuti petunjuk di layar.</div>\r\n<div>\r\n\t<img alt=\"\" src=\"/ckeditor_assets/pictures/2/content_hiw-upload.png\" style=\"width: 500px; height: 69px; \" /></div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\t3. Isi dan deskripisikan data-data usaha anda, syarat bagi investor dan lengkapi dengan foto dan contact detail agar mudah&nbsp;</div>\r\n<div>\r\n\tdihubungi oleh investor yang berminat&nbsp;</div>\r\n<div>\r\n\t&nbsp;</div>\r\n<div>\r\n\t4. Setelah mengisi semua maka tinggal click upload dan kita akan ditampilkan preview postingan kita, cek dan apabila&nbsp;</div>\r\n<div>\r\n\tsudah oke click <strong>publish</strong> dan usaha anda akan dilihat banyak investor</div>\r\n"
    },{
      :code => "disclaimer",
      :title => "Disclaimer",
      :value => "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. "
    },{
      :code => "policy",
      :title => "Policy",
      :value => "<p>\r\n\t<strong>Kebijakan Privasi - Privacy Policy</strong></p>\r\n<p>\r\n\tPT Kreasi Media Prakarsa (&quot;Kami&quot;) berkeinginan melindungi dan menghargai hak pribadi anda.</p>\r\n<p>\r\n\tKebijakan ini (beserta syarat-syarat penggunaan dari kami [www.opportux.com] dan dokumen lain yang disebut padanya) menetapkan dasar atas mana data pribadi yang kami terima dari anda dan atau yang anda berikan kepada kami akan diproses oleh kami.</p>\r\n<p>\r\n\tDi bawah ini secara cermat untuk mengerti bagaimana kami memperlakukan informasi data pribadi anda.</p>\r\n<p>\r\n\t<strong>Informasi yang dapat kami kumpulkan dari anda</strong></p>\r\n<p>\r\n\tKami berhak mendapatkan dan mengolah data berikut mengenai anda:</p>\r\n<p>\r\n\tInformasi yang anda berikan dengan mengisi formulir di web kami [Sign-Up]. Di sini termasuk informasi yang diberikan pada saat pendaftaran untuk menggunakan situs kami, menempatkan materi. Kami juga berhak meminta informasi kepada anda [sewaktu anda mengikuti persaingan atau promosi yang disponsori oleh PT Kreasi Media Prakarsa dan] sewaktu anda melaporkan masalah ke situs kami.</p>\r\n<ul>\r\n\t<li>\r\n\t\tApabila anda menghubungi kami, kami dapat menyimpan catatan mengenai korespondensi tersebut.</li>\r\n\t<li>\r\n\t\tKami berhak meminta anda melengkapi survei yang kami gunakan untuk tujuan penelitian, meskipun anda tidak harus menanggapinya.</li>\r\n\t<li>\r\n\t\tInformasi lengkap mengenai kunjungan anda ke Web kami [termasuk, namun tidak terbatas pada, data lalu-lintas, data lokasi, weblog dan data komunikasi lainnya, apakah hal ini disyaratkan untuk tujuan penagihan kami atau yang lainnya]</li>\r\n</ul>\r\n<p>\r\n\t<strong><u>IP (INTERNET PROTOCOL) ADDRESS &amp; COOKIES</u></strong></p>\r\n<p>\r\n\tKami dapat menghimpun informasi mengenai komputer anda, termasuk, bilamana tersedia, alamat IP, sistem operasi dan jenis browser anda, untuk administrasi sistem dan untuk melaporkan informasi keseluruhan ke pengiklan kami. Semua ini adalah data statistika mengenai kerja dan pola browsing pengguna kami, dan tidak mengidentifikasi kepada siapapun.</p>\r\n<p>\r\n\tKarena alasan yang sama, kami dapat mendapatkan informasi mengenai penggunaan internet anda secara umum dengan menggunakan file cookies yang disimpan di hard drive komputer anda. Cookies berisi informasi yang dialihkan ke hard drive komputer anda. Cookies membantu kami memperbaiki situs kami dan memberikan layanan yang lebih baik dan lebih sesuai dengan selera anda.</p>\r\n<p>\r\n\tCookies memungkinkan kami:</p>\r\n<ul>\r\n\t<li>\r\n\t\tMemperdiksi jumlah dan pola penggunaan users kami.</li>\r\n\t<li>\r\n\t\tMenyimpan informasi mengenai preferensi anda dan memungkinkan kami menyesuaikan situs kami sesuai dengan kepentingan anda.</li>\r\n\t<li>\r\n\t\tMengenali anda sewaktu anda kembali ke situs kami.</li>\r\n</ul>\r\n<p>\r\n\tAnda dapat menolak menerima cookies dengan mengaktifkan pengaturan di browser anda melalui pengaturan cookies anda. Namun, apabila anda menolak menerima cookies ini, anda mungkin tidak dapat mengakses beberapa bagian tertentu dari web kami.</p>\r\n<p>\r\n\tPerlu diperhatikan bahwa pengiklan kami juga dapat menggunakan cookies, yang mana kami tidak dapat mengendalikannya.</p>\r\n<p>\r\n\t<strong>PENGUNAAN INFORMASI</strong></p>\r\n<p>\r\n\tKami menggunakan informasi yang dimiliki mengenai anda dengan cara-cara sebagai berikut:</p>\r\n<ul>\r\n\t<li>\r\n\t\tUntuk memastikan bahwa isi dari web kami disajikan dengan cara yang paling tepat untuk anda.</li>\r\n\t<li>\r\n\t\tUntuk memberikan kepada anda informasi, produk atau layanan yang anda minta dari kami atau yang kami pikir mungkin berguna bagi anda, dimana anda setuju untuk dihubungi untuk tujuan tersebut.</li>\r\n\t<li>\r\n\t\tUntuk melaksanakan kewajiban kami yang timbul dari suatu kontrak yang diadakan antara anda dan kami.</li>\r\n\t<li>\r\n\t\tUntuk memungkinkan anda ambil bagian dalam fitur interaktif layanan kami, sewaktu anda memilih demikian.</li>\r\n\t<li>\r\n\t\tUntuk memberitahu anda mengenai perubahan terhadap layanan kami.</li>\r\n</ul>\r\n<p>\r\n\tKami juga dapat menggunakan data anda atau mengijinkan pihak ketiga yang terpilih untuk menggunakan data anda, untuk memberikan kepada anda informasi mengenai barang dan jasa yang dapat anda minati dan kami atau mereka dapat menghubungi anda dalam hal ini melalui pos atau telepon.</p>\r\n<p>\r\n\t<strong>Pengungkapan informasi anda</strong></p>\r\n<p>\r\n\tKami dapat mengungkapkan informasi pribadi anda kepada pihak ketiga:</p>\r\n<ul>\r\n\t<li>\r\n\t\tApabila kami menjual atau membeli suatu bisnis atau aset, dimana, dalam hal ini, kami dapat mengungkapkan data pribadi anda kepada calon penjual atau pembeli dari bisnis atau aset tersebut.</li>\r\n\t<li>\r\n\t\tApabila PT. Kreasi Media Prakarsa atau secara substansial semua asetnya diakuisisi oleh pihak ketiga, dimana, dalam hal ini, data pribadi yang dimiliki oleh pihaknya mengenai pelanggannya akan menjadi salah satu aset yang dialihkan.</li>\r\n\t<li>\r\n\t\tApabila kami berkewajiban mengungkapkan atau berbagi data pribadi anda dalam upaya mematuhi kewajiban hukum atau dalam upaya memberlakukan atau menerapkan syarat-syarat penggunaan kami dan perjanjian-perjanjian lain; atau untuk melindungi hak, properti, atau keselamatan PT Kreasi Media Prakarsa, pelanggan kami, atau pihak lain. Di sini termasuk pertukaran informasi dengan perusahaan dan organisasi lain untuk tujuan perlindungan terhadap penipuan dan pengurangan resiko.</li>\r\n</ul>\r\n<p>\r\n\t<strong>Hak anda</strong></p>\r\n<p>\r\n\tAnda berhak meminta kami untuk tidak memroses data pribadi anda untuk tujuan pemasaran. Kami akan memberitahu anda (sebelum mengumpulkan data anda) apabila kami bermaksud menggunakan data anda untuk tujuan tersebut. Anda dapat menggunakan hak anda untuk menolak pemrosesan tersebut dengan menghubungi kami di info@opportux.com</p>\r\n<p>\r\n\tSitus kami, dari waktu ke waktu, dapat berisi link ke dan dari situs web jaringan mitra, pengiklan dan afiliasi kami. Apabila anda mengikuti link ke salah satu dari situs-situs web ini, mesti diperhatikan bahwa situs-situs web ini memipunyai kebijakan hak-pribadinya sendiri dan kami tidak memiliki tanggung jawab atau menanggung kewajiban atas kebijakan tersebut.</p>\r\n<p>\r\n\t<strong>Perubahan atas kebijakan hak-pribadi kami</strong></p>\r\n<p>\r\n\tPerubahan yang dapat kami lakukan atas kebijakan hak-pribadi kami di masa depan akan diperlihatkan di halaman ini dan, bilamana perubahan ini penting, akan diberitahukan kepada anda melalui e-mail.</p>\r\n<p>\r\n\t<strong>Pihak yang dapat dihubungi</strong></p>\r\n<p>\r\n\tPertanyaan, komentar dan permintaan mengenai kebijakan hak-pribadi ini akan disambut baik. email info@opportux.com.</p>\r\n<p>\r\n\t<strong>Disclaimer - Pembebasan dari TANGGUNG JAWAB DAN KEWAJIBAN</strong></p>\r\n<p>\r\n\t&nbsp;</p>\r\n"
    },{
      :code => "term",
      :title => "Terms and Conditions",
      :value => "<p>\r\n\t<strong>SYARAT-SYARAT PENGGUNAAN SITUS WEB</strong></p>\r\n<p>\r\n\tHalaman ini (beserta dokumen yang disebut di dalamnya) menperlihatkan kepada anda syarat-syarat penggunaan yang menjadi dasar bagi anda dalam penggunaan situs web kami <u>www.opportux.com</u>, baik sebagai tamu atau pengguna terdaftar. Anda setuju bahwa penggunaan situs web ini terus-menerus oleh anda, menunjukkan bahwa anda menerima dan menyetujui syarat-syarat penggunaan ini dan anda sepakat untuk mematuhinya. Apabila anda tidak setuju atas syarat-syarat penggunaan ini, silahkan untuk tidak melanjutkan penggunaan situs kami.</p>\r\n<p>\r\n\t<strong>TENTANG KAMI</strong></p>\r\n<p>\r\n\t<u><a href=\"http://www.opportux.com\">www.opportux.com</a></u>&nbsp;adalah web yang dioperasikan dan dimiliki oleh PT Kreasi Media Prakarsa (&quot;Kami&quot;), suatu perseroan terbatas yang didirikan berdasarkan hukum Republik Indonesia. Setiap pertanyaan mengenai kami. Silakan email ke <u><a href=\"mailto:info@opportux.com\">info@opportux.com</a></u></p>\r\n<p>\r\n\t<strong>AKSES SITUS KAMI</strong></p>\r\n<p>\r\n\tAkses ke situs kami tersedia untuk umum. Namun, kami berhak menarik atau mengubah layanan yang kami sediakan di situs kami tanpa memberitahu anda terlebih dahulu (lihat di bawah ini). Kami tidak bertanggung jawab apabila karena suatu alasan situs kami tidak tersedia pada saat kapanpun atau untuk jangka waktu berapa lama.</p>\r\n<p>\r\n\tDari waktu ke waktu, kami dapat membatasi akses ke beberapa bagian dari situs kami atau keseluruhan situs kami kepada pengguna yang telah terdaftar pada kami.</p>\r\n<p>\r\n\tApabila anda memilih atau anda diberi kode identifikasi pengguna, password atau bagian informasi lainnya sebagai bagian dari prosedur keamanan kami, maka anda harus menjaga kerahasiaan informasi tersebu. Kami berhak mematikan fungsi kode identifikasi pengguna atau password, apakah dipilih oleh anda atau dialokasikan oleh kami pada setiap saat apabila, menurut pandangan kami, anda tidak mematuhi salah satu ketentuan dari syarat-syarat penggunaan ini.</p>\r\n<p>\r\n\tSewaktu menggunakan situs kami, anda harus mematuhi ketentuan kebijakan penggunaan yang telah disetujui dari kami&nbsp;<a href=\"http://opportux.com/policy\">Privacy Policy</a>.</p>\r\n<p>\r\n\tAnda bertanggung jawab melaksanakan semua pengaturan yang diperlukan untuk anda mengakses ke situs kami. Anda juga bertanggung jawab memastikan bahwa semua orang yang mengakses situs kami melalui hubungan internet anda, mengetahui syarat-syarat ini dan mematuhinya.</p>\r\n<p>\r\n\t<strong>INFORMASI LAIN</strong></p>\r\n<p>\r\n\tKomentar dan materi lain yang ditempatkan di situs kami tidak dimaksudkan sebagai saran yang dapat diandalkan. Oleh karena itu, kami membebaskan diri dari semua kewajiban dan tanggung jawab yang timbul dari ketergantungan atas materi tersebut dari pengunjung situs kami, atau dari siapapun yang bisa saja mendapat informasi mengenai salah satu isinya.</p>\r\n<p>\r\n\tSetiap informasi yang terkait dengan barang yang ditawarkan diberikan oleh pihak yang menawarkan / penjual dan kami tidak bertanggung jawab atas informasi tersebut. Anda harus mengkaji secara seksama informasi tersebut sebelum mulai mengajukan penawaran.</p>\r\n<p>\r\n\t<strong>RUTINITAS PERUBAHAN WEB</strong></p>\r\n<p>\r\n\tKami bermaksud memperbaharui situs kami secara rutin dan setiap saat dapat mengubah isinya. Apabila timbul kebutuhan, kami dapat menutupnya untuk waktu yang tidak tertentu. Materi di situs kami dapat kedaluwarsa pada setiap saat kapanpun juga dan kami tidak menanggung kewajiban untuk membarui materi tersebut.</p>\r\n<p>\r\n\t<strong>KEWAJIBAN KAMI</strong></p>\r\n<p>\r\n\tMateri yang ditayangkan di situs kami disediakan tanpa ketentuan atau jaminan apapun. Sejauh diijinkan oleh hukum, kami dan para pihak ketiga yang berhubungan dengan kami dengan ini secara tegas mengecualikan:</p>\r\n<ol>\r\n\t<li>\r\n\t\tSemua ketentuan, jaminan dan syarat lain yang dapat dinyatakan secara tidak langsung oleh undang-undang, hukum adat atau hukum keadilan.</li>\r\n\t<li>\r\n\t\tKewajiban atas kehilangan atau kerugian langsung, tidak langsung atau yang merupakan akibat yang ditanggung oleh pengguna dalam hubungannya dengan situs kami atau dalam hubungannya dengan penggunaan, ketidakmampuan menggunakan, atau akibat dari penggunaan situs kami, setiap situs web yang terkait dengannya dan setiap materi yang ditempatkan padanya, termasuk, namun tidak terbatas pada, kewajiban atas:\r\n\t\t<ol>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan penghasilan atau pendapatan;</li>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan bisnis;</li>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan laba atau kontrak;</li>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan penghematan yang telah diantisipasi sebelumnya;</li>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan data;</li>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan goodwill;</li>\r\n\t\t\t<li>\r\n\t\t\t\twaktu manajemen atau kantor yang tersia-siakan; dan</li>\r\n\t\t\t<li>\r\n\t\t\t\tkehilangan atau kerugian lain apapun jenisnya, terlepas dari bagaimana hal itu timbul dan apakah disebabkan oleh kelalaian, pelanggaran terhadap kontrak atau lainnya, meskipun dapat diperkirakan sebelumnya.</li>\r\n\t\t</ol>\r\n\t</li>\r\n</ol>\r\n<p>\r\n\tHal ini tidak berpengaruh pada kewajiban kami yang tidak dapat dikecualikan atau dibatasi berdasarkan hukum yang berlaku.</p>\r\n<p>\r\n\tMateri yang ditayangkan di situs kami adalah untuk informasi saja guna membantu anda memutuskan untuk mengajukan penawaran atau tidak mengajukan penawaran untuk barang (barang-barang). Kami atau salah satu karyawan kami tidak bertanggung jawab atas akibat langsung atau tidak langsung dari keputusan anda untuk mengajukan penawaran atau tidak mengajukan penawaran.</p>\r\n<p>\r\n\t<strong>[UPLOAD] materi ke situs kami</strong></p>\r\n<p>\r\n\tApabila anda menggunakan fitur [upload] materi ke situs kami atau untuk mengadakan hubungan dengan para pengguna lain dari situs kami, maka anda harus memenuhi standar isi yang ditetapkan dalam kebijakan penggunaan yang dapat diterima dari kami&nbsp;<a href=\"http://opportux.com/policy\">Privacy Policy</a>. Anda menjamin bahwa kontribusi tersebut memenuhi standar tersebut, dan anda memberi ganti rugi kepada kami atas pelanggaran terhadap jaminan tersebut.</p>\r\n<p>\r\n\tSetiap materi yang anda unggah ke situs kami akan dianggap materi yang tidak bersifat rahasia dan tidak dilindungi oleh hak kepemilikan dan kami berhak menggunakan, menyalin, menyebar-luaskan dan mengungkapkan materi tersebut kepada pihak ketiga untuk segala tujuan. Kami juga berhak mengungkapkan identitas anda kepada pihak ketiga yang mengklaim bahwa materi yang ditempatkan atau diunggah oleh anda ke situs kami merupakan pelanggaran terhadap hak kekayaan intelektual mereka atau hak pribadi mereka.</p>\r\n<p>\r\n\tKami tidak akan bertanggung jawab atau berkewajiban kepada pihak ketiga atas isi atau ketepatan dari materi yang ditempatkan oleh anda atau pengguna lain dari situs kami. Kami berhak menghapus materi atau posting yang anda buat di situs kami apabila hal itu bersifat ofensif, dapat memicu kebencian, mencemarkan nama baik atau dibatasi berdasarkan hukum yang bersangkutan di Indonesia.</p>\r\n<p>\r\n\t<strong>LINK DARI SITUS KAMI</strong></p>\r\n<p>\r\n\tDimana situs kami berisi link ke situs lain dan sumberdaya lain yang disediakan oleh pihak ketiga, link tersebut disediakan hanya untuk informasi anda. Kami tidak mengontrol isi dari situs atau sumberdaya tersebut dan tidak bertanggung jawab atas hal itu atau atas kehilangan atau kerugian yang dapat timbul akibat penggunaannya oleh anda.</p>\r\n<p>\r\n\t<strong>PERUBAHAN</strong></p>\r\n<p>\r\n\tAtas kebijaksanaan kami, kami berhak merevisi syarat-syarat penggunaan ini pada saat kapanpun dengan mengubah halaman ini tanpa pemberitahuan kepada anda sebelumnya. Anda diharapkan untuk memeriksa halaman ini dari waktu ke waktu untuk memperhatikan setiap perubahan yang kami buat. Sebagian dari ketentuan yang terdapat dalam syarat-syarat penggunaan ini juga dapat digantikan oleh ketentuan-ketentuan atau pemberitahuan yang dipublikasi di bagian lain di situs kami.</p>\r\n<p>\r\n\t<strong>HAL LAIN</strong></p>\r\n<p>\r\n\tApabila anda memiliki hal lain yang ingin disampaikan atau komentar maupun keprihatinan mengenai materi yang tampak di situs kami, silakan hubungi <u>info@opportux.com</u></p>\r\n<p>\r\n\tTerima kasih atas kunjungan anda ke situs kami.</p>\r\n"
    },{
      :code => "about-us",
      :title => "About Us",
      :value => "About us"
    }
  ])
end