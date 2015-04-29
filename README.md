# GNKeyboardAwareScrollView

[![CI Status](http://img.shields.io/travis/jakubknejzlik/GNKeyboardAwareScrollView.svg?style=flat)](https://travis-ci.org/jakubknejzlik/GNKeyboardAwareScrollView)
[![Version](https://img.shields.io/cocoapods/v/GNKeyboardAwareScrollView.svg?style=flat)](http://cocoapods.org/pods/GNKeyboardAwareScrollView)
[![License](https://img.shields.io/cocoapods/l/GNKeyboardAwareScrollView.svg?style=flat)](http://cocoapods.org/pods/GNKeyboardAwareScrollView)
[![Platform](https://img.shields.io/cocoapods/p/GNKeyboardAwareScrollView.svg?style=flat)](http://cocoapods.org/pods/GNKeyboardAwareScrollView)

# Welcome to Keyboard aware UIScrollView

This library consists of:

- GNKeyboardAwareScrollView - adjusts reachable area for keyboard appearance
- GNTextFieldsManager - helps with handling many textfields and navigating between them by `next` keyboard button


## Instalation

You can directly download source code and import it to your project, or use *cocoapods*:

`pod "GNKeyboardAwareScrollView"`

## GNKeyboardAwareScrollView

Many developers struggle with UIScrollView covered with keyboard. This class helps to ease the pain of observing keyboard notifications and automatically adjusts it's contentInset to ensure that whole scroll area is reachable.

All you need to do is add it as subview. It handles everything else.

