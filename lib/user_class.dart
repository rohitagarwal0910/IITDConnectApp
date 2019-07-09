import './clubs/club_class.dart';

class User {
  String name;
  bool isAdmin;
  Club adminof;

  User([this.name, this.isAdmin, this.adminof]);
}

User user1 = User('DummyUser', true, dummyClub1);
