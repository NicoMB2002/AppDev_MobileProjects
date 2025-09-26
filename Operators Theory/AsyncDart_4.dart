
void main() {
  print('Start');

  try {
    final user = fetchUserData2();
    print('Received user: $user');
  } catch (error) {
    print("Error: $error");
  }
  print('End');
}

Future<String> fetchUserData2() async {
  await Future.delayed(Duration(seconds: 5));
  return 'John Doe';
}