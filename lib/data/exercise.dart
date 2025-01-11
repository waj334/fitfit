class Exercise {
  Exercise({
    required this.id,
    this.metadata,
  });

  dynamic id;
  Map<String, dynamic>? metadata;

  static const keyName = "name";

  String get name {
    return metadata?[keyName];
  }
}
