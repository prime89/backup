// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:scoped_model/scoped_model.dart';

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7.0;

class AppStateModel extends Model {
  // All the available products.

  // The currently selected category of products.

  // The IDs and quantities of products currently in the cart.
  final Map<int, int> _productsInCart = <int, int>{};

  Map<int, int> get productsInCart => Map<int, int>.from(_productsInCart);

  // Total number of items in the cart.
  int get totalCartQuantity => _productsInCart.values.fold(0, (int v, int e) => v + e);


  // Total shipping cost for the items in the cart.
  double get shippingCost {
    return _shippingCostPerItem * _productsInCart.values.fold(0.0, (num sum, int e) => sum + e);
  }

  // Sales tax for the items in the cart

  // Total cost to order everything in the cart.

  @override
  String toString() {
    return 'AppStateModel(totalCost: )';
  }
}
