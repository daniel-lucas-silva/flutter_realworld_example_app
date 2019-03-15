import 'package:flutter/material.dart';

class RwInput extends StatelessWidget {
  final Function onSaved;
  final Function validator;
  final Function onEditingComplete;
  final String label;
  final String hint;
  final String prefixText;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;
  final Widget prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;

  RwInput({
    @required this.onSaved,
    this.validator,
    this.onEditingComplete,
    this.label,
    this.controller,
    this.hint,
    this.prefixText,
    this.focusNode,
    this.keyboardType: TextInputType.text,
    this.maxLines,
    this.prefixIcon,
    this.textCapitalization: TextCapitalization.none,
    this.obscureText: false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xFFFFCA05),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.blueGrey[50],
        hintText: hint,
        labelText: label,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
      ),
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
    );
  }

  static dropdown(
      {label,
      value,
      error,
      validator,
      List options,
      isEmpty,
      onChanged,
      loading: false}) {
    return Stack(
      children: <Widget>[
        FormField(
          builder: (state) {
            return InputDecorator(
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                labelText: label,
                errorText: state.hasError ? state.errorText : null,
              ),
              isEmpty: isEmpty,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isDense: true,
                  isExpanded: true,
                  onChanged: (newValue) => onChanged(state, newValue),
                  items: options.map((option) {
                    return DropdownMenuItem<String>(
                      value: "${option['id']}",
                      child: Text("${option['name']}"),
                    );
                  }).toList(),
                ),
              ),
            );
          },
          validator: validator,
        ),
        loading
            ? Positioned(
                right: 19.0,
                top: 13.0,
                child: Container(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
