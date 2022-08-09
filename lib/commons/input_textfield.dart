import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final bool password;
  final TextEditingController? controller;
  final validator;
  final keyboardType;
  final bool textInputAction;

  const InputTextField({
    Key? key,
    required this.label,
    required this.obscureText,
    this.textInputAction = false,
    this.controller,
    this.password = false,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: !widget.textInputAction
              ? TextInputAction.next
              : TextInputAction.done,
          obscureText: widget.obscureText ? !_passwordVisible : false,
          decoration: InputDecoration(
              suffixIcon: widget.password
                  ? IconButton(
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
