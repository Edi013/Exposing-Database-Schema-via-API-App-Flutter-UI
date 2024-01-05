class Stoc {
  double? id;
  double? idFurnizori;
  double? pretUnitar;
  String? descriere;
  String? unitate;
  String? descriereUnitate;

  Stoc({
    this.id,
    this.idFurnizori,
    this.pretUnitar,
    this.descriere,
    this.unitate,
    this.descriereUnitate,
  });

  factory Stoc.fromJson(Map<String, dynamic> json) {
    return Stoc(
      id: json['id']?.toDouble(),
      idFurnizori: json['idFurnizori']?.toDouble(),
      pretUnitar: json['pretUnitar']?.toDouble(),
      descriere: json['descriere'],
      unitate: json['unitate'],
      descriereUnitate: json['descriereUnitate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idFurnizori': idFurnizori,
      'pretUnitar': pretUnitar,
      'descriere': descriere,
      'unitate': unitate,
      'descriereUnitate': descriereUnitate,
    };
  }
}
