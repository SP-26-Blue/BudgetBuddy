class FinancialData {
  final List<Transaction> transactions;
  final double totalBalance;
  final double totalIncome;
  final double totalExpense;
  final double totalSavings;
  final Map<String, double> expenses;

  FinancialData({
    required this.transactions,
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpense,
    required this.totalSavings,
    required this.expenses,
  });

// Implement factory methods to create instances from fetched JSON data
}

class Transaction {
  final String id;
  final double amount;
  final String name;
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.name,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['transaction_id'],
      amount: json['amount'],
      name: json['name'],
      date: DateTime.parse(json['date']),
    );
  }

// Add more fields as needed
}
