class ArticoleComandateNiciodataDto {
  double? idStoc;
  double? idFurnizori;
  double? pretUnitar;
  String? numeUnitate;
  String? descriereUnitate;

  ArticoleComandateNiciodataDto({
    this.idStoc,
    this.idFurnizori,
    this.pretUnitar,
    this.numeUnitate,
    this.descriereUnitate,
  });

  factory ArticoleComandateNiciodataDto.fromJson(Map<String, dynamic> json) {
    return ArticoleComandateNiciodataDto(
      idStoc: json['idStoc']?.toDouble(),
      idFurnizori: json['idFurnizori']?.toDouble(),
      pretUnitar: json['pretUnitar']?.toDouble(),
      numeUnitate: json['numeUnitate'],
      descriereUnitate: json['descriereUnitate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idStoc': idStoc,
      'idFurnizori': idFurnizori,
      'pretUnitar': pretUnitar,
      'numeUnitate': numeUnitate,
      'descriereUnitate': descriereUnitate,
    };
  }
}
