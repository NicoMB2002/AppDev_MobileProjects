//async* to create stream of values without obstructing the main loop

import 'dart:async';

void main() {
  // create a Stream controller to emit values asynchronously
  final controller = StreamController<int>();

  //Listen to the generated stream and print the numbers
  controller.stream.listen((value) {
    print(value);
  });
  //start an asynchronous generator
  generateNumbers(controller);

  //close the stream controller after 11 seconds
  Future.delayed(Duration(seconds: 11), () { // this time is so that it gives
                                        // the generateNumbers() enough time (10 sec)
                                        //to finish executing
    controller.close();
  });
}

Future<void> generateNumbers(StreamController<int> controller) async {
  for(int i = 1; i <= 10; i++) {
    //Simulate an asynchronous operation (e.g., fetching data)
    await Future.delayed((Duration(seconds: 1)));
    //Yield the value to the Stream
    controller.sink.add(i);
  }
}