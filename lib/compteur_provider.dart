import 'package:flutter/material.dart';

class CompteurProvider with ChangeNotifier{
int _compteur;

CompteurProvider(this._compteur);

int get compteur => this.compteur;

Set counter(int valeur)  {
  _compteur = valeur
;}

void increment()  {
  _compteur++;
  notifyListeners();
}

}