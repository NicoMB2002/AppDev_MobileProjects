void main() async { // 'async' tells dart that the function might use Asynchronous logic
  print('start fetching recipes');

  await Future.delayed(Duration(seconds: 1), () { // 'await' tells dart that the function
                                                  // will return a 'Future'
    print('recipes found');
  });

  print('After fetching recipes');

  String computation = 'A random computation';
  print(computation);
}