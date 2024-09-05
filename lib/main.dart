import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 350),
              Text(
                'Welcome',
                style: AppTextStyles.welcomeTextStyle,
              ),
              SizedBox(height: 20),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitleTextStyle,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _buildRegisterBottomSheet(context),
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: AppTextStyles.buttonTextStyle,
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _buildLoginBottomSheet(context),
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.buttonColor),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Login',
                  style: AppTextStyles.buttonOutlineTextStyle,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'All Rights Reserved ©2021',
                style: AppTextStyles.footerTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color backgroundColor = Color(0xFF171029);
  static const Color buttonColor = Color(0xFFFFD33A);
  static const Color footerColor = Color(0xFFFFD33A);
}

class AppTextStyles {
  static const TextStyle welcomeTextStyle = TextStyle(
    color: Colors.redAccent,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: Colors.white60,
    fontSize: 16,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonOutlineTextStyle = TextStyle(
    color: AppColors.buttonColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle footerTextStyle = TextStyle(
    color: AppColors.footerColor,
    fontSize: 14,
  );

  static const TextStyle bottomSheetHeaderTextStyle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle bottomSheetTitleTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

Widget _buildRegisterBottomSheet(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  return Container(
    height: height * 0.7,
    decoration: BoxDecoration(
      color: Color(0xFFFFE5A5),
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello...",
                  style: AppTextStyles.bottomSheetHeaderTextStyle,
                ),
                SizedBox(height: 5),
                Text(
                  "Register",
                  style: AppTextStyles.bottomSheetTitleTextStyle,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: RegisterScreen(),
              ),
            ),
          ],
        ),
        Positioned(
          top: 16, 
          right: 16,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget _buildLoginBottomSheet(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  return Container(
    height: height * 0.58,
    decoration: BoxDecoration(
      color: Color(0xFFFFE5A5),
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Welcome Back!!",
              style: AppTextStyles.bottomSheetHeaderTextStyle,
            ),
            SizedBox(height: 5),
            Text(
              "Login",
              style: AppTextStyles.bottomSheetTitleTextStyle,
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: LoginForm(),
              ),
            ),
          ],
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    ),
  );
}


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hintText,
          labelText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _courseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _courseController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validateCourse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Course is required';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Email',
            controller: _emailController,
            validator: _validateEmail,
            suffixIcon: const Icon(Icons.visibility),
          ),
          CustomTextField(
            hintText: 'Course',
            controller: _courseController,
            validator: _validateCourse,
            suffixIcon: const Icon(Icons.visibility),
          ),
          CustomTextField(
            hintText: 'Password',
            controller: _passwordController,
            validator: _validatePassword,
            obscureText: true,
            suffixIcon: const Icon(Icons.lock),
          ),
          CustomTextField(
            hintText: 'Confirm Password',
            controller: _confirmPasswordController,
            validator: _validateConfirmPassword,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: _obscurePassword
                  ? const Icon(Icons.lock)
                  : const Icon(Icons.lock_open),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Form successfully validated!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'username/email',
            controller: _emailController,
            validator: _validateEmail,
          ),
          CustomTextField(
            hintText: 'Password',
            controller: _passwordController,
            obscureText: _obscurePassword,
            validator: _validatePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: _obscurePassword
                  ? const Icon(Icons.lock)
                  : const Icon(Icons.lock_open),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              Text(
                'Remember me',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login successful!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
