void main() {
  print('start');

  fetchUserData().then((user) {
    print("Updated user data: $user");
  }).catchError((error) {
    print('Error: $error');
  });
  print('End');
}

Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 5)); // simulating a network request
  return "John Doe";
}