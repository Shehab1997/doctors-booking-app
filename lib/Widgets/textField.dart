import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Models/secondProvider.dart';
import 'package:provider/provider.dart';

class TextFieldCus extends StatefulWidget {
  final Key id;
  final TextEditingController control;
  final String label;
  final TextInputType type;
  final bool disappear;

  TextFieldCus(
      this.id, this.control, this.label, this.type,
      {this.disappear = false});
  @override
  _TextFieldCusState createState() => _TextFieldCusState();
}

class _TextFieldCusState extends State<TextFieldCus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        key: widget.id,
        decoration: InputDecoration(
            labelText: widget.label,
            prefixIcon: widget.label =='Mobile Number'?CountryCodePicker(
              initialSelection: 'packages/country_code_picker/flags/it.png',
              favorite: ['+39','packages/country_code_picker/flags/fr.png'],
              // optional. Shows only country name and flag
              showCountryOnly: false,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              alignLeft: false,
            ):null,
            suffixIcon: widget.label == 'Password'
                ? InkWell(
                child: Icon(Icons.remove_red_eye_outlined),
                onTap:(){ Provider.of<SecondProvider>(context,listen: false).hidePass();}
            )
                : null),
        keyboardType: widget.type,
        controller: widget.control,
        obscureText: widget.label == 'Password' ? Provider.of<SecondProvider>(context).pass : widget.disappear,
        validator: widget.label == "Email Address"
            ? (value) {
          if (value!.isEmpty || !value.contains("@")) {
            return "Invalid e-mail";
          }
          return null;
        }
            : (value) {
          if (value!.length < 6 || value.isEmpty) {
            return "${widget.label} incorrect";
          }
          return null;
        },
      ),
    );
  }
}
