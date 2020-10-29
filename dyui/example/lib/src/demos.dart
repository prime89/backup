// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'all.dart';
import 'icons.dart';

class GalleryDemoCategory {
  const GalleryDemoCategory._({
    @required this.name,
    @required this.icon,
  });

  final String name;
  final IconData icon;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other))
      return true;
    if (runtimeType != other.runtimeType)
      return false;
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

const GalleryDemoCategory _kDemos = GalleryDemoCategory._(
  name: 'Studies',
  icon: GalleryIcons.animation,
);

const GalleryDemoCategory _kStyle = GalleryDemoCategory._(
  name: 'Style',
  icon: GalleryIcons.custom_typography,
);

const GalleryDemoCategory _kMaterialComponents = GalleryDemoCategory._(
  name: 'Material',
  icon: GalleryIcons.category_mdc,
);

const GalleryDemoCategory _kCupertinoComponents = GalleryDemoCategory._(
  name: 'Cupertino',
  icon: GalleryIcons.phone_iphone,
);

const GalleryDemoCategory _kMedia = GalleryDemoCategory._(
  name: 'Media',
  icon: GalleryIcons.drive_video,
);

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    this.documentationUrl,
    @required this.buildRoute,
  }) : assert(title != null),
       assert(category != null),
       assert(routeName != null),
       assert(buildRoute != null);

  final String title;
  final IconData icon;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;
  final String documentationUrl;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = <GalleryDemo>[
    // Cupertino Components
    GalleryDemo(
      title: 'Activity Indicator',
      icon: GalleryIcons.cupertino_progress,
      category: _kCupertinoComponents,
      routeName: CupertinoProgressIndicatorDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoActivityIndicator-class.html',
      buildRoute: (BuildContext context) => CupertinoProgressIndicatorDemo(),
    ),
    GalleryDemo(
      title: 'Alerts',
      icon: GalleryIcons.dialogs,
      category: _kCupertinoComponents,
      routeName: CupertinoAlertDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/showCupertinoDialog.html',
      buildRoute: (BuildContext context) => CupertinoAlertDemo(),
    ),
    GalleryDemo(
      title: 'Buttons',
      icon: GalleryIcons.generic_buttons,
      category: _kCupertinoComponents,
      routeName: CupertinoButtonsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoButton-class.html',
      buildRoute: (BuildContext context) => CupertinoButtonsDemo(),
    ),
    GalleryDemo(
      title: 'Navigation',
      icon: GalleryIcons.bottom_navigation,
      category: _kCupertinoComponents,
      routeName: CupertinoNavigationDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoTabScaffold-class.html',
      buildRoute: (BuildContext context) => CupertinoNavigationDemo(),
    ),
    GalleryDemo(
      title: 'Pickers',
      icon: GalleryIcons.event,
      category: _kCupertinoComponents,
      routeName: CupertinoPickerDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoPicker-class.html',
      buildRoute: (BuildContext context) => CupertinoPickerDemo(),
    ),
    GalleryDemo(
      title: 'Pull to refresh',
      icon: GalleryIcons.cupertino_pull_to_refresh,
      category: _kCupertinoComponents,
      routeName: CupertinoRefreshControlDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSliverRefreshControl-class.html',
      buildRoute: (BuildContext context) => CupertinoRefreshControlDemo(),
    ),
    GalleryDemo(
      title: 'Segmented Control',
      icon: GalleryIcons.tabs,
      category: _kCupertinoComponents,
      routeName: CupertinoSegmentedControlDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSegmentedControl-class.html',
      buildRoute: (BuildContext context) => CupertinoSegmentedControlDemo(),
    ),
    GalleryDemo(
      title: 'Sliders',
      icon: GalleryIcons.sliders,
      category: _kCupertinoComponents,
      routeName: CupertinoSliderDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSlider-class.html',
      buildRoute: (BuildContext context) => CupertinoSliderDemo(),
    ),
    GalleryDemo(
      title: 'Switches',
      icon: GalleryIcons.cupertino_switch,
      category: _kCupertinoComponents,
      routeName: CupertinoSwitchDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSwitch-class.html',
      buildRoute: (BuildContext context) => CupertinoSwitchDemo(),
    ),
    GalleryDemo(
      title: 'Text Fields',
      icon: GalleryIcons.text_fields_alt,
      category: _kCupertinoComponents,
      routeName: CupertinoTextFieldDemo.routeName,
      buildRoute: (BuildContext context) => CupertinoTextFieldDemo(),
    ),
  ];

  // Keep Pesto around for its regression test value. It is not included
  // in (release builds) the performance tests.
  assert(() {
    galleryDemos.insert(0,
      GalleryDemo(
        title: 'Pesto',
        subtitle: 'Simple recipe browser',
        icon: Icons.adjust,
        category: _kDemos,
        routeName: PestoDemo.routeName,
        buildRoute: (BuildContext context) => const PestoDemo(),
      ),
    );
    return true;
  }());

  return galleryDemos;
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

final Set<GalleryDemoCategory> kAllGalleryDemoCategories =
  kAllGalleryDemos.map<GalleryDemoCategory>((GalleryDemo demo) => demo.category).toSet();

final Map<GalleryDemoCategory, List<GalleryDemo>> kGalleryCategoryToDemos =
  Map<GalleryDemoCategory, List<GalleryDemo>>.fromIterable(
    kAllGalleryDemoCategories,
    value: (dynamic category) {
      return kAllGalleryDemos.where((GalleryDemo demo) => demo.category == category).toList();
    },
  );

final Map<String, String> kDemoDocumentationUrl =
    Map<String, String>.fromIterable(
      kAllGalleryDemos.where((GalleryDemo demo) => demo.documentationUrl != null),
      key: (dynamic demo) => demo.routeName,
      value: (dynamic demo) => demo.documentationUrl,
    );
