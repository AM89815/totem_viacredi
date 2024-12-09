import 'package:flutter/material.dart';
import 'package:totem/background/logo.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final bool showLogo; // true pra exibir a logo

  const BasePage({super.key, required this.child, this.showLogo = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/images-totem/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -15,
            right: -15,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 250,
                  ),
                  child: Image.asset(
                    'assets/images/images-totem/desenho.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          if (showLogo)
          const LogoWidget(),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}