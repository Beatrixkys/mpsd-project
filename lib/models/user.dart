class MyUser {
  final String uid;

  MyUser({required this.uid});
}

class MyUserData {
  final String uid;
  final String name;
  final int waterCounter;

  MyUserData(
      {required this.uid, required this.name, required this.waterCounter});
}
