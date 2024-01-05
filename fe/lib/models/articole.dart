class Articole {
  double? id;
  double? idComenzi;
  double? idStoc;
  double? cantitate;
  double? pretTotal;

  Articole({
    this.id,
    this.idComenzi,
    this.idStoc,
    this.cantitate,
    this.pretTotal,
  });

  factory Articole.fromJson(Map<String, dynamic> json) {
    return Articole(
      id: json['id']?.toDouble(),
      idComenzi: json['idComenzi']?.toDouble(),
      idStoc: json['idStoc']?.toDouble(),
      cantitate: json['cantitate']?.toDouble(),
      pretTotal: json['pretTotal']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idComenzi': idComenzi,
      'idStoc': idStoc,
      'cantitate': cantitate,
      'pretTotal': pretTotal,
    };
  }
}
