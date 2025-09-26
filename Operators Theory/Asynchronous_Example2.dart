void main() {
  Future.delayed(Duration(seconds: 1), () {
    print('inside delayed 1');
  }).then((_) {
    print('print inside then 1');

    Future.delayed(Duration(seconds: 1), () {
      print('inside delayed 2');
    }).then((_) {
      print('print inside then 2');
    });
  });
  print('Print after delayed');

  ////////////////////////////////////////////////
  // Future.delayed(Duration(seconds: 1), () {
  //   print('inside delayed 1');
  // }).then((_) async{
  //   print('print inside then 1');
  //
  //   await Future.delayed(Duration(seconds: 1), () {
  //     print('inside delayed 2');
  //   }).then((_) {
  //     print('print inside then 2');
  //   });
  // });
  // print('Print after delayed');
}