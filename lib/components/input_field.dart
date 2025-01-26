import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.validator,
    required this.onChanged,
  });
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "ProximaNova",
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: TextFormField(
              controller: controller,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 8),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xffBABABA),
                  fontSize: 15,
                  fontFamily: "ProximaNova",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffA0A0A0)),
                ),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
