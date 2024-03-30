

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  @override
  bool operator ==(other) {
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}