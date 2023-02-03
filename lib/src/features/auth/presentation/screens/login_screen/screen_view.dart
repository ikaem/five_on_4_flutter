import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          StreamBuilder(builder: builder),
          const SizedBox(height: SpacingConstants.small,)
          StreamBuilder(builder: builder),
          const SizedBox(height: SpacingConstants.small,)
          StreamBuilder(builder: builder),
        ],
      ),
    );
  }


  Widget _emailStreamBuilder(BuildContext context, AsyncSnapshot<String> emailData) {

    final bool isValid = emailData.hasData;


    return const TextField();



  }


}
