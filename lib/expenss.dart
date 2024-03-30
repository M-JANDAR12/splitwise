import "./user.dart";

class Expense {
  final String id;
  final double amount;
  final DateTime date;
  final String description;
  final User paidBy;
  final List<User> beneficiaries;

  Expense({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.paidBy,
    required this.beneficiaries,
  });

  double getAmountPerBeneficiary() {
    return amount / beneficiaries.length;
  }
}