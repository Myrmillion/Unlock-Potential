import 'package:flutter/material.dart';

class Utils {
  /// A method to build a widget based on the state of a stream's snapshot.
  static Widget streamBuilding<T>({
    required AsyncSnapshot<T> snap,
    required Widget Function(T data) builder,
  }) {
    if (!snap.hasError) {
      if (snap.connectionState == ConnectionState.active) {
        if (snap.hasData) {
          // If snapshot has no error, is active, and has data, widget is built.
          return builder(snap.data as T);
        } else {
          return const Center(child: Text('No data'));
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    } else {
      return Center(child: Text("Error: ${snap.error}"));
    }
  }

  /// A method to build a widget based on the state of a future's snapshot.
  static Widget futureBuilding<T>({
    required AsyncSnapshot<T> snap,
    required Widget Function(T data) builder,
  }) {
    if (!snap.hasError) {
      if (snap.connectionState == ConnectionState.done) {
        if (snap.hasData) {
          return builder(snap.data as T);
        } else {
          return const Center(child: Text('No data'));
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    } else {
      return Center(child: Text("Error: ${snap.error}"));
    }
  }

  /// A method to clear all snackbar and display a new one.
  static void simpleSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(content: Text(message), showCloseIcon: true),
      );
  }
}
