import 'package:components/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Column(
        children: [
          _crearSlider(),
          _crearCheckBox(),
          _crearSwitch(),
          _crearImagen(),
          const AboutListTile(),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    // adaptative se adapta a la plataforma ios o android
    return Slider.adaptive(
        activeColor: AppTheme.primary,
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearImagen() {
    return Expanded(
        child: SingleChildScrollView(
            child: Image(
      image: const NetworkImage(
          'https://i.pinimg.com/originals/a6/07/30/a607302d6653b2fdde197ef404ea7fe6.png'),
      fit: BoxFit.contain,
      width: _valorSlider,
    )));
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        activeColor: AppTheme.primary,
        title: const Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile.adaptive(
        activeColor: AppTheme.primary,
        title: const Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
