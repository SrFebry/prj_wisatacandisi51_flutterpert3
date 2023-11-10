import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  // TODO : 1. Deklarasikan Variabel
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _namacontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false ;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 2. Pasang AppBar
      appBar: AppBar(title : Text ('Sign In'),),
      // TODO : 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              // TODO : 4. Atur main axisAligment dan cross axis aligment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODO : 5. Textformfield nama Lengkap
                TextFormField(
                  controller: _namacontroller,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),       
                  ),
                ),
                // TODO : 5. Textformfield nama pengguna
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),       
                  ),
                ),

                
                // TODO : 6. Textformfield kata sandi
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      }, 
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                // TODO : 7. elevatedbutton sign in
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {}, 
                  child: Text('Sign In'),
                  ),
                
                // TODO : 8. elevatedbutton sign Up
                SizedBox(height: 10),
                // TextButton(
                //   onPressed: () {}, 
                //   child: Text('Belum Punya Akun? Daftar di sini.')
                //   ),
        
                RichText(
                  text: TextSpan(
                    text: 'Belum Punya Akun ? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple  
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar Di Sini',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {}
                      ),
                    ],
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