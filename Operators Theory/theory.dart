void main() {
  print(0 ?? 1); // <- 0
  print(1 ?? null); //<- 1
  print(null ?? null);
  print(null ?? null ?? 1);

  // ?? => this is a null aware operator
  //?. => Null aware access. It prevents you from crashing your app by trying
  // to access the property or method of an object that might be null

print('============');
  var value;
  print(value?.toLowerCase()?.toUpperCase());

  // int i = null // an integer primitive data type already uses 32 bits memory
                  // it doesn't make sense for it to be null (empty)
  print('============');

  var i = null; //This works because 'var' is not any type of data type (empty/nothing)

  var value2;
  print(value2);
  value2 ??= 5;
  print(value2);
  value2 ??= 6;
  print(value2);

  print('============');

  int? nullable1 = 101; //This is a nullable var,
                  // it can take both int as well as null bc of '?'
  print(nullable1);
  nullable1 = null;
  int nonNul = 3294; //this is non nullable
  // nonNul = nullable1; //This is not possible
  nonNul = nullable1!; // It's only possible if you add a '!'

  // ! => Assertion Operator
  //Assertion Operator: used to assign non nullable vars to nullable
}