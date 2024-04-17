import 'package:flutter/foundation.dart';
import 'PlaidService.dart';
import 'FinancialDataModel.dart';

class DashboardDataProvider with ChangeNotifier {
  final PlaidService plaidService;
  FinancialData? _financialData;
  bool _isLoading = true; // Assuming loading starts immediately, adjust as necessary
  String? _errorMessage;

  DashboardDataProvider({required this.plaidService}) {
    fetchFinancialData('your_access_token'); // Consider fetching data upon initialization or triggered by UI
  }

  FinancialData? get financialData => _financialData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Optionally, expose a method to initiate data fetching from UI, with the ability to pass a new access token
  Future<void> initFetchFinancialData(String accessToken) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await fetchFinancialData(accessToken);
  }

  Future<void> fetchFinancialData(String accessToken) async {
    try {
      var transactionsJson = await plaidService.fetchTransactions(accessToken);
      if (transactionsJson != null && transactionsJson.containsKey("transactions")) {
        // Ensure transactionsJson has the key "transactions" and it's not empty
        List<Transaction> transactions = List<Transaction>.from(
          transactionsJson["transactions"].map((model) => Transaction.fromJson(model)),
        );

        double totalBalance = transactions.fold(0, (sum, item) => sum + item.amount);
        double totalIncome = transactions.where((item) => item.amount > 0).fold(0, (sum, item) => sum + item.amount);
        double totalExpense = transactions.where((item) => item.amount < 0).fold(0, (sum, item) => sum + item.amount);
        // Calculate expenses by categories if applicable

        _financialData = FinancialData(
          transactions: transactions,
          totalBalance: totalBalance,
          totalIncome: totalIncome,
          totalExpense: totalExpense,
          totalSavings: totalIncome + totalExpense, // This calculation might need adjustment
          expenses: _calculateExpenses(transactions), // Implement this method based on your data structure
        );
      } else {
        _errorMessage = "No transactions data received.";
      }
    } catch (e) {
      _errorMessage = "Failed to load data: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Map<String, double> _calculateExpenses(List<Transaction> transactions) {
    // Placeholder for an expenses calculation method
    // Implement based on your categorization logic
    return {};
  }

  void resetData() {
    _financialData = null;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
  }
}
