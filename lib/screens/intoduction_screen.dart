import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_3/screens/chatscreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ChatPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text(
          "FAVES",
          style: TextStyle(
            letterSpacing: 6.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Shimmer(
          color: Colors.purple,
          colorOpacity: 0.15,
          child: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.white,
            allowImplicitScrolling: true,
            autoScrollDuration: 3000,
            globalHeader: Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16),
                  child: _buildImage('Chat1.png', 100),
                ),
              ),
            ),
            globalFooter: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              width: MediaQuery.of(context).size.width / 1.4,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          side: const BorderSide(color: Colors.red))),
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.redAccent;
                      } //<-- SEE HERE
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                child: const Text(
                  'Skip the Intro',
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => _onIntroEnd(context),
              ),
            ),
            pages: [
              PageViewModel(
                title: "What is ChatGPT?",
                body:
                    "ChatGPT is a natural language processing tool driven by AI technology that allows you to have human-like conversations and much more with a chatbot.",
                image: _buildImage('n1.jpg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Who made ChatGPT?",
                body:
                    "ChatGPT was created by OpenAI, an AI and research company. The company launched ChatGPT on Nov. 30, 2022.",
                image: _buildImage('n3.jpg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "How big a deal is ChatGPT?",
                body:
                    "It's certainly made a big splash. ChatGPT is scary good. We are not far from dangerously strong AI, said Elon Musk, who was one of the founders of OpenAI before leaving. Sam Altman, OpenAI's chief, said on Twitter that ChatGPT had more than 1 million users in its first five days after launching. Altman told Musk the average cost of each response was in single-digits cents but admitted it will need to monetize it eventually because of its eye-watering compute costs.",
                image: _buildImage('n4.jpg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "How does ChatGPT work?",
                body:
                    "OpenAI trained the language model by using Reinforcement Learning from Human Feedback (RLHF), according to OpenAI. Human AI trainers provided the model with conversations in which they played both parts, the user and AI assistants.",
                image: _buildImage('chatbot.jpg'),
                decoration: pageDecoration,
              ),
            ],
            onDone: () => _onIntroEnd(context),
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: false,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: true,
            //rtl: true, // Display as right-to-left
            back: const Icon(
              Icons.arrow_back,
              size: 35.0,
              color: Colors.amber,
            ),
            skip: const Text('Skip',
                style: TextStyle(fontWeight: FontWeight.w600)),
            next: const Icon(
              Icons.arrow_forward,
              size: 35.0,
              color: Colors.amber,
            ),
            done: const Text('Done',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.amber)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: kIsWeb
                ? const EdgeInsets.all(12.0)
                : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Colors.amber,
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
