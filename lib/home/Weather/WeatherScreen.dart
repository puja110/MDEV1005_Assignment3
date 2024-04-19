import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String _apiKey = '01a5e44188324b300bfc7e2cd1da9370'; 
  final String _apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final double _latitude = 44.3894; // Latitude of Barrie, Canada
  final double _longitude = -79.6903; // Longitude of Barrie, Canada

  double? _temperature;
  String? _weatherCondition;
  bool _isLoading = true;

  // Function to fetch weather data from the API
  Future<void> _fetchWeatherData() async {
    try {
      final response = await http.get(Uri.parse('$_apiUrl?lat=$_latitude&lon=$_longitude&appid=$_apiKey'));

      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);

        setState(() {
          _temperature = (weatherData['main']['temp'] - 273.15); // Convert temperature from Kelvin to Celsius
          _weatherCondition = weatherData['weather'][0]['description'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Temperature: ${_temperature?.toStringAsFixed(2)}°C',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Text(
                  'Weather: ${_weatherCondition ?? 'Loading...'}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
    );
  }
}
