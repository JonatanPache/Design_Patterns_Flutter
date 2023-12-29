class ResponseApi {
  String status;
  String userTier;
  int total;
  int startIndex;
  int pageSize;
  int currentPage;
  int pages;
  String orderBy;
  dynamic results;

  ResponseApi({
    required this.status,
    required this.userTier,
    required this.total,
    required this.startIndex,
    required this.pageSize,
    required this.currentPage,
    required this.pages,
    required this.orderBy,
    required this.results,
  });

  factory ResponseApi.defaultRes() {
    return ResponseApi(
        status: "400",
        userTier: "free",
        total: 0,
        startIndex: 0,
        pageSize: 0,
        currentPage: 0,
        pages: 0,
        orderBy: "asc",
        results: null);
  }

  ResponseApi copyWith({
    String? status,
    String? userTier,
    int? total,
    int? startIndex,
    int? pageSize,
    int? currentPage,
    int? pages,
    String? orderBy,
    dynamic results,
  }) =>
      ResponseApi(
        status: status ?? this.status,
        userTier: userTier ?? this.userTier,
        total: total ?? this.total,
        startIndex: startIndex ?? this.startIndex,
        pageSize: pageSize ?? this.pageSize,
        currentPage: currentPage ?? this.currentPage,
        pages: pages ?? this.pages,
        orderBy: orderBy ?? this.orderBy,
        results: results ?? this.results,
      );

  factory ResponseApi.fromMap(Map<String, dynamic> json) => ResponseApi(
        status: json["status"],
        userTier: json["userTier"],
        total: json["total"],
        startIndex: json["startIndex"],
        pageSize: json["pageSize"],
        currentPage: json["currentPage"],
        pages: json["pages"],
        orderBy: json["orderBy"],
        results: json["results"],
        // results: List<Post>.from(json["results"].map((x) => Post.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "userTier": userTier,
        "total": total,
        "startIndex": startIndex,
        "pageSize": pageSize,
        "currentPage": currentPage,
        "pages": pages,
        "orderBy": orderBy,
        // "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "results": results,
      };
}
