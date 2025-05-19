import 'package:flutter/material.dart';

class FacebookVerificationScreen extends StatefulWidget {
  const FacebookVerificationScreen({super.key});

  @override
  _FacebookVerificationScreenState createState() =>
      _FacebookVerificationScreenState();
}

class _FacebookVerificationScreenState
    extends State<FacebookVerificationScreen> {
  final List<FocusNode> focusNodes = List.generate(
    4,
    (index) => FocusNode(debugLabel: 'Digit $index'),
  );
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _checkAndSubmit() {
    bool isComplete = controllers.every((c) => c.text.isNotEmpty);
    if (isComplete) {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 119, 16), // coklat kuning
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'AgroFresh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: Icon(Icons.agriculture, size: 50, color: Colors.green),
              ),
              const SizedBox(height: 20),
              const Text(
                'Hubungkan\nDengan Facebook',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 78, 28, 5),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Verifikasi Akun',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '4 - Digit kode',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 48,
                    height: 55,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Color.fromARGB(255, 78, 61, 5), // coklat tua
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < 3) {
                            FocusScope.of(
                              context,
                            ).requestFocus(focusNodes[index + 1]);
                          } else {
                            _checkAndSubmit();
                          }
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              const Text(
                'Masukan Kode Verifikasi',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _checkAndSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 51, 35),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Menunggu Verifikasi',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
