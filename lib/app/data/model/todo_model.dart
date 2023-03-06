import 'dart:convert';
/// title : ""
/// description : ""
/// deadline : ""

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));
String todoModelToJson(TodoModel data) => json.encode(data.toJson());
class TodoModel {
  TodoModel({
      this.title, 
      this.description, 
      this.deadline,});

  TodoModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    deadline = json['deadline'];
  }
  String? title;
  String? description;
  String? deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['deadline'] = deadline;
    return map;
  }

}