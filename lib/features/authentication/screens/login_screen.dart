import 'package:final_project/features/authentication/screens/sign_up_screen.dart';
import 'package:final_project/features/authentication/view_models/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6C6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 70,
          ),
          child: Column(
            children: [
              const Text(
                "🔥 MOOD 🔥",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (value) {
                  final state = ref.read(signUpForm.notifier).state;
                  ref.read(signInForm.notifier).state = {
                    ...state,
                    "email": value
                  };
                },
                decoration: InputDecoration(
                  hintText: 'Email', // placeholder
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                    borderSide:
                        const BorderSide(color: Colors.black), // 검정색 테두리
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  filled: true, // 이 부분을 추가
                  fillColor: Colors.white, // 이 부분을 추가
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  final state = ref.read(signInForm.notifier).state;
                  ref.read(signInForm.notifier).state = {
                    ...state,
                    "password": value,
                  };
                },
                decoration: InputDecoration(
                  hintText: 'Password', // placeholder
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                    borderSide:
                        const BorderSide(color: Colors.black), // 검정색 테두리
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  filled: true, // 이 부분을 추가
                  fillColor: Colors.white, // 이 부분을 추가
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(signUpProvider.notifier).signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.purpleAccent.shade100,
                    shadowColor: Colors.black, // 그림자 색상
                    elevation: 5, // 그림자 높이
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(SignUpScreen.routeURL);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.purpleAccent.shade100,
                    shadowColor: Colors.black, // 그림자 색상
                    elevation: 5, // 그림자 높이
                  ),
                  child: const Text(
                    'Create an account ->',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
