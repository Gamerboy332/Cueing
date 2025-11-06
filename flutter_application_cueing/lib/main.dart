import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const BookingApp());
}

class BookingApp extends StatelessWidget {
  const BookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6B00FF),
        scaffoldBackgroundColor: const Color(0xFF6B00FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B00FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const SignInScreen(),
    );
  }
}

// Screen 1: Sign In
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('B', style: TextStyle(color: Color(0xFF6B00FF), fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 12),
                  Text('CUEING', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 60),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              const SizedBox(height: 24),
              const Text('Forgot Password?', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B00FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 2: Sign Up
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'phoneNumber': TextEditingController(),
    'address': TextEditingController(),
    'username': TextEditingController(),
    'password': TextEditingController(),
  };

  Widget _buildTextField(String label, String key, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: _controllers[key],
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B00FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              _buildTextField('First Name', 'firstName'),
              _buildTextField('Last Name', 'lastName'),
              _buildTextField('Email', 'email'),
              _buildTextField('Phone Number', 'phoneNumber'),
              _buildTextField('Address', 'address'),
              _buildTextField('Username', 'username'),
              _buildTextField('Password', 'password', isPassword: true),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TableSelectionScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B00FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 3: Table Selection
class TableSelectionScreen extends StatefulWidget {
  const TableSelectionScreen({Key? key}) : super(key: key);

  @override
  State<TableSelectionScreen> createState() => _TableSelectionScreenState();
}

class _TableSelectionScreenState extends State<TableSelectionScreen> {
  String? selectedTable;

  Widget _buildTableButton(String tableNumber) {
    final isSelected = selectedTable == tableNumber;
    return ElevatedButton(
      onPressed: () => setState(() => selectedTable = tableNumber),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF6B00FF) : Colors.white,
        foregroundColor: isSelected ? Colors.white : const Color(0xFF6B00FF),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: isSelected ? Colors.white : const Color(0xFF6B00FF), width: 2),
        ),
      ),
      child: Text(tableNumber, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('TABLE', style: TextStyle(color: Color(0xFF6B00FF), fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Text('TABLE\nSELECTION', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, height: 1.2)),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.5,
                  children: List.generate(10, (i) => _buildTableButton('TABLE ${i + 1}')),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: selectedTable != null
                    ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => GameConfirmationScreen(table: selectedTable!)))
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B00FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Proceed to confirmation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 4: Game Confirmation
class GameConfirmationScreen extends StatefulWidget {
  final String table;
  const GameConfirmationScreen({Key? key, required this.table}) : super(key: key);

  @override
  State<GameConfirmationScreen> createState() => _GameConfirmationScreenState();
}

class _GameConfirmationScreenState extends State<GameConfirmationScreen> {
  int hours = 1;
  int amount = 0;

  void _updateAmount(int h) {
    setState(() {
      hours = h;
      amount = h * 100; // ₱100 per hour
    });
  }

  @override
  void initState() {
    super.initState();
    _updateAmount(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Text('TABLE', style: TextStyle(color: Color(0xFF6B00FF), fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Text('GAME\nCONFIRMATION', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, height: 1.2)),
              const SizedBox(height: 32),
              const Text('GAME TIME', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Text('$hours HOUR', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF6B00FF), fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: hours > 1 ? () => _updateAmount(hours - 1) : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF6B00FF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('- 30 MIN', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _updateAmount(hours + 1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF6B00FF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('+ 30 MIN', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Text('TOTAL AMOUNT\n₱$amount', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF6B00FF), fontSize: 18, fontWeight: FontWeight.bold, height: 1.5)),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen(table: widget.table, hours: hours, amount: amount))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B00FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Proceed to payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 5: Payment
class PaymentScreen extends StatelessWidget {
  final String table;
  final int hours;
  final int amount;

  const PaymentScreen({Key? key, required this.table, required this.hours, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Text('TABLE', style: TextStyle(color: Color(0xFF6B00FF), fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Text('PAYMENT', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('QR Code\nScanner', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600], fontSize: 18)),
                      const SizedBox(height: 16),
                      Icon(Icons.qr_code_scanner, size: 100, color: Colors.grey[400]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Text('TOTAL AMOUNT\n₱$amount', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF6B00FF), fontSize: 18, fontWeight: FontWeight.bold, height: 1.5)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TimerScreen(hours: hours))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B00FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('PAID', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 6: Timer
class TimerScreen extends StatefulWidget {
  final int hours;
  const TimerScreen({Key? key, required this.hours}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late int _remainingSeconds;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.hours * 3600;
  }

  void _startTimer() {
    if (_isRunning) return;
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        timer.cancel();
        setState(() => _isRunning = false);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  String _formatTime() {
    final hours = (_remainingSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((_remainingSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Text('TABLE', style: TextStyle(color: Color(0xFF6B00FF), fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Text('TIMER', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              const Text('LIVE TIME', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(_formatTime(), style: const TextStyle(color: Color(0xFF6B00FF), fontSize: 48, fontWeight: FontWeight.bold, fontFeatures: [FontFeature.tabularFigures()])),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isRunning ? _stopTimer : _startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B00FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(_isRunning ? 'STOP' : 'START', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

