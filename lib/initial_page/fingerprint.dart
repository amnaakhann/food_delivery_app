import 'package:flutter/material.dart';

class FingerprintSetupPage extends StatelessWidget {
  const FingerprintSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 241, 200, 85),

      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(244, 241, 200, 85),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Set Your Fingerprint',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Touch the fingerprint sensor",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                // Fingerprint Icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(30),
                  child: const Icon(
                    Icons.fingerprint,
                    size: 150,
                    color: Colors.red,
                  ),
                ),

                const SizedBox(height: 30),

                // Skip Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // handle skip
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE6E6), // light red
                      foregroundColor: Colors.red[800], // dark red text
                    ),
                    child: const Text('Skip'),
                  ),
                ),

                const SizedBox(height: 15),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // handle continue
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
