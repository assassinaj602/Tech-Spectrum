import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search city...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Handle search logic here
                String searchText = _searchController.text;
                print('Searching for: $searchText');
                // You can implement search logic, e.g., fetching weather data based on the city
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('asset/image/icon.png'),
                alignment: Alignment.topCenter,
                height: 180,
                // Use the relative path
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '22 °C',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Islamabad',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Hourly:",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(width: 9),
              // ignore: avoid_unnecessary_containers
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.2), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.yellowAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "22 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "07:00 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.wb_cloudy,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "17 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "12:00 PM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.grey.shade200,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "15 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "15:00 PM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Icon(
                          Icons.thunderstorm,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "13 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "17:00 PM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Weekly:",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const SizedBox(width: 9),
              // ignore: avoid_unnecessary_containers
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue.shade100, width: 2)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          color: Colors.lightBlueAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "2 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tuesday",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.beach_access,
                          color: Colors.blueGrey,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "10 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Wednesday",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.yellowAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "15 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Thursday",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "20 °C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "saturday",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
