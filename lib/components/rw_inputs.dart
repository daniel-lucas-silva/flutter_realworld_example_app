import 'package:flutter/material.dart';

class RwInput extends StatelessWidget {
  final Function onSaved;
  final Function validator;
  final Function onEditingComplete;
  final String label;
  final String hint;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final int maxLines;

  RwInput({
    @required this.onSaved,
    this.validator,
    this.onEditingComplete,
    this.label,
    this.hint,
    this.focusNode,
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xFFFFCA05),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: hint,
        labelText: label,
      ),
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
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
