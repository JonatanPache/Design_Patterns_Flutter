class Post1 {
  String id;
  String type;
  String sectionId;
  String sectionName;
  DateTime webPublicationDate;
  String webTitle;
  String webUrl;
  String apiUrl;
  bool isHosted;

  Post1({
    required this.id,
    required this.type,
    required this.sectionId,
    required this.sectionName,
    required this.webPublicationDate,
    required this.webTitle,
    required this.webUrl,
    required this.apiUrl,
    required this.isHosted,
  });

  Post1 copyWith({
    String? id,
    String? type,
    String? sectionId,
    String? sectionName,
    DateTime? webPublicationDate,
    String? webTitle,
    String? webUrl,
    String? apiUrl,
    bool? isHosted,
  }) =>
      Post1(
        id: id ?? this.id,
        type: type ?? this.type,
        sectionId: sectionId ?? this.sectionId,
        sectionName: sectionName ?? this.sectionName,
        webPublicationDate: webPublicationDate ?? this.webPublicationDate,
        webTitle: webTitle ?? this.webTitle,
        webUrl: webUrl ?? this.webUrl,
        apiUrl: apiUrl ?? this.apiUrl,
        isHosted: isHosted ?? this.isHosted
      );

  factory Post1.fromMap(Map<String, dynamic> json) => Post1(
    id: json["id"],
    type: json["type"],
    sectionId: json["sectionId"],
    sectionName: json["sectionName"],
    webPublicationDate: DateTime.parse(json["webPublicationDate"]),
    webTitle: json["webTitle"],
    webUrl: json["webUrl"],
    apiUrl: json["apiUrl"],
    isHosted: json["isHosted"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "sectionId": sectionId,
    "sectionName": sectionName,
    "webPublicationDate": webPublicationDate.toIso8601String(),
    "webTitle": webTitle,
    "webUrl": webUrl,
    "apiUrl": apiUrl,
    "isHosted": isHosted
  };
}


