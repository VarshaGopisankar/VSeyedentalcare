import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:vseyedentalcare/anime.dart';


class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {


  final formKey = GlobalKey<FormState>();
  List genderItems = ["Male", "Female", "Others"];
  String selectedValue = '';
  DateTime date = DateTime(2022, 08, 17);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffdd5546),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xfffff9db),
            ),
          ), systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Form(
          key: formKey,
          child: Container(
            color: const Color(0xffdd5546),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Color(0xffdd5546),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffff9db),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Create your account',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xfffff9db),
                          ),
                        ),
                        CupertinoFormSection(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          backgroundColor: const Color(0xffdd5546),
                          header: const Text(
                            'Personal Details',
                            style: TextStyle(
                              color: Color(0xfffff9db),
                              fontSize: 16,
                            ),
                          ),
                          children: [
                            CupertinoTextFormFieldRow(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              placeholder: 'Enter First Name',
                              prefix: const Text(
                                'First Name: ',
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                  return "Enter correct name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: 'Enter Last Name',
                              prefix: const Text(
                                'Last Name: ',
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                  return "Enter correct name Hint:initials";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 51,
                              child: Column(
                                children: [
                                  _DatePickerItem(
                                    children: <Widget>[
                                      const Text(' Date of Birth:',
                                        style: TextStyle(
                                            color: Color(0xffdd5546),
                                            fontSize: 17
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      CupertinoButton(
                                        // Display a CupertinoDatePicker in date picker mode.
                                        onPressed: () => _showDialog(
                                          CupertinoDatePicker(
                                            initialDateTime: date,
                                            mode: CupertinoDatePickerMode.date,
                                            use24hFormat: true,
                                            // This is called when the user changes the date.
                                            onDateTimeChanged: (DateTime newDate) {
                                              setState(() => date = newDate);
                                            },
                                          ),
                                        ),
                                        // In this example, the date value is formatted manually. You can use intl package
                                        // to format the value based on user's locale settings.
                                        child: Text(
                                          '${date.day}-${date.month}-${date.year}',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // In this example, the date value is formatted manually. You can use intl package
                            // to format the value based on user's locale settings.
                            Row(
                              children: [
                                SizedBox(
                                  child: Text(
                                    '    Gender: ',
                                    style: TextStyle(
                                        color: Color(0xffdd5546), fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  width: 290,
                                  height: 45,
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      //Add isDense true and zero Padding.
                                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      //Add more decoration as you want here
                                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'Select Your Gender',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: genderItems
                                        .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select gender.';
                                      }
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      selectedValue = value.toString();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            // CupertinoTextFormFieldRow(
                            //   textInputAction: TextInputAction.next,
                            //   placeholder: "Choose gender",
                            //   prefix: const Text(
                            //     "Sex: ",
                            //     style: const TextStyle(
                            //       color: const Color(0xffdd5546),
                            //     ),
                            //   ),
                            // ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: "Enter Blood Group",
                              prefix: const Text(
                                "Blood Group: ",
                                style: const TextStyle(
                                  color: const Color(0xffdd5546),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CupertinoFormSection(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          backgroundColor: Color(0xffdd5546),
                          header: const Text(
                            "Contact Details",
                            style: const TextStyle(
                              color: const Color(0xfffff9db),
                              fontSize: 16,
                            ),
                          ),
                          children: [
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: "Enter Mobile Number",
                              prefix: const Text(
                                "Mobile Number: ",
                                style: const TextStyle(
                                  color: const Color(0xffdd5546),
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty ||!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)){
                                  return "Enter correct mobile number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: "Enter Address",
                              prefix: const Text(
                                "Residential Address: ",
                                style: const TextStyle(
                                  color: const Color(0xffdd5546),
                                ),
                              ),
                            ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: "Enter Town/City",
                              prefix: const Text(
                                "Town/City: ",
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                            ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: "Enter Pincode",
                              prefix: const Text(
                                "Pincode: ",
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CupertinoFormSection(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          backgroundColor: const Color(0xffdd5546),
                          header: const Text(
                            "User",
                            style: TextStyle(
                              color: Color(0xfffff9db),
                              fontSize: 16,
                            ),
                          ),
                          children: [
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              placeholder: "Enter Email",
                              prefix: const Text(
                                "Email: ",
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                              validator: (email) => email != null &&
                                  !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              placeholder: "Enter Password",
                              prefix: const Text(
                                "Password: ",
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Enter valid password';
                                } else if (password.length < 8) {
                                  return 'Must be at least 8 characters long';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            CupertinoTextFormFieldRow(
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              placeholder: "Re-Enter Password",
                              prefix: const Text(
                                "Confirm Password: ",
                                style: TextStyle(
                                  color: Color(0xffdd5546),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: MaterialButton(
                    minWidth: 350,
                    height: 60,
                    onPressed: () {
                      final form = formKey.currentState!;
                      if (form.validate()) {
                        print('Form');
                        // Fluttertoast.showToast(
                        //     msg: 'Account Creation Successful');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Anime()));
                      }
                    },
                    color: const Color(0xfffff9db),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Submit",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffdd5546),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: children,
        ),
      ),
    );
  }
}


