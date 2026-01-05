import 'package:flutter/material.dart';
import 'package:flutter_transitioner/src/flutter_transitioner.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FullscreenReveal(
      listBackgroundColor: Colors.white,
      listCornerRadius: 30,

      // FULL SCREEN CONTENT (shown when not scrolled)
      fullscreenContent: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  'NEW YORK, USA',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Temperature (Large)
            Text(
              '-77°',
              style: TextStyle(
                fontSize: 150,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                height: 0.9,
              ),
            ),

            const SizedBox(height: 20),

            // Weather Condition
            Text(
              'CLEAR SKY',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 5,
              ),
            ),

            const SizedBox(height: 40),

            // Weather Icon
            const Icon(Icons.wb_sunny, color: Colors.yellow, size: 100),

            const SizedBox(height: 40),

            // Additional Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('HUMIDITY', '45%', Icons.water_drop),
                _buildInfoCard('WIND', '12 km/h', Icons.air),
                _buildInfoCard('PRESSURE', '1013 hPa', Icons.speed),
              ],
            ),
          ],
        ),
      ),

      // MINIMIZED CONTENT (shown when scrolled - same data as fullscreen)
      minimizedContent: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Location
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text(
                'NEW YORK, USA',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Large temperature (same as fullscreen but smaller)
          Text(
            '-77°',
            style: TextStyle(
              fontSize: 70,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),

          // Weather condition (same as fullscreen)
          Text(
            'CLEAR SKY',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
              letterSpacing: 2,
            ),
          ),
        ],
      ),

      // HIDDEN LIST (Appears on scroll)
      hiddenList: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'HOURLY FORECAST',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        ...List.generate(24, (index) {
          final hour = index % 12 == 0 ? 12 : index % 12;
          final period = index < 12 ? 'AM' : 'PM';

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  '$hour $period',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.sunny, color: Colors.orange, size: 30),
                const SizedBox(width: 20),
                Text(
                  '-${75 + (index % 5)}°',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Clear',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 40),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7)),
        ),
      ],
    );
  }
}
