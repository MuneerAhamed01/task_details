import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/functions/functions.dart';
import 'package:todo/widgets/custom_textfield.dart';
import 'package:todo/widgets/sizedboxes.dart';

class ListOFDetails extends StatefulWidget {
  const ListOFDetails({Key? key}) : super(key: key);

  @override
  State<ListOFDetails> createState() => _ListOFDetailsState();
}

class _ListOFDetailsState extends State<ListOFDetails> {
  @override
  void initState() {
    super.initState();
  }

  String email = '';

  String number = '';

  final formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  final regexp = r'\S+@\S+\.\S+';

  final regexpNumber = r'^(?:[+0]9)?[0-9]{10}$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              height40,
              Container(
                width: double.infinity,
                height: 280.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: Colors.white),
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        height20,
                        Text(
                          "Add Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.sp),
                        ),
                        height20,
                        CustomizedFormField(
                          inputType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          hintText: "E-mail",
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field can't be empty";
                            } else if (!RegExp(regexp).hasMatch(value)) {
                              return "Enter a valid email address";
                            } else if (!cheakIsThere(value)) {
                              return "Email address already exists";
                            } else {
                              email = value;
                              return null;
                            }
                          },
                        ),
                        height20,
                        CustomizedFormField(
                          listInput: [FilteringTextInputFormatter.digitsOnly],
                          inputType: TextInputType.number,
                          controller: numbercontroller,
                          hintText: "Mobile Number",
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field can't be empty";
                            } else if (!RegExp(regexpNumber).hasMatch(value)) {
                              return "Enter a valid mobile number";
                            } else if (!cheakIsThereNumber(value)) {
                              return "mobile number already exists";
                            } else {
                              number = value;
                              return null;
                            }
                          },
                        ),
                        height40,
                        Container(
                          height: 35.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              color: Colors.black),
                          child: MaterialButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                setList(email, number);
                                emailcontroller.text = '';
                                numbercontroller.text = '';
                                FocusScope.of(context).unfocus();

                                setState(() {});
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              height20,
              Expanded(child: Builder(builder: (context) {
                final list = getListAll();
                if (list.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: const Text("List is empty"),
                  );
                } else {
                  return ListView.separated(
                      separatorBuilder: (context, index) => height10,
                      itemCount: getListAll()['emails']!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final emails = list['emails'];
                        final numbers = list['numbers'];
                        return Container(
                          height: 80.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Column(
                              children: [
                                UserDetails(
                                    title: "E-mail : ",
                                    details: emails![index]),
                                height10,
                                UserDetails(
                                    title: "Number : ",
                                    details: numbers![index])
                              ],
                            ),
                          ),
                        );
                      });
                }
              }))
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
        Text(
          details,
          style: TextStyle(fontSize: 16.sp),
        )
      ],
    );
  }
}

OutlineInputBorder borderDecoration() =>
    const OutlineInputBorder(borderSide: BorderSide(color: Colors.black54));
