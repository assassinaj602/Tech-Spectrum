// main.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  // Add this to handle certificate errors in debug mode
  HttpOverrides.global = MyHttpOverrides();
  runApp(const WeatherApp());
}

// Custom HTTP overrides to handle certificate issues
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      themeMode: ThemeMode.system,
      home: const WeatherHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  bool isLoading = true;
  String error = '';
  WeatherData? weatherData;
  final TextEditingController _cityController = TextEditingController(
    text: "London",
  );

  @override
  void initState() {
    super.initState();
    // Use a slight delay to ensure the widget is fully initialized
    Future.delayed(Duration(milliseconds: 100), () {
      fetchWeather("London");
    });
  }

  Future<void> fetchWeather(String city) async {
    setState(() {
      isLoading = true;
      error = '';
    });

    // Using the API key from your code
    const apiKey = "65960728240fe6b667471a5c2c15b69b";

    // Using HTTPS to avoid certificate issues
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http
          .get(Uri.parse(url), headers: {"Accept": "application/json"})
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw TimeoutException(
                "Connection timed out. Please check your internet connection.",
              );
            },
          );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          weatherData = WeatherData.fromJson(data);
          isLoading = false;
        });
      } else {
        setState(() {
          error =
              "Error: ${response.statusCode}. ${response.reasonPhrase ?? 'Unknown error'}";
          isLoading = false;
        });
      }
    } on SocketException catch (e) {
      setState(() {
        error =
            "Network error: No internet connection. Please check your network settings.";
        isLoading = false;
      });
    } on TimeoutException catch (e) {
      setState(() {
        error = "Connection timed out. Please check your internet connection.";
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = "Error: ${e.toString()}";
        isLoading = false;
      });

      // Print detailed error for debugging
      print("Detailed error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade200],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildSearchBar(),
              Expanded(child: _buildWeatherContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.7),
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              style: const TextStyle(fontSize: 16),
              onSubmitted: (value) => fetchWeather(value),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => fetchWeather(_cityController.text),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.white.withOpacity(0.7),
            ),
            child: const Icon(Icons.search, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (error.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 64, color: Colors.white70),
              const SizedBox(height: 16),
              Text(
                error,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => fetchWeather(_cityController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text("Try Again"),
              ),
            ],
          ),
        ),
      );
    }

    if (weatherData == null) {
      return const Center(
        child: Text(
          "No weather data available",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherData!.cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              weatherData!.description.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 20),
            _buildWeatherIcon(),
            const SizedBox(height: 20),
            Text(
              "${weatherData!.temperature.toStringAsFixed(1)}°C",
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            _buildWeatherDetails(),
            const SizedBox(height: 40),
            _buildForecastPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherIcon() {
    IconData iconData;

    // Simple icon mapping based on weather condition
    if (weatherData!.main.contains("Clear")) {
      iconData = Icons.wb_sunny;
    } else if (weatherData!.main.contains("Cloud")) {
      iconData = Icons.cloud;
    } else if (weatherData!.main.contains("Rain")) {
      iconData = Icons.beach_access;
    } else if (weatherData!.main.contains("Snow")) {
      iconData = Icons.ac_unit;
    } else if (weatherData!.main.contains("Thunderstorm")) {
      iconData = Icons.flash_on;
    } else if (weatherData!.main.contains("Drizzle")) {
      iconData = Icons.grain;
    } else if (weatherData!.main.contains("Mist") ||
        weatherData!.main.contains("Fog") ||
        weatherData!.main.contains("Haze")) {
      iconData = Icons.filter_drama;
    } else {
      iconData = Icons.cloud;
    }

    return Icon(iconData, size: 120, color: Colors.white);
  }

  Widget _buildWeatherDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDetailItem(
            Icons.thermostat,
            "Feels Like",
            "${weatherData!.feelsLike.toStringAsFixed(1)}°C",
          ),
          _buildDetailItem(
            Icons.water_drop,
            "Humidity",
            "${weatherData!.humidity}%",
          ),
          _buildDetailItem(Icons.air, "Wind", "${weatherData!.windSpeed} m/s"),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastPanel() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Highlights",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHighlightCard(
                "Pressure",
                "${weatherData!.pressure}",
                "hPa",
                Icons.speed,
              ),
              _buildHighlightCard(
                "Visibility",
                "${(weatherData!.visibility / 1000).toStringAsFixed(1)}",
                "km",
                Icons.visibility,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightCard(
    String title,
    String value,
    String unit,
    IconData icon,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherData {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final String main;
  final String description;
  final int visibility;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.main,
    required this.description,
    required this.visibility,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'].toDouble(),
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      visibility: json['visibility'],
    );
  }
}

// Create a TimeoutException class
class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);

  @override
  String toString() {
    return message;
  }
}
