part of '../login_page.dart';

class LoginPageTextField extends StatelessWidget {
  const LoginPageTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
