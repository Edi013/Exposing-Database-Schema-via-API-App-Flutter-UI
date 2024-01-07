class ContextComenziDto {
  late int? numarComenzi;
  late int? numarArticole;
  late double? valoareTotala;

  ContextComenziDto({
    this.numarComenzi,
    this.numarArticole,
    this.valoareTotala,
  });

  factory ContextComenziDto.fromJson(Map<String, dynamic> json) {
    return ContextComenziDto(
      numarComenzi: json['numarComenzi'],
      numarArticole: json['numarArticole'],
      valoareTotala: json['valoareTotala']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numarComenzi': numarComenzi,
      'numarArticole': numarArticole,
      'valoareTotala': valoareTotala,
    };
  }
}
