import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ubereats/navigation/view/main_navigation.dart';


class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFF06C167), width: 2),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.grey.shade100,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter the 4-digit Code Sent to Your Phone',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Pinput(
                length: 4,
                controller: _pinController,
                focusNode: _pinFocusNode,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) {
                  // TODO: verify the OTP here, e.g. call your backend
                  debugPrint('Entered OTP: $pin');
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Didn\'t receive the code?',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Resend OTP logic here
                    },
                    child: const Text('Resend Code'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const MainNavigation());
        },
        backgroundColor: const Color(0xFF06C167),
        elevation: 0,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        highlightElevation: 0,
        label: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward, size: 24),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}