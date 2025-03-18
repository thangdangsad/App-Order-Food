import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfood/custom_navbar.dart';
import 'package:myfood/provider/auth_provider.dart';
import 'package:myfood/provider/recipe_provider.dart';
import 'package:myfood/provider/saved_provider.dart';
import 'package:myfood/screens/account_screen.dart';
import 'package:myfood/screens/home_screen.dart';
import 'package:myfood/screens/login_screen.dart';
import 'package:myfood/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Đảm bảo Firebase đã được khởi tạo
  await FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthService()),
            ChangeNotifierProvider(create: (_) => ListOfRecipes()),
            ChangeNotifierProvider(create: (_) => SavedProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme,
            home: Consumer<AuthService>(
              builder: (context, auth, _) {
                // Kiểm tra trạng thái đăng nhập
                if (auth.currentUser == null) {
                  return const SignInScreen(); // Hiển thị màn hình đăng nhập
                } else {
                  return const CustomNavBar(); // Chuyển đến màn hình chính
                }
              },
            ),
            routes: {
              '/sign-in': (context) => const SignInScreen(),
              '/register': (context) => const RegisterScreen(),
              '/account': (context) => const AccountScreen()
            },
          ),
        );
      },
    );
  }

}
