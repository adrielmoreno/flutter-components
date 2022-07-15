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
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
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
    return Image(
      image: const NetworkImage(
          'https://www.pngarts.com/files/8/Comic-Batman-PNG-High-Quality-Image.png'),
      fit: BoxFit.contain,
      width: _valorSlider,
    );
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
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearCheck = valor!;
    //       });
    //     });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
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
