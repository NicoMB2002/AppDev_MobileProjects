import "dart:async";
import 'dart:io';

void main() {
  File file1 = new File("C:\\Users\\nicom\\Desktop\\AppDev_2\\names.txt"); //path
  Future<String> fs = file1.readAsString();

  //Returns a future object, async method
  fs.then((data) => print(data));

  //Once file is read, call back method is invoked
  print('End of main');
}