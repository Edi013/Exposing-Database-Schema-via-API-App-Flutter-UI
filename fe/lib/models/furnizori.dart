class Furnizori {
  double? id;
  String? numeFurnizori;
  double? timpExecutie;

  Furnizori({
    this.id,
    this.numeFurnizori,
    this.timpExecutie,
  });

  factory Furnizori.fromJson(Map<String, dynamic> json) {
    return Furnizori(
      id: json['id']?.toDouble(),
      numeFurnizori: json['numeFurnizori'],
      timpExecutie: json['timpExecutie']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numeFurnizori': numeFurnizori,
      'timpExecutie': timpExecutie,
    };
  }
}
