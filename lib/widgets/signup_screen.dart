import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";
  bool _obscurePassword = true;

  void _signUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String name = _namaController.text.trim();
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        _errorText =
            'Minimal 8 karakter, kombinasi [A-Z] ,kombinasi [a-z] , [0-9],!@#%^&*(),.?":{}|<> ';
      });
      return;
    }
    if (name.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      final encrypt.Key key = encrypt.Key.fromLength(32);
      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final encryptedName = encrypter.encrypt(name, iv: iv);
      final encryptedUsername = encrypter.encrypt(username, iv: iv);
      final encryptedPassword = encrypter.encrypt(password, iv: iv);

      // print('**Sign Up berhasil**');
      // print('Nama : $name');
      // print('Nama pengguna: $username');
      // print('Password : $password');

      prefs.setString("fullname", encryptedName.base64);
      prefs.setString("username", encryptedUsername.base64);
      prefs.setString("password", encryptedPassword.base64);
      prefs.setString("key", key.base64);
      prefs.setString("iv", iv.base64);

      //prefs.setString("fullname", name);
      // prefs.setString("username", username);
      // prefs.setString("password", password);
    }

    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: "Nama Pengguna", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    border: OutlineInputBorder(),
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    child: const Text('Sign Up')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
