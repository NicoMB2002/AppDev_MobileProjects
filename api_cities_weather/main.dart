import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherListScreen(),
    );
  }
}

class WeatherListScreen extends StatefulWidget {
  const WeatherListScreen({super.key});

  @override
  State<WeatherListScreen> createState() => _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  final String apiKey = "6c5ad41d1500473170f259761f53f96c";
  final List<String> cities = ["Montreal", "Toronto", "Vancouver", "New York"];
  List<Map<String, dynamic>> weatherList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherForCities();
  }

  Future<void> fetchWeatherForCities() async {
    List<Map<String, dynamic>> results = [];

    for (String city in cities) {
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          results.add(data);
        } else {
          debugPrint("Failed to load $city: ${response.statusCode}");
        }
      } catch (e) {
        debugPrint("Error loading $city: $e");
      }
    }

    setState(() {
      weatherList = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather for Cities')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: weatherList.length,
        itemBuilder: (context, index) {
          final weather = weatherList[index];
          final cityName = weather['name'];
          final temp = weather['main']['temp'];
          final desc = weather['weather'][0]['description'];
          final iconCode = weather['weather'][0]['icon'];

          return Card(
            margin:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: Image.network(
                'https://openweathermap.org/img/wn/$iconCode@2x.png',
                width: 50,
                height: 50,
              ),
              title: Text(
                cityName,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('$desc\n$temp°C'),
              onTap: () {
                // Navigate to details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WeatherDetailScreen(weatherData: weather),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class WeatherDetailScreen extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherDetailScreen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final cityName = weatherData['name'];
    final temp = weatherData['main']['temp'];
    final desc = weatherData['weather'][0]['description'];
    final iconCode = weatherData['weather'][0]['icon'];
    final humidity = weatherData['main']['humidity'];
    final pressure = weatherData['main']['pressure'];
    final lon = weatherData['coord']['lon'];
    final lat = weatherData['coord']['lat'];

    return Scaffold(
      appBar: AppBar(title: Text('$cityName Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/$iconCode@2x.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                '$cityName',
                style:
                const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '$temp°C',
                style: const TextStyle(fontSize: 40),
              ),
              Text(
                desc,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Text('Humidity: $humidity%'),
              Text('Pressure: $pressure hPa'),
              const SizedBox(height: 16),
              Text('Longitude: $lon'),
              Text('Latitude: $lat'),
            ],
          ),
        ),
      ),
    );
  }
}
