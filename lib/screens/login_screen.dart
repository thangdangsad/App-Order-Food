import 'package:flutter/material.dart';
import 'package:myfood/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    const textStyle = TextStyle(fontSize: 26.0); // Điều chỉnh giá trị này
    const buttonTextStyle = TextStyle(fontSize: 28.0); // Kích thước cho nút
    return Scaffold(
      appBar: AppBar(
          title: const Text('Đăng nhập' , style: TextStyle(fontSize: 20.0))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,

                style: textStyle,
                decoration: const InputDecoration(
                  labelStyle: textStyle,
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) => value!.isEmpty ? 'Vui lòng nhập email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelStyle: textStyle,
                  labelText: 'Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) => value!.isEmpty ? 'Vui lòng nhập mật khẩu' : null,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: authService.isLoading
                      ? null
                      : () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await authService.signInWithEmail(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                      } on AuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message)),
                        );
                      }
                    }
                  },
                  child: authService.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('ĐĂNG NHẬP', style: buttonTextStyle),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                ),
                child: const Text('Chưa có tài khoản? Đăng ký ngay',
                    style: TextStyle(fontSize: 16.0)),

              ),
            ],
          ),
        ),
      ),
    );
  }
}