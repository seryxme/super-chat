import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_chat/common/values/colors.dart';
import 'package:super_chat/pages/contact/widgets/contact_list.dart';
import '../../common/widgets/app.dart';
import 'controller.dart';

class ContactPage extends GetView<ContactController>  {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
            "Contacts",
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: const ContactList(),
    );
  }
}
