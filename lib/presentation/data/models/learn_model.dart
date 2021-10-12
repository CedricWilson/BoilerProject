class LearnModel {
  int status;
  int error;
  List<LearnData> learnData;

  LearnModel(
      {required this.status, required this.error, required this.learnData});

  factory LearnModel.fromJson(Map<String, dynamic> json) {
    int status = json['status'];
    int error = json['error'];
    List<LearnData> learnData = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        learnData.add(new LearnData.fromJson(v));
      });
    }
    return LearnModel(status: status, error: error, learnData: learnData);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.learnData != null) {
      data['data'] = this.learnData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LearnData {
  String title;
  String content;
  String image;
  String url;
  int likes;
  int id;
  int likesCount;

  LearnData(
      {required this.title,
    required  this.content,
   required   this.image,
   required   this.url,
   required   this.id,
   required   this.likes,
    required  this.likesCount});

  factory LearnData.fromJson(Map<String, dynamic> json) {
    String title = json['title'];
    String content = json['content'];
    String image = json['image'];
    String url = json['url'];
    int likes = int.parse(json["likes"].toString());
    int id = int.parse(json["learnblock_id"].toString());
    int likesCount = int.parse(json["likes_count"].toString());
    return LearnData(
        title: title,
        content: content,
        image: image,
        url: url,
        id: id,
        likes: likes,
        likesCount: likesCount);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    return data;
  }
}
