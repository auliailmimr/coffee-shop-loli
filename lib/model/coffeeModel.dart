class Coffee {
  final String name;
  final String type;
  final String shortDesc;
  final String desc;
  final String image;
  final int rate;
  final int price;

  Coffee(
      {required this.name,
      required this.type,
      required this.shortDesc,
      required this.desc,
      required this.image,
      required this.rate,
      required this.price});
}

List<Coffee> menu = [
  Coffee(
      name: "Cappuccino",
      type: 'Hot',
      shortDesc: "Esspresso dengan rasa lebih mild",
      desc:
          "Kamu pasti selalu menemukan cappuccino dalam buku menu tiap kali pergi ke kedai kopi, atau bahkan kafe-kafe biasa. Cappuccino adalah olahan espresso yang paling banyak digemari, terutama bagi penikmat kopi dengan rasa lebih mild",
      image: "assets/cappuccino.jpg",
      rate: 5,
      price: 22000),
  Coffee(
      name: "Macchiato",
      type: "Hot",
      shortDesc: "Espresso dengan milky dan gurih.",
      desc:
          "Kalau kamu gak terlalu menikmati kopi yang cenderung pahit, kamu bisa pesan macchiato sebagai alternatif. Rasio steamed milk dalam minuman ini lebih besar dari espresso, sehingga ada sentuhan milky dan gurih.",
      image: "assets/Macchiato.jpg",
      rate: 5,
      price: 22000),
  Coffee(
      name: "Espresso",
      type: "Hot",
      shortDesc: "Ekstrak kopi dengan buih putih",
      desc:
          "Minuman kopi paling dasar ini biasanya disajikan dalam demitasse alias cangkir khusus espresso berukuran 30 mililiter (satu shot) sampai 118 mililiter. Espresso bertekstur pekat dan pahit, dengan buih putih alias crema di atasnya yang terbentuk dari tekanan minyak dalam bijih kopi.",
      image: "assets/espreso.jpg",
      rate: 5,
      price: 12000),
  Coffee(
      name: "Americano",
      type: "Hot",
      shortDesc: "Espresso dengan air panas",
      desc:
          "Americano terdiri dari satu shot espresso yang dituangkan dalam cangkir berukuran 178 mililiter yang dicampur dengan air panas hingga memenuhi gelas. Jenis lainnya adalah doppio, yakni segelas Americano dengan dua shot espresso. Minuman ini kerap disajikan dalam panas maupun dingin yang disebut iced Americano.",
      image: "assets/americano.jpg",
      rate: 5,
      price: 15000),
  Coffee(
      name: "Latte",
      type: "Hot",
      shortDesc: "Espresso banyak susu dan busa lembut",
      desc:
          "Latte adalah minuman kopi yang lezat dengan espresso sebagai bahan dasarnya, lalu disajikan dengan banyak susu steamed, dan ditutupi dengan lapisan busa lembut. Rasanya lembut dan creamy.",
      image: "assets/espreso.jpg",
      rate: 4,
      price: 25000),
  Coffee(
      name: "Ristretto",
      type: "Cold",
      shortDesc: "Versi lebih konsentrat dari espresso.",
      desc:
          "Ristretto adalah varian espresso yang lebih konsentrat, dibuat dengan mengurangi jumlah air yang digunakan dalam proses ekstraksi. Rasanya sangat pekat dan kuat.",
      image: "assets/ristretto.jpg",
      rate: 4,
      price: 24000),
  Coffee(
      name: "Cortado",
      type: "Cold",
      shortDesc: "Espresso dengan sedikit susu.",
      desc:
          "Cortado adalah minuman kopi yang berisi espresso yang dicampur dengan sejumlah kecil susu panas. Ini adalah pilihan yang sempurna jika Anda ingin menikmati rasa espresso yang murni dengan sedikit kelembutan susu.",
      image: "assets/cortado.jpg",
      rate: 5,
      price: 21000),
  Coffee(
      name: "Affogato",
      type: "Cold",
      shortDesc: "Espresso disiram ke atas es krim.",
      desc:
          "Affogato adalah minuman penutup yang lezat. Espresso panas dituangkan ke atas es krim, menciptakan kombinasi panas-dingin yang sempurna. Rasanya kaya dan memuaskan.",
      image: "assets/affogato.jpeg",
      rate: 5,
      price: 28000),
  Coffee(
      name: "Brownies",
      type: "Food",
      shortDesc: "Kue dengan butiran coklat",
      desc:
          "Brownies adalah semacam cake biasa akan tetapi menggunakan coklat batangan yang dilelehkan dan mempunyai rasa manis dan bertekstur padat atau bantat.",
      image: "assets/browniess.jpg",
      rate: 5,
      price: 28000),
  Coffee(
      name: "Biscotti",
      type: "Food",
      shortDesc: "Kue Italia keras dan renyah.",
      desc:
          " Biscotti adalah kue Italia yang terkenal karena kekerasannya yang khas. Kue ini ideal untuk dicelupkan ke dalam minuman kopi seperti Espresso atau Latte. Rasanya ringan dan beragam tergantung pada varietasnya.",
      image: "assets/biscotti.jpg",
      rate: 5,
      price: 15000),
  Coffee(
      name: "Croissant",
      type: "Food",
      shortDesc: "Pastry lembut dengan lapisan renyah.",
      desc:
          " Croissant adalah pastry yang terbuat dari lapisan-lapisan lembut yang renyah. Croissant segar adalah pasangan yang sempurna untuk minuman kopi. Nikmati dengan rasa aslinya atau varietas seperti croissant cokelat.",
      image: "assets/croissant.jpg",
      rate: 5,
      price: 18000),
];
