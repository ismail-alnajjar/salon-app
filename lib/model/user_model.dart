import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String? name; // 👈 أضفنا الاسم كخيار إضافي

  UserModel({required this.uid, required this.email, this.name});

  // تحويل Firebase User إلى UserModel
  factory UserModel.fromFirebaseUser(User user, {String? name}) {
    return UserModel(uid: user.uid, email: user.email ?? "", name: name);
  }

  // تحويل UserModel إلى Map (للتخزين في Firestore مستقبلاً)
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name};
  }

  // استرجاع UserModel من Map (من Firestore مثلًا)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(uid: map['uid'], email: map['email'], name: map['name']);
  }
}
