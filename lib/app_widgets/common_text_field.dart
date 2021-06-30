import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:potatoes_test/app_constants/color.dart';

class CommonTextField extends StatefulWidget {
  final String placeholder;
  final TextInputType keyBoardType;
  final TextFieldBloc textFieldBloc;
  final bool isPassword;
  final IconData icon;
  final bool isEdit;
  final int numberLines;
  const CommonTextField({
    Key key,
    this.placeholder,
    this.isEdit = false,
    this.keyBoardType,
    this.textFieldBloc,
    this.numberLines = 1,
    this.isPassword = false,
    this.icon,
  }) : super(key: key);

  @override
  CommonTextFieldState createState() => CommonTextFieldState();
}

class CommonTextFieldState extends State<CommonTextField> {
  final _key = GlobalKey<FormFieldState>();

  GlobalKey<FormFieldState> get inputKey => _key;

  @override
  Widget build(BuildContext context) {
    final _errorStyle = TextStyle(color: Theme.of(context).errorColor);
    return BlocBuilder(
      cubit: widget.textFieldBloc,
      builder: (context, FieldBlocState state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFieldBlocBuilder(
                textAlignVertical: TextAlignVertical.top,
                maxLines: widget.numberLines,
                key: _key,
                textFieldBloc: widget.textFieldBloc,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    prefixIcon: Icon(
                      widget.icon,
                      color: kPrimaryColor,
                    ),
                    labelText: widget.isEdit ? null : widget.placeholder,
                    hintText: widget.isEdit ? widget.placeholder : null,
                    suffixStyle: TextStyle(color: Colors.red)),
                errorBuilder: (context, error) => null,
                padding: EdgeInsets.zero,
                keyboardType: widget.keyBoardType,
                suffixButton:
                    widget.isPassword ? SuffixButton.obscureText : null,
              ),
            ),
          ),
          if (state.canShowError && state.error != null)
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                state.error,
                style: _errorStyle,
              ),
            )
        ],
      ),
    );
  }
}
