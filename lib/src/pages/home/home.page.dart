import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../../utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RPGColors.dark,
      appBar: AppBar(
        backgroundColor: RPGColors.purple,
        centerTitle: true,
        title: SelectableText("心の友達"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child:
                  Text("Logo do site", style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(color: RPGColors.darkPurple),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text("Regras"),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 16,
            right: 16,
            child: Row(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  child: InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: Image.asset(RPGConstants.discordLogo),
                    onTap: () => js.context
                        .callMethod('open', ['https://discord.gg/5fvaY3p']),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  height: 64,
                  width: 64,
                  child: InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: Image.asset(RPGConstants.roll20Logo),
                    onTap: () =>
                        js.context.callMethod('open', ['https://roll20.net/']),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  height: 64,
                  width: 64,
                  child: InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    child: Image.asset(RPGConstants.watch2getherLogo),
                    onTap: () =>
                        js.context.callMethod('open', ['https://w2g.tv/']),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
