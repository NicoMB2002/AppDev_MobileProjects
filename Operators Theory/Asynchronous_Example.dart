void main() {
  print('Start fetching recipes');

  Future.delayed(Duration(seconds: 5), () { //'Future' is a piece of code that will be executed later (in the future)
    print('recipes fetched');
  }).then((_) { // '_' means it is not executing any value from the Future code
    print('After fetching recipes');
  });

  String computation = 'a random computation';
  print(computation);
}