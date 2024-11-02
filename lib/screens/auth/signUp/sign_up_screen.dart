import 'package:flutter/material.dart';
import 'package:food_catering_service_app/screens/auth/signUp/sign_up_body.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_Provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _selectedAccountType;
  final _formKey = GlobalKey<FormState>();
  final _emailEditingController = TextEditingController();
  final _firstNameEditingController = TextEditingController();
  final _lastNameEditingController = TextEditingController();
  bool isLoading = false;
  final _passwordEditingController = TextEditingController();
  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _firstNameEditingController.dispose();
    _lastNameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
        body: SignUpBody(
            formKey: _formKey,
            firstNameEditingController: _firstNameEditingController,
            loginProvider: loginProvider,
            lastNameEditingController: _lastNameEditingController,
            emailEditingController: _emailEditingController,
            passwordEditingController: _passwordEditingController,
            selectedAccountType: _selectedAccountType));
  }
}
