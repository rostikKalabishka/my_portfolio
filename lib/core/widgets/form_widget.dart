import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';
import 'package:my_portfolio/core/constants/common_const.dart';
import 'package:my_portfolio/core/constants/page_size_const.dart';
import 'package:my_portfolio/core/screens/model/home_page_model.dart';
import 'package:my_portfolio/core/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'dart:js' as js;

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  String _error = '';

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomePageModel>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.darkCard,
      ),
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Get in touch with me',
              style: TextStyle(color: AppColors.darkText, fontSize: 32),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= PageSizeConst.mobileBreakpoint) {
                  return buildNameEmailFieldDesktop();
                }
                return buildNameEmailFieldMobile();
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: messageController,
              hintText: "Your message",
              maxLines: 15,
              focusNode: _focusNode3,
            ),
            _error.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        _error,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.start,
                      )
                    ],
                  )
                : SizedBox.shrink(),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      _sendMessage(model);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Get in touch',
                        style:
                            TextStyle(color: AppColors.darkText, fontSize: 24),
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: const Divider(),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < CommonConst.myContact.length; i++)
                  InkWell(
                    onTap: () {
                      js.context
                          .callMethod('open', [CommonConst.myContact[i].url]);
                    },
                    child: Image.asset(
                      CommonConst.myContact[i].image,
                      width: 28,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "Your name",
            focusNode: _focusNode1,
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
              controller: emailController,
              hintText: "Your email",
              focusNode: _focusNode2),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        CustomTextField(
          controller: nameController,
          hintText: "Your name",
          focusNode: _focusNode1,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          controller: emailController,
          hintText: "Your email",
          focusNode: _focusNode2,
        ),
      ],
    );
  }

  void _sendMessage(HomePageModel model) {
    final message = messageController.text.trim();
    final email = emailController.text.trim();
    final name = nameController.text.trim();

    if (message.isNotEmpty && email.isNotEmpty && name.isNotEmpty) {
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{1,}$').hasMatch(email) &&
          email.isNotEmpty) {
        _error = 'Please enter a valid email';
        setState(() {});
        return;
      } else {
        _error = '';
      }
      // model.sendMessageOnEmail(message: message, email: email, name: name);

      messageController.clear();
      emailController.clear();
      nameController.clear();
      _error = '';
    } else {
      _error = 'Fill in all fields';
    }
    setState(() {});
  }
}
