import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_app/utils/WAColors.dart';
import 'package:wallet_app/utils/WAWidgets.dart';


import '../Controllers/RegistrationController.dart';
import '../component/WAProfilePicPickComponent.dart';
import '../component/WAUploadKYCdailog.dart';
import '../main.dart';
import '../model/Api Service/Auth Apis/registrationApi.dart';
import '../model/cardDetailsModel.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class WARegisterScreen extends StatefulWidget {

  static String tag = '/WARegisterScreen';

  @override
  WARegisterScreenState createState() => WARegisterScreenState();
}

class WARegisterScreenState extends State<WARegisterScreen> {
 

  final controller = Get.put(RegistrationController());

  FocusNode userNameFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode confirmPassWordFocusNode = FocusNode();
  FocusNode dateOfBirthFocusNode = FocusNode();
  FocusNode mpinFocusNode = FocusNode();
  FocusNode securityQuestionOneFocusNode = FocusNode();
  FocusNode securityQuestionTwoFocusNode = FocusNode();
  FocusNode securityQuestionThreeFocusNode = FocusNode();
  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  List<XFile>? _imageFileList;
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      //await _playVideo(file);
    } else if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFileList = pickedFileList;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _setImageFileListFromFile(pickedFile);
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(RegistrationController());
    return Scaffold(
      body: Column(
        children: <Widget>[
          50.height,
          Text("Register New Account",
              style: boldTextStyle(size: 24, color: black)),
          25.height,
          PickProfilePictureComponenet(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    steps: <Step>[
                      Step(
                        title: new Text('Personal Details',
                            style: boldTextStyle(size: 18, color: black)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            25.height,
                            Text("User Name", style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your user name here',
                                  prefixIcon: Icons.person_outline_outlined),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              controller: _controller.username,
                              focus: userNameFocusNode,
                              nextFocus: emailFocusNode,
                            ),
                            16.height,
                            Text("First Name", style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your first name here',
                                  prefixIcon: Icons.person_outline_outlined),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              controller: _controller.firstname,
                              focus: firstNameFocusNode,
                              nextFocus: emailFocusNode,
                            ),
                            16.height,
                            Text("Last Name", style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your last name here',
                                  prefixIcon: Icons.person_outline_outlined),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              controller: _controller.lastname,
                              focus: lastNameFocusNode,
                              nextFocus: emailFocusNode,
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Contact Details',
                            style: boldTextStyle(size: 18, color: black)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            16.height,
                            Text("Email", style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your email here',
                                  prefixIcon: Icons.email_outlined),
                              textFieldType: TextFieldType.EMAIL,
                              keyboardType: TextInputType.emailAddress,
                              controller: _controller.emailController,
                              focus: emailFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                            16.height,
                            Text("Phone Number",
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: '050XXXXXXX',
                                  prefixIcon: Icons.numbers_outlined),
                              textFieldType: TextFieldType.EMAIL,
                              keyboardType: TextInputType.emailAddress,
                              controller: _controller.numberController,
                              focus: numberFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                            16.height,
                            Text("Password", style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your password here',
                                  prefixIcon: Icons.lock_outline),
                              suffixIconColor: WAPrimaryColor,
                              textFieldType: TextFieldType.PASSWORD,
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _controller.passwordController,
                              focus: passWordFocusNode,
                              nextFocus: confirmPassWordFocusNode,
                            ),
                            16.height,
                            Text("Confirm Password",
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Re-type password',
                                  prefixIcon: Icons.lock_outline),
                              suffixIconColor: WAPrimaryColor,
                              textFieldType: TextFieldType.PASSWORD,
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _controller.passwordController,
                              focus: confirmPassWordFocusNode,
                            ),
                            16.height,
                            Text("Date of birth",
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'DD-MM-YYYY',
                                  prefixIcon: Icons.date_range_outlined),
                              textFieldType: TextFieldType.EMAIL,
                              keyboardType: TextInputType.number,
                              controller: _controller.dateOfBirthController,
                              focus: dateOfBirthFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Pin & Security Questions',
                            style: boldTextStyle(size: 18, color: black)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            16.height,
                            Text("Pin", style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your Pin here',
                                  prefixIcon: Icons.password_outlined),
                              suffixIconColor: WAPrimaryColor,
                              textFieldType: TextFieldType.PASSWORD,
                              isPassword: true,
                              keyboardType: TextInputType.number,
                              controller: _controller.pinController,
                              focus: mpinFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                            16.height,
                            Text("What was your childhood nickName?",
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your childhood nickName here',
                                  prefixIcon: Icons.question_mark_outlined),
                              textFieldType: TextFieldType.EMAIL,
                              keyboardType: TextInputType.name,
                              controller:
                                  _controller.securityQuestionOneController,
                              focus: securityQuestionOneFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                            16.height,
                            Text(
                                "What was the name of the first school you attended?",
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your school Name here',
                                  prefixIcon: Icons.question_mark_outlined),
                              textFieldType: TextFieldType.EMAIL,
                              keyboardType: TextInputType.name,
                              controller:
                                  _controller.securityQuestionTwoController,
                              focus: securityQuestionTwoFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                            16.height,
                            Text("What was your favorite sport in high school?",
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your favorite sport Name here',
                                  prefixIcon: Icons.question_mark_outlined),
                              textFieldType: TextFieldType.EMAIL,
                              keyboardType: TextInputType.name,
                              controller:
                                  _controller.securityQuestionThreeController,
                              focus: securityQuestionThreeFocusNode,
                              nextFocus: passWordFocusNode,
                            ),
                            30.height,
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                  RegistrationApi(),
                  30.height,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style: primaryTextStyle(color: Colors.grey)),
                      4.width,
                      Text('Log In here',
                          style: boldTextStyle(
                              color: appStore.isDarkModeOn ? white : black)),
                    ],
                  ).onTap(() {
                    finish(context);
                  }).center(),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}
