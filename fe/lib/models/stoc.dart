class Stoc {
  double? id;
  double? idFurnizori;
  String? numeLocatie;
  String? descriereLocatie;
  double? pretUnitar;
  String? descriere;

  Stoc({
    this.id,
    this.idFurnizori,
    this.pretUnitar,
    this.descriere,
    this.numeLocatie,
    this.descriereLocatie,
  });

  factory Stoc.fromJson(Map<String, dynamic> json) {
    return Stoc(
      id: json['id']?.toDouble(),
      idFurnizori: json['idFurnizori']?.toDouble(),
      numeLocatie: json['numeLocatie'],
      descriereLocatie: json['descriereLocatie'],
      pretUnitar: json['pretUnitar']?.toDouble(),
      descriere: json['descriere'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idFurnizori': idFurnizori,
      'numeLocatie': numeLocatie,
      'descriereLocatie': descriereLocatie,
      'pretUnitar': pretUnitar,
      'descriere': descriere,
    };
  }
}
