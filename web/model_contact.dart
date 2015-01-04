// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';


class Contact extends Observable {

  @observable String _name;
  @observable String _email;
  @observable String _phone;
  @observable String _adress;
  @observable String _number;

  Contact([this._adress = "", this._name = "", this._email = "", this._phone = "", this._number = "" ]);
  
 
  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['_name'] = _name;
    entityMap['_email'] = _email;
    entityMap['_phone'] = _phone;
    entityMap['_adress'] = _adress;   
    entityMap['_number'] = _number;
    return entityMap;
  }  
  
  
  fromJson(Map<String, Object> entityMap) {
    _name = entityMap['_name'];
    _email = entityMap['_email'];
    _phone = entityMap['_phone'];
    _adress = entityMap['_adress'];   
    _number = entityMap['_number'];
  }
  
}