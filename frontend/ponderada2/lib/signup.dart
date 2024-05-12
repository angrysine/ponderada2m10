import 'package:flutter/material.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  @override
  final _formKey = GlobalKey<FormState>();
  double formPadding = 16;
  double formPaddingVertical = 16;
  bool _passwordVisible = false;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void printController() {
    print(_nameController.text);
    print(_passwordController.text);
  }

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: formPadding, vertical: formPaddingVertical),
              child: const Text(
                "Insira seus dados",
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: formPadding, vertical: formPaddingVertical),
              child: NameInput(
                nameController: _nameController,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: formPadding, vertical: formPaddingVertical),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira algum texto';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )),
                obscureText: !_passwordVisible,
                controller: _passwordController,
              ),
            ),
            LoginButton(
              formKey: _formKey,
              pressed: printController,
            ),
          ],
        ));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required Function pressed,
  })  : _formKey = formKey,
        _pressed = pressed;

  final GlobalKey<FormState> _formKey;
  final Function _pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          _pressed();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('Criar usuário'),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;
  final TextEditingController _nameController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Insira algum texto';
        }

        return null;
      },
      decoration: const InputDecoration(
          labelText: 'Nome', border: OutlineInputBorder()),
      controller: _nameController,
    );
  }
}
