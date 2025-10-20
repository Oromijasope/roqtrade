import 'dart:convert';
import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  // Function to fetch the 24hr price, percentage change, and icon for a given symbol using CoinGecko
  Future<Map<String, dynamic>> fetchCoinData(String symbol) async {
    final uri = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${symbol.toLowerCase()}');

    try {
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          return {
            'price': data[0]['current_price'].toString(),
            'changePercentage':
                data[0]['price_change_percentage_24h'].toString(),
            'icon': data[0]['image'],
          };
        } else {
          throw Exception('Coin data not found for $symbol');
        }
      } else {
        throw Exception(
            'Failed to fetch coin data for $symbol, Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching coin data for $symbol: $e');
    }
  }

  // Function to fetch all available coins on CoinGecko
  Future<List<Map<String, dynamic>>> fetchTop20Coins() async {
    final uri = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1');

    try {
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Map<String, dynamic>> top20Coins = [];

        for (var coinData in data) {
          top20Coins.add({
            'symbol': coinData['symbol'],
            'id': coinData['id'],
            'name': coinData['name'],
            'current_price': coinData['current_price'],
            'market_cap': coinData['market_cap'],
            'price_change_percentage_24h':
                coinData['price_change_percentage_24h'],
            'icon': coinData['image'],
          });
        }

        return top20Coins;
      } else {
        throw Exception(
            'Failed to fetch top 20 coins from CoinGecko, Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching top 20 coins from CoinGecko: $e');
    }
  }

  Future<List<FlSpot>> fetchCoinMarketChart(String coinId, int days) async {
    final uri = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=usd&days=$days',
    );

    try {
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List prices = data['prices'];

        return prices.asMap().entries.map<FlSpot>((entry) {
          int index = entry.key;
          double price = entry.value[1].toDouble();
          return FlSpot(index.toDouble(), price);
        }).toList();
      } else {
        throw Exception('Failed to fetch market chart for $coinId');
      }
    } catch (e) {
      throw Exception('Error fetching market chart: $e');
    }
  }
}
