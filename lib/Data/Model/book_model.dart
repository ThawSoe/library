class BookDTO {
  String? status;
  int? total;
  List<Books>? books;

  BookDTO({this.status, this.total, this.books});

  BookDTO.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["books"] is List) {
      books = json["books"] == null
          ? null
          : (json["books"] as List).map((e) => Books.fromJson(e)).toList();
    }
  }

  static List<BookDTO> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BookDTO.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["total"] = total;
    if (books != null) {
      data["books"] = books?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  BookDTO copyWith({
    String? status,
    int? total,
    List<Books>? books,
  }) =>
      BookDTO(
        status: status ?? this.status,
        total: total ?? this.total,
        books: books ?? this.books,
      );
}

class Books {
  String? id;
  String? title;
  String? subtitle;
  String? authors;
  String? image;
  String? url;

  Books(
      {this.id, this.title, this.subtitle, this.authors, this.image, this.url});

  Books.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["authors"] is String) {
      authors = json["authors"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  static List<Books> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Books.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["subtitle"] = subtitle;
    data["authors"] = authors;
    data["image"] = image;
    data["url"] = url;
    return data;
  }

  Books copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? authors,
    String? image,
    String? url,
  }) =>
      Books(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        authors: authors ?? this.authors,
        image: image ?? this.image,
        url: url ?? this.url,
      );
}
