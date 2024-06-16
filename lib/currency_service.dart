import 'package:intl/intl.dart';

Map<String, String> countryToCurrency = {
  'US': 'USD',
  'CA': 'CAD',
  'GB': 'GBP',
  'DE': 'EUR',
  'LK': 'LKR'
  // Add more mappings as needed
};

String formatCurrency(double amount, String currencyCode) {
  if (currencyCode == 'LKR') {
    // Assuming a mock conversion rate for demonstration, replace with a real API or conversion logic
    const conversionRate = 330.0; // 1 USD = 330 LKR (example rate)
    amount *= conversionRate;
  }
  return '$currencyCode ${amount.toStringAsFixed(2)}';
}
