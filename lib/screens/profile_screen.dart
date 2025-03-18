import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';


import '../provider/auth_provider.dart';
import '../widgets/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.0.h),
              Text(
                'Hồ Sơ',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 4.0.h),
              const ProfileHeader(),
              const ProfileListView(),

            ],
          ),
        ),
      ),
    );
  }
}


class ProfileListView extends StatelessWidget {
  const ProfileListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context); // Lấy AuthService

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: [
          ListTile(

            title: const Text('Tài khoản'),
            leading: const Icon(Icons.account_circle),
            onTap: () => Navigator.pushNamed(context, '/account'),
          ),
          Divider(
            color: Colors.grey.shade400,
            indent: 10.0,
            endIndent: 10.0,
          ),
          const ProfileListTile(
            text: 'Cài đặt',
            icon: UniconsLine.setting,
          ),
          Divider(
            color: Colors.grey.shade400,
            indent: 10.0,
            endIndent: 10.0,
          ),
          const ProfileListTile(
            text: 'App Info',
            icon: UniconsLine.info_circle,
          ),
          Divider(
            color: Colors.grey.shade400,
            indent: 10.0,
            endIndent: 10.0,
          ),
          ProfileListTile(
            text: 'Logout',
            icon: UniconsLine.sign_out_alt,
            onTap: () async {
              // Xử lý đăng xuất
              await authService.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/sign-in',
                    (route) => true,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const ProfileListTile({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Thêm padding ngang
      title: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 14.0.sp, // Đảm bảo kích thước chữ
          fontWeight: FontWeight.w600, // Thêm độ đậm
        ),
      ),
      horizontalTitleGap: 5.0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 24.0.sp, // Đồng bộ kích thước icon
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      trailing: Icon(
        UniconsLine.angle_right,
        size: 24.0.sp, // Đồng bộ kích thước icon
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: onTap,
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AuthService>(context).currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImage(
            height: 20.0.h,
            image: 'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80'),

        const SizedBox(
          height: 10.0,
        ),
        Text(
          user?.email ?? 'Email Address', // Email đăng nhập
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}

