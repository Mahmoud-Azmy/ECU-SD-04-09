import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Models/user_model.dart';
import 'package:shopping_app/controllers/app_provider.dart';
import 'package:shopping_app/views/screens/login_screen.dart';
import 'package:shopping_app/views/widgets/custom_button.dart';
import 'package:shopping_app/views/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Sign Up"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: nameController,
                hText: "name",
                pIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: phoneController,
                hText: "phone",
                pIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: emailController,
                hText: "email",
                pIcon: Icon(Icons.email),
                isEmail: true,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
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
                    final result = await context.read<AppProvider>().register(
                      UserModel(
                        email: emailController.text,
                        password: passController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                      ),
                    );
                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Account Created Successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.read<AppProvider>().errMessage ??
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
                    : Text("Sign Up"),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Login"),
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
