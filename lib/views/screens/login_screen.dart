import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Controllers/app_provider.dart';
import 'package:shopping_app/models/auth_request.dart';
import 'package:shopping_app/views/screens/home_screen.dart';
import 'package:shopping_app/views/screens/register_screen.dart';
import 'package:shopping_app/views/widgets/custom_button.dart';
import 'package:shopping_app/views/widgets/custom_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login "), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                hText: "email",
                pIcon: Icon(Icons.email),
                isEmail: true,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: passController,
                isPass: isVisible,
                hText: "password",
                pIcon: Icon(Icons.lock),
                sIcon: IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final result = await context.read<AppProvider>().login(
                      AuthRequest(
                        email: emailController.text,
                        password: passController.text,
                      ),
                    );
                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.read<AppProvider>().msg ?? ""),
                          backgroundColor: Colors.green,
                        ),
                      );
                      context.read<AppProvider>().get();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.read<AppProvider>().msg ??
                                "Something Went Wrong",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: context.watch<AppProvider>().isLoading
                    ? CircularProgressIndicator()
                    : Text("Login"),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
