// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../framework/dyui.dart';

import '../demo.dart';

class CupertinoProgressIndicatorDemo extends StatelessWidget {
  static const String routeName = '/cupertino/progress_indicator';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // We're specifying a back label here because the previous page is a
        // Material page. CupertinoPageRoutes could auto-populate these back
        // labels.
        previousPageTitle: 'Cupertino',
        middle: const Text('Activity Indicator'),
        trailing: CupertinoDemoDocumentationButton(routeName),
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
