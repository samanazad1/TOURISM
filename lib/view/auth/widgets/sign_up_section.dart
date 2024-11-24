import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/assistant/util/colors.dart';
import 'package:tourism/assistant/util/sizes.dart';
import 'package:tourism/controller/user_controller.dart';
import 'package:tourism/view/auth/widgets/auth_text_field.dart';
import 'package:tourism/view/initial_page.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({Key? key}) : super(key: key);

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _selectedGender = 'Male';

  // Validation functions
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 3) {
      return 'Name should be at least 3 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r"^\d{10,15}$").hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0 / getAbsHeight(context)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50 / getAbsHeight(context)),
                const Text(
                  'Kurdistan is waiting!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 80 / getAbsHeight(context)),
                const Text(
                  'Welcome to Tourism.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40 / getAbsHeight(context)),
          
                // Name TextField
                AuthTextField(
                  controller: _nameController,
                  hint: 'Your Name',
                  validator: _validateName,
                ),
                SizedBox(height: 20 / getAbsHeight(context)),
          
                // Email TextField
                AuthTextField(
                  controller: _emailController,
                  hint: "example@gmail.com",
                  validator: _validateEmail,
                ),
                SizedBox(height: 20 / getAbsHeight(context)),
          
                // Phone Number TextField
                AuthTextField(
                  controller: _phoneController,
                  hint: 'Phone Number',
                  validator: _validatePhone,
                ),
                SizedBox(height: 20 / getAbsHeight(context)),
          
                // Password TextField
                AuthTextField(
                  controller: _passwordController,
                  hint: 'Password',
                  obscureText: true,
                  validator: _validatePassword,
                ),
                SizedBox(height: 20 / getAbsHeight(context)),
          
                // Gender Selection
                GenderSelect(
                  value: _selectedGender,
                  onChanged: (String gender) {
                    setState(() {
                      _selectedGender = gender;
                    });
                  },
                ),
          
                SizedBox(height: 30 / getAbsHeight(context)),
          
                // Signup Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      userController
                          .registerUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                            name: _nameController.text.trim(),
                            phoneNumber: _phoneController.text.trim(),
                            gender: _selectedGender,
                          )
                          .then((v) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InitialPage()),
                                (route) => false,
                              ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor.withOpacity(.5),
                    padding: EdgeInsets.symmetric(
                        vertical: 16 / getAbsHeight(context)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderSelect extends StatelessWidget {
  final String value;
  final Function(String) onChanged;

  const GenderSelect({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          spacing: 16,
          children: [
            AppRadioField(
              title: 'Male',
              value: 'Male',
              groupValue: value,
              onChanged: onChanged,
            ),
            AppRadioField(
              title: 'Female',
              value: 'Female',
              groupValue: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}

class AppRadioField extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onChanged;

  const AppRadioField({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: (String? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            activeColor: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
