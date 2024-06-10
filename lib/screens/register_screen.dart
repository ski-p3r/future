import 'package:flutter/material.dart';
import 'package:future/common/button.dart';
import 'package:future/common/input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              "Create a new\naccount",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            const SizedBox(height: 16.0),
            Input(
              name: 'First Name',
              placeholder: 'Enter your first name',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              prefix: "assets/icons/user.svg",
              controller: _firstNameController,
            ),
            const SizedBox(height: 16.0),
            Input(
              name: 'Last Name',
              prefix: "assets/icons/user.svg",
              placeholder: 'Enter your last name',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _lastNameController,
            ),
            const SizedBox(height: 16.0),
            Input(
              name: 'Email',
              prefix: "assets/icons/email.svg",
              placeholder: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: _emailController,
            ),
            const SizedBox(height: 16.0),
            Input(
              name: 'Password',
              placeholder: 'Enter your password',
              prefix: "assets/icons/lock.svg",
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              isSecure: true,
            ),
            const SizedBox(height: 25.0),
            CustomButton(
              onPressed: _register,
              name: 'Register',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _register() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    print(
        'Registering with: First Name: $firstName, Last Name: $lastName, Email: $email, Password: $password');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
