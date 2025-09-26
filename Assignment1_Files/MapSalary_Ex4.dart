/*
4. Write a Dart program that uses a map to store the names and salary of a group
of people. Then, print the names of people whose salary are in between 50000
to 75000.
 */

void main() {
  
  var employees = <String, double>{};
  
  employees["Nicolas"] = 59000;
  employees["Esmeralda"] = 70600;
  employees["Michael"] = 45000;
  employees["Stephanie"] = 97350;
  employees["Lucas"] = 51350;
  employees["Sofia"] = 50000;
  employees["Mathew"] = 75000;
  employees["Chris"] = 49999.99;
  print(employees.keys);
  employees.forEach((name, salary) {
    if(salary >= 50000 && salary <= 75000) {
      print("$name makes between \$50,000 and \$75,000");
    }
  });
  
}