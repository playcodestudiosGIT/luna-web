// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:luna_aconstruction/config/constants.dart';
import 'package:provider/provider.dart';

import '../../../api/luna_api.dart';
import '../../../providers/settings_provider.dart';

class ApplyDialog extends StatefulWidget {
  const ApplyDialog({
    super.key,
  });

  @override
  State<ApplyDialog> createState() => _ApplyDialogState();
}

bool isLoading = false;
bool isComplete = false;

String id = '';
String itin = '';
String ss = '';
String osha10 = '';

String nombre = '';
String apellido = '';
String direccion = '';
String email = '';
String telf = '';
String specialty = '';
Uint8List idFileBytes = Uint8List(0);
Uint8List itinFileBytes = Uint8List(0);
Uint8List osha10FileBytes = Uint8List(0);

final _formKey = GlobalKey<FormState>();

class _ApplyDialogState extends State<ApplyDialog> {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<SettingsProvider>(context).language;
    return AlertDialog(
        actions: [
          if (!isLoading)
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                label: (language == Language.en)
                    ? const Text(
                        'CLOSE',
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        'CERRAR',
                        style: TextStyle(color: Colors.white),
                      ))
        ],
        content: SingleChildScrollView(
          child: (isLoading)
              ? Center(
                  child: Column(
                    children: [
                      if (language == Language.es) const Text('Enviando...'),
                      if (language == Language.en) const Text('Sending...'),
                      const SizedBox(height: 15),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  width: double.infinity,
                  child: (isComplete)
                      ? Column(
                          children: [
                            if (language == Language.es)
                              const Text('Tus datos fueron enviados'),
                            if (language == Language.en)
                              const Text('Your data has been sent'),
                            const SizedBox(height: 15),
                            if (language == Language.es)
                              const Text('Nos estaremos comunicando contigo'),
                            if (language == Language.en)
                              const Text('We will be communicating with you'),
                          ],
                        )
                      : Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 30),
                              if (language == Language.es)
                                Text('Aplica con nosotros',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              if (language == Language.en)
                                Text('Apply with us',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              const SizedBox(height: 30),
                              Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return (language == Language.en)
                                            ? 'The name is required'
                                            : 'El nombre es requerido';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.3))),
                                        label: (language == Language.en)
                                            ? const Text('Name')
                                            : const Text('Nombre')),
                                    onChanged: (value) => nombre = value,
                                  )),
                              const SizedBox(height: 15),
                              Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return (language == Language.en)
                                            ? 'The lastname is required'
                                            : 'El apellido es requerido';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.3))),
                                        label: (language == Language.en)
                                            ? const Text('Lastname')
                                            : const Text('Apellido')),
                                    onChanged: (value) => apellido = value,
                                  )),
                              const SizedBox(height: 15),
                              Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return (language == Language.en)
                                            ? 'Address is required'
                                            : 'La dirección es requerida';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.3))),
                                        label: (language == Language.en)
                                            ? const Text('Address')
                                            : const Text('Dirección')),
                                    onChanged: (value) => direccion = value,
                                  )),
                              const SizedBox(height: 15),
                              Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return (language == Language.en)
                                            ? 'Telephone is required'
                                            : 'El teléfono es requerido';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.3))),
                                        label: (language == Language.en)
                                            ? const Text('Phone')
                                            : const Text('Teléfono')),
                                    onChanged: (value) => telf = value,
                                  )),
                              const SizedBox(height: 15),
                              Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return (language == Language.en)
                                            ? 'Email is required'
                                            : 'El email es requerido';
                                      }
                                      if (!EmailValidator.validate(value)) {
                                        return (language == Language.en)
                                            ? 'This doesn\'t look like an email'
                                            : 'Esto no parece un email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.3))),
                                        label: (language == Language.en)
                                            ? const Text('Email')
                                            : const Text('Correo')),
                                    onChanged: (value) => email = value,
                                  )),
                              const SizedBox(height: 15),
                              Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.3))),
                                        label: (language == Language.en)
                                            ? const Text('Social Security')
                                            : const Text('Social Security')),
                                    onChanged: (value) => ss = value,
                                  )),
                              const SizedBox(height: 30),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: DropdownButton(
                                  underline: Container(),
                                  isExpanded: true,
                                  value: specialty,
                                  items: [
                                    DropdownMenuItem(
                                        value: '',
                                        child: (language == Language.es)
                                            ? const Text(
                                                'Selecciona tu especialidad')
                                            : const Text(
                                                'Select your specialty')),
                                    DropdownMenuItem(
                                        value: 'electricians',
                                        child: (language == Language.es)
                                            ? const Text('Electricista')
                                            : const Text('Electrician')),
                                    DropdownMenuItem(
                                        value: 'plumbers',
                                        child: (language == Language.es)
                                            ? const Text('Plomero')
                                            : const Text('Plumber')),
                                    DropdownMenuItem(
                                        value: 'fitterspipe',
                                        child: (language == Language.es)
                                            ? const Text(
                                                'Instalador de tubería')
                                            : const Text('Pipe Fitters')),
                                    DropdownMenuItem(
                                        value: 'sheetmetal',
                                        child: (language == Language.es)
                                            ? const Text('Hojas de Metal')
                                            : const Text('Sheet Metal')),
                                    DropdownMenuItem(
                                        value: 'control',
                                        child: (language == Language.es)
                                            ? const Text('Control')
                                            : const Text('Control')),
                                    DropdownMenuItem(
                                        value: 'welders',
                                        child: (language == Language.es)
                                            ? const Text('Soldador')
                                            : const Text('Welder')),
                                  ],
                                  onChanged: (value) {
                                    specialty = value.toString();
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: (id == '')
                                            ? (language == Language.es)
                                                ? const Text('Seleccione el ID')
                                                : const Text('Select ID')
                                            : Text(id)),
                                    const SizedBox(width: 15),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor)),
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                      type: FileType.custom,
                                                      allowedExtensions: [
                                                        'png',
                                                        'jpg',
                                                        'jpeg',
                                                        'pdf'
                                                      ],
                                                      allowMultiple: false);

                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;

                                            if (file.size > 5000000) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: (language ==
                                                            Language.es)
                                                        ? const Text(
                                                            'El Archivo es muy grande')
                                                        : const Text(
                                                            'The archive is very large')),
                                              );
                                              return;
                                            }

                                            id = file.name;

                                            idFileBytes = file.bytes!;

                                            setState(() {});
                                          } else {
                                            // User canceled the picker
                                          }
                                        },
                                        child: const Icon(
                                            FontAwesomeIcons.idCard,
                                            color: bgColor)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: (itin == '')
                                            ? (language == Language.es)
                                                ? const Text('Seleccione ITIN')
                                                : const Text('Select ITIN')
                                            : Text(itin)),
                                    const SizedBox(width: 15),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor)),
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                      type: FileType.custom,
                                                      allowedExtensions: [
                                                        'png',
                                                        'jpg',
                                                        'jpeg',
                                                        'pdf'
                                                      ],
                                                      allowMultiple: false);

                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;

                                            if (file.size > 5000000) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: (language ==
                                                            Language.es)
                                                        ? const Text(
                                                            'El Archivo es muy grande')
                                                        : const Text(
                                                            'The archive is very large')),
                                              );
                                              return;
                                            }

                                            itin = file.name;

                                            itinFileBytes = file.bytes!;
                                            setState(() {});
                                          } else {
                                            // User canceled the picker
                                          }
                                        },
                                        child: const Icon(
                                            FontAwesomeIcons.fileContract,
                                            color: bgColor)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: (osha10 == '')
                                            ? (language == Language.es)
                                                ? const Text(
                                                    'Seleccione OSHA10')
                                                : const Text('Select OSHA10')
                                            : Text(osha10)),
                                    const SizedBox(width: 15),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor)),
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                      type: FileType.custom,
                                                      allowedExtensions: [
                                                        'png',
                                                        'jpg',
                                                        'jpeg',
                                                        'pdf'
                                                      ],
                                                      allowMultiple: false);

                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;

                                            if (file.size > 5000000) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: (language ==
                                                            Language.es)
                                                        ? const Text(
                                                            'El Archivo es muy grande')
                                                        : const Text(
                                                            'The archive is very large')),
                                              );
                                              return;
                                            }

                                            osha10 = file.name;

                                            osha10FileBytes = file.bytes!;
                                            setState(() {});
                                          } else {
                                            // User canceled the picker
                                          }
                                        },
                                        child: const Icon(Icons.settings,
                                            color: bgColor)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor)),
                                  label: (language == Language.es)
                                      ? const Text(
                                          'ENVIAR',
                                          style: TextStyle(color: bgColor),
                                        )
                                      : const Text(
                                          'SEND',
                                          style: TextStyle(color: bgColor),
                                        ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      isLoading = true;
                                        setState(() {});
                                        await LunaApi.createApply(
                                            idFileBytes: idFileBytes,
                                            itinFileBytes: itinFileBytes,
                                            osha10FileBytes: osha10FileBytes,
                                            nombre: nombre,
                                            apellido: apellido,
                                            email: email,
                                            direccion: direccion,
                                            telf: telf,
                                            specialty: specialty,
                                            ss: ss);
                                        isLoading = false;
                                        isComplete = true;
                                        setState(() {});
                                        
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: (language == Language.es)
                                                  ? const Text(
                                                      'Faltan algunos documentos')
                                                  : const Text(
                                                      'Some documents are missing')),
                                        );
                                      
                                    }
                                  },
                                  icon: const Icon(Icons.send, color: bgColor))
                            ],
                          ),
                        ),
                ),
        ));
  }
}
