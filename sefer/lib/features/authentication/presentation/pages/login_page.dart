import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sefer/features/authentication/presentation/bloc/authentication_bloc.dart';

import '../../../../injection_container.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/user_credentials.dart';

class LoginPage extends StatelessWidget {
  final Key key;
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('posts');

  LoginPage({required this.key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    print(state);
                    if (state is AuthenticationInitial) {
                      return Container(
                        child: Text(
                          'Instagram',
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    } else if (state is AuthenticationLoading) {
                      return Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    } else if (state is AuthenticationRegistered) {
                      return Text("succesfully registered");
                    } else if (state is AuthenticationAuthenticated) {
                      return Text('SUCCESSFUL LOGIN');
                    } else if (state is AuthenticationError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 48,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Authentication Failed',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    }

                    return Text("cala");
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username or Email',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true, // Add this line
                    fillColor:
                        Color(0xFF262626), // Add your desired background color

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: usernameController,
                  // ... rest of your TextFormField code
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true, // Add this line
                    fillColor:
                        Color(0xFF262626), // Add your desired background color

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: passwordController,
                  obscureText: true,
                  // ... rest of your TextFormField code
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    // Handle login button press
                    await reference.push().set({
                      'title': 'My Awesome Photo',
                      'likes': 0,
                      'comments': 0,
                    }).then((_) => print("data sent successfully"));
                    final username = usernameController.text;
                    final password = passwordController.text;
                    loginDispatcher(context, username, password); // P
                    // Emit login event to the bloc
                  },
                  child: Text('Log In'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Handle sign up button press
                    final username = usernameController.text;
                    final password = passwordController.text;
                    registerDispatcher(context, username, password);
                    print("user created");

                    // Emit sign up event to the bloc
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginDispatcher(BuildContext context, String username, String password) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      AuthenticationEventLogin(
        UserCredentials(
          identifier: username,
          password: password,
        ),
      ),
    );
  }

  void registerDispatcher(
      BuildContext context, String username, String password) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      AuthenticationEventRegister(
        UserCredentials(
          identifier: username,
          password: password,
        ),
      ),
    );
  }
}
