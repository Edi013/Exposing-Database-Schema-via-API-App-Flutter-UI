class Comenzi {
  double? id;
  double? idClienti;
  DateTime? dataPlasare;
  DateTime? dataOnorare;
  DateTime? dataPlata;

  Comenzi({
    this.id,
    this.idClienti,
    this.dataPlasare,
    this.dataOnorare,
    this.dataPlata,
  });

  factory Comenzi.fromJson(Map<String, dynamic> json) {
    return Comenzi(
      id: json['id']?.toDouble(),
      idClienti: json['idClienti']?.toDouble(),
      dataPlasare: json['dataPlasare'] != null
          ? DateTime.parse(json['dataPlasare'])
          : null,
      dataOnorare: json['dataOnorare'] != null
          ? DateTime.parse(json['dataOnorare'])
          : null,
      dataPlata:
          json['dataPlata'] != null ? DateTime.parse(json['dataPlata']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idClienti': idClienti,
      'dataPlasare': dataPlasare?.toIso8601String(),
      'dataOnorare': dataOnorare?.toIso8601String(),
      'dataPlata': dataPlata?.toIso8601String(),
    };
  }
}
