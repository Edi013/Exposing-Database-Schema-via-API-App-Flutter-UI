class Clienti {
  double? id;
  String? nume;
  String? prenume;
  String? adresa;
  String? companie;
  String? oras;
  String? cod;
  String? telefon;

  Clienti({
    this.id,
    this.nume,
    this.prenume,
    this.adresa,
    this.companie,
    this.oras,
    this.cod,
    this.telefon,
  });

  factory Clienti.fromJson(Map<String, dynamic> json) {
    return Clienti(
      id: json['id']?.toDouble(),
      nume: json['nume'],
      prenume: json['prenume'],
      adresa: json['adresa'],
      companie: json['companie'],
      oras: json['oras'],
      cod: json['cod'],
      telefon: json['telefon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nume': nume,
      'prenume': prenume,
      'adresa': adresa,
      'companie': companie,
      'oras': oras,
      'cod': cod,
      'telefon': telefon,
    };
  }
}
