class DeleteClientRequest {
  int id;

  DeleteClientRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
