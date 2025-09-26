/*
2. Create a class SuperBank with a constructor. Then, create a subclass RBC that
extends SuperBank. Now include default constructor, named constructor,
parametrized constructor for both classes and write objects to access all the 6
constructors. Include super keywork wherever necessary.
 */

class SuperBank {
  var location;
  var deposit;
  var withdraw;

  SuperBank(): location = 'Unknown', deposit = 0, withdraw = 0;

  SuperBank.parameterized(this.location, this.deposit, this.withdraw);

  SuperBank.branch() : location = 'Montreal', deposit = 500, withdraw = 100;


}

class RBC extends SuperBank {
  var travelRewards;

  // Default constructor
  RBC() : travelRewards = 0,
        super();

  // Parameterized constructor
  RBC.parameterized(String location, int deposit, int withdraw, this.travelRewards)
      : super.parameterized(location, deposit, withdraw);

  // Named constructor
  RBC.promotion() : travelRewards = 100,
        super.branch();

}


void main() {

  var superBankDefault = SuperBank();
  var superBankParam = SuperBank.parameterized('Toronto', 1000, 200);
  var superBankBranch = SuperBank.branch();

  var rbcDefault = RBC();
  var rbcParameterized = RBC.parameterized('Vancouver', 1500, 300, 250);
  var rbcPromo = RBC.promotion();

  print('SuperBank Default: ${superBankDefault.location}, ${superBankDefault.deposit}, ${superBankDefault.withdraw}');
  print('SuperBank Parameterized: ${superBankParam.location}, ${superBankParam.deposit}, ${superBankParam.withdraw}');
  print('SuperBank Branch: ${superBankBranch.location}, ${superBankBranch.deposit}, ${superBankBranch.withdraw}');

  print('RBC Default: ${rbcDefault.location}, ${rbcDefault.deposit}, ${rbcDefault.withdraw}, ${rbcDefault.travelRewards}');
  print('RBC Custom: ${rbcParameterized.location}, ${rbcParameterized.deposit}, ${rbcParameterized.withdraw}, ${rbcParameterized.travelRewards}');
  print('RBC Promo: ${rbcPromo.location}, ${rbcPromo.deposit}, ${rbcPromo.withdraw}, ${rbcPromo.travelRewards}');
}

