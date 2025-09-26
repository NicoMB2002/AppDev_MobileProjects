Future<String> fetchData(String userId) async {
  print('Fetching user data for $userId');
  //simulate a network for time consuming operations
  await Future.delayed(Duration(seconds: 5));
  //return a processed string based on userId
  return 'user data $userId successfully retrieved';
}

void main() {
  String userId = 'user123';
  // Call the async and handle its result using then()

  fetchData(userId).then((data) {
    print('Processing data: $data');
    // You can perform further operations with the ' data ' here
    return 'data processed and ready for display';
  }).then((processedResult) {
    print('Processed result: $processedResult');
  }).catchError((error) {
    print('An error occurred: $error');
  });

  print('Program continues while fetching data...');
}