import "package:flutter/material.dart";
import "package:flutter/services.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
        elevation: 0,
        title: null,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // The Top Dark Section
                _buildTopSection(),

                // The Bottom Light Section
                _buildBottomSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 80, bottom: 100, left: 20),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/black_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Text(
        'Login to\nSoul Solutions',
        style: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30.0),
      color: const Color(0xFFFFF6F6),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phone Number Field
            const Text('Phone number', style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 8),
            TextFormField(
              // Connect the field with controller
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 170, 203, 124),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: 'Enter your phone number',
                hintStyle: TextStyle(fontSize: 14),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number'; // Error message
                }
                return null; // Return null if the input is valid
              },
            ),
            const SizedBox(height: 20),

            // Password Field
            const Text('Password', style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController, // Connect the controller
              obscureText: true, // This hides the text for passwords
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 170, 203, 124),
                  ),
                ),
                hintText: 'Enter your password',
                hintStyle: TextStyle(fontSize: 14),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  // Error message
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }

                // Return null if the input is valid
                return null;
              },
            ),

            // Forgot Password Link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 170, 203, 124),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBackgroundColor: const Color.fromARGB(
                    128,
                    170,
                    203,
                    124,
                  ),
                ),
                // Conditionally set onPressed
                onPressed: _isLoading ? null : _login,

                // Show a spinner when loading
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3.0,
                        ),
                      )
                    : const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),

            // Signup Text
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                  children: [
                    TextSpan(text: "Don't have an Account? "),
                    TextSpan(
                      text: 'Signup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    // First, validate the form.
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // If the form is valid, show the loading indicator.
    setState(() {
      _isLoading = true;
    });

    // Simulate a network request with a 2-second delay.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Hide the loading indicator.
    setState(() {
      _isLoading = false;
    });
  }
}
