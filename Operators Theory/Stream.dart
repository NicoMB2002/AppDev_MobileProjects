import 'dart:async';

void main() {
  final stream = countStream(5);
  stream.listen((data) {
    print('Data: $data');
  });
}

Stream<int> countStream(int max) async* {
  for(int i = 0; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}