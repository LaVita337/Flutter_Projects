import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TikTok/constants/gaps.dart';
import 'package:TikTok/constants/sizes.dart';
import 'package:TikTok/features/authentication/widgets/form_button.dart';
import 'package:TikTok/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenScreenState();
}

class _BirthdayScreenScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime currentDate = DateTime.now();
  DateTime get _initialDate =>
      DateTime(currentDate.year - 19, currentDate.month, currentDate.day);

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(_initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ")[0];
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              'When is your birthday?',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown publicly",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v28,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(
                disabled: false,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          maximumDate: currentDate,
          initialDateTime: _initialDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
        ),
      )),
    );
  }
}
