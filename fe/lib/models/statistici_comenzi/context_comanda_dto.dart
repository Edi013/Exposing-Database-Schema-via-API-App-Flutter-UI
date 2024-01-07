class ContextComandaDto {
  double? orderId;
  int? itemsCount;
  double? orderValue;

  ContextComandaDto({
    this.orderId,
    this.itemsCount,
    this.orderValue,
  });

  factory ContextComandaDto.fromJson(Map<String, dynamic> json) {
    return ContextComandaDto(
      orderId: json['orderId']?.toDouble(),
      itemsCount: json['itemsCount'],
      orderValue: json['orderValue']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'itemsCount': itemsCount,
      'orderValue': orderValue,
    };
  }
}
