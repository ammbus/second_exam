
import 'dart:convert';

class CommentModel {
  num id;
  String body;
  num postId;
  num likes;
  User user;
  CommentModel({
    required this.id,
    required this.body,
    required this.postId,
    required this.likes,
    required this.user,
  });

  CommentModel copyWith({
    num? id,
    String? body,
    num? postId,
    num? likes,
    User? user,
  }) {
    return CommentModel(
      id: id ?? this.id,
      body: body ?? this.body,
      postId: postId ?? this.postId,
      likes: likes ?? this.likes,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'body': body,
      'postId': postId,
      'likes': likes,
      'user': user.toMap(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as num,
      body: map['body'] as String,
      postId: map['postId'] as num,
      likes: map['likes'] as num,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, body: $body, postId: $postId, likes: $likes, user: $user)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
          other.body == body &&
          other.postId == postId &&
          other.likes == likes &&
          other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    body.hashCode ^
    postId.hashCode ^
    likes.hashCode ^
    user.hashCode;
  }
}

class User {
  num id;
  String username;
  String fullName;
  User({
    required this.id,
    required this.username,
    required this.fullName,
  });

  User copyWith({
    num? id,
    String? username,
    String? fullName,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'fullName': fullName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as num,
      username: map['username'] as String,
      fullName: map['fullName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, username: $username, fullName: $fullName)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
          other.username == username &&
          other.fullName == fullName;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ fullName.hashCode;
}
