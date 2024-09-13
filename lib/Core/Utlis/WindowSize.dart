import 'dart:developer';
import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

void windowSize() async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setFullScreen(true);
    Size fullSize = await DesktopWindow.getWindowSize();
    log(fullSize.toString());
    await DesktopWindow.setWindowSize(fullSize);
    await DesktopWindow.setMinWindowSize(fullSize);
  }
}
