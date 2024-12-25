// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class QuantityInput extends StatefulWidget {
  final int? initialValue;
  final int minValue;
  final int? maxValue;
  final ValueChanged<int> onChanged;

  const QuantityInput({
    super.key,
    this.initialValue = 0,
    this.minValue = 0,
    this.maxValue,
    required this.onChanged,
  });

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  late int _currentValue;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue ?? 0;
    _controller = TextEditingController(text: _currentValue.toString());
  }

  void _increment() {
    // Nếu `maxValue` không được truyền, coi như vô hạn
    if (widget.maxValue == null || _currentValue < widget.maxValue!) {
      setState(() {
        _currentValue++;
        _controller.text = _currentValue.toString(); // Cập nhật TextField
      });
      widget.onChanged(_currentValue);
    }
  }

  void _decrement() {
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        _controller.text = _currentValue.toString(); // Cập nhật TextField
      });
      widget.onChanged(_currentValue);
    }
  }

  void _onInputChange(String value) {
    final newValue = int.tryParse(value);
    if (value == '') {
      setState(() {
        _currentValue = widget.minValue;
      });
    }
    if (newValue == null) {
      setState(() {
        _currentValue = widget.minValue;
      });
    }
    if (newValue != null &&
        (widget.maxValue == null || newValue <= widget.maxValue!)) {
      setState(() {
        _currentValue = newValue;
      });
      widget.onChanged(_currentValue);
    } else if (newValue == null) {}
  }

  @override
  void dispose() {
    _controller.clear();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_controller.text);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _decrement,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.minimize_rounded,
                size: 18,
                color: Colors.blue,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        SizedBox(
          width: 20,
          height: 20,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            focusNode: _focusNode,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            cursorHeight: 18,
            onChanged: _onInputChange,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
        ),
        GestureDetector(
          onTap: _increment,
          child: const Icon(
            Icons.add,
            size: 15,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

// ----------  ---------------

class QuantityPointInput extends StatefulWidget {
  final double? initialValue;
  final double minValue;
  final double? maxValue;
  final ValueChanged<double> onChanged;

  const QuantityPointInput({
    super.key,
    this.initialValue = 0.0,
    this.minValue = 0.0,
    this.maxValue,
    required this.onChanged,
  });

  @override
  _QuantityPointInputState createState() => _QuantityPointInputState();
}

class _QuantityPointInputState extends State<QuantityPointInput> {
  late double _currentValue;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue ?? 0.0;
    _controller = TextEditingController(text: _currentValue.toString());
  }

  void _increment() {
    if (widget.maxValue == null || _currentValue < widget.maxValue!) {
      setState(() {
        _currentValue++;
        _controller.text = _currentValue.toString();
      });
      widget.onChanged(_currentValue);
    }
  }

  void _decrement() {
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        _controller.text = _currentValue.toString(); // Cập nhật TextField
      });
      widget.onChanged(_currentValue);
    }
  }

  void _onInputChange(String value) {
    final newValue = double.tryParse(value);
    if (value == '') {
      setState(() {
        _currentValue = widget.minValue;
      });
    }
    if (newValue == null) {
      setState(() {
        _currentValue = widget.minValue;
      });
    }
    if (newValue != null &&
        (widget.maxValue == null || newValue <= widget.maxValue!)) {
      setState(() {
        _currentValue = newValue;
      });
      widget.onChanged(_currentValue);
    }
  }

  @override
  void dispose() {
    _controller.clear();

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_controller.text);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _decrement,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.minimize_rounded,
                size: 18,
                color: Colors.blue,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            focusNode: _focusNode,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            onChanged: _onInputChange,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        GestureDetector(
          onTap: _increment,
          child: const Icon(
            Icons.add,
            size: 15,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

// ----------  ---------------
class TextFieldInput extends StatefulWidget {
  final String? labelText;
  final String initValue;
  final String? title;
  final ValueChanged<String> onChanged;

  const TextFieldInput({
    super.key,
    required this.onChanged,
    this.title,
    required this.initValue,
    this.labelText,
  });

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late String _currentValue;
  @override
  void initState() {
    _currentValue = widget.initValue;
    _focusNode = FocusNode();
    _controller = TextEditingController(text: _currentValue.toString());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onInputChange(String value) {
    setState(() {
      _currentValue = value;
    });
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        SizedBox(
          height: 35,
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
            decoration: InputDecoration(
              labelStyle: const TextStyle(fontSize: 14),
              label: widget.labelText != null ? Text(widget.labelText!) : null,
              floatingLabelStyle: const TextStyle(color: Colors.blue),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              contentPadding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              focusColor: Colors.blue,
            ),
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            onChanged: _onInputChange,
          ),
        ),
      ],
    );
  }
}

// ----------  ---------------
class TextFormFieldEmail extends StatefulWidget {
  final String? labelText;
  final String initValue;
  final String? title;
  final ValueChanged<String> onChanged;

  const TextFormFieldEmail({
    super.key,
    required this.onChanged,
    this.title,
    required this.initValue,
    this.labelText,
  });

  @override
  State<TextFormFieldEmail> createState() => _TextFormFieldEmailState();
}

class _TextFormFieldEmailState extends State<TextFormFieldEmail> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late String _currentValue;
  @override
  void initState() {
    _currentValue = widget.initValue;
    _focusNode = FocusNode();
    _controller = TextEditingController(text: _currentValue.toString());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onInputChange(String value) {
    setState(() {
      _currentValue = value;
    });
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else {
              if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value) ==
                  false) {
                return 'This is not an email';
              }
            }
            return null;
          },
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
            isDense: true,
            labelStyle: const TextStyle(fontSize: 14),
            label: widget.labelText != null ? Text(widget.labelText!) : null,
            floatingLabelStyle: const TextStyle(color: Colors.blue),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            focusColor: Colors.blue,
          ),
          onTapOutside: (event) {
            _focusNode.unfocus();
          },
          onChanged: _onInputChange,
        ),
      ],
    );
  }
}

// ----------  ---------------

class SelectTextInput extends StatefulWidget {
  final String? title;
  final String? labelText;
  final bool? isRefresh;
  final List<String> listData;
  final String initValue;
  final ValueChanged<String?> onSelected;
  final GlobalKey<FormFieldState>? keys;
  const SelectTextInput({
    super.key,
    this.title,
    this.labelText,
    this.isRefresh,
    required this.listData,
    required this.initValue,
    required this.onSelected,
    this.keys,
  });

  @override
  State<SelectTextInput> createState() => _SelectTextInputState();
}

class _SelectTextInputState extends State<SelectTextInput> {
  late String dropdownValue;
  late TextEditingController _controller;

  Future<void> refreshData() async {
    setState(() {
      dropdownValue = widget.initValue;
      _controller.text = widget.initValue;
    });
  }

  @override
  void initState() {
    _controller = TextEditingController();
    dropdownValue = widget.initValue;

    super.initState();
  }

  void _onSelectChange(String? value) {
    setState(() {
      dropdownValue = value ?? '';
    });
    widget.onSelected(value);
  }

  @override
  void dispose() {
    dropdownValue = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        widget.title != null
            ? Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        DropdownMenu<String>(
          key: widget.keys,
          controller: _controller,
          textStyle: const TextStyle(fontSize: 15),
          menuHeight: MediaQuery.of(context).size.height * 0.4,
          label: widget.labelText != null
              ? Text(
                  widget.labelText!,
                  style: const TextStyle(fontSize: 14),
                )
              : null,
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: const TextStyle(color: Colors.blue),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200)),
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            constraints: BoxConstraints.tight(const Size.fromHeight(35)),
          ),
          initialSelection: dropdownValue,
          onSelected: _onSelectChange,
          dropdownMenuEntries:
              widget.listData.map<DropdownMenuEntry<String>>((String value) {
            bool isSelected = value == dropdownValue;
            return DropdownMenuEntry<String>(
                value: value,
                label: value,
                style: ButtonStyle(
                  textStyle: const WidgetStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.normal)),
                  foregroundColor: WidgetStatePropertyAll(
                      isSelected ? Colors.blue.shade300 : Colors.black),
                ));
          }).toList(),
        ),
      ],
    );
  }
}

// ----------  ---------------

class SelectDateInput extends StatefulWidget {
  final String? labelText;
  final String initValue;
  final String? title;
  final ValueChanged<String> onDateChanged;
  const SelectDateInput({
    super.key,
    this.title,
    required this.onDateChanged,
    required this.initValue,
    this.labelText,
  });

  @override
  _SelectDateInputState createState() => _SelectDateInputState();
}

class _SelectDateInputState extends State<SelectDateInput> {
  final TextEditingController _dateController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _dateController.text = widget.initValue ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // Hàm mở picker lịch và lấy ngày
  Future<void> _selectDate(BuildContext context) async {
    DateTime initDate = DateTime.now();
    if (widget.initValue != '') {
      initDate = DateFormat('dd/MM/yyyy').parse(widget.initValue);
    }
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
      widget.onDateChanged(pickedDate.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        widget.title != null
            ? Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        SizedBox(
          height: 35,
          child: TextFormField(
            controller: _dateController,
            focusNode: _focusNode,
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            readOnly: true,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              labelStyle: const TextStyle(fontSize: 13),
              floatingLabelStyle: const TextStyle(color: Colors.blue),
              label: widget.labelText != null ? Text(widget.labelText!) : null,
              hintText: 'dd/MM/yyyy',
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              contentPadding: const EdgeInsets.fromLTRB(10, 3, 3, 3),
              suffixIcon: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
              ),
            ),
            onTap: () => _selectDate(context),
          ),
        ),
      ],
    );
  }
}

// ----------  ---------------

class ButtonAction extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double fontSizeTitle;
  final Color backgroundColor;
  final double width;
  final double height;
  const ButtonAction({
    super.key,
    required this.title,
    required this.titleColor,
    required this.fontSizeTitle,
    required this.backgroundColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSizeTitle,
            color: titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ----------  ---------------

class ConstrainedColumnTable extends StatelessWidget {
  final Widget child;
  const ConstrainedColumnTable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 10,
        maxWidth: 160,
      ),
      child: child,
    );
  }
}

// ----------  ---------------

class ConstrainedColumnCustomTable extends StatelessWidget {
  final Widget child;
  const ConstrainedColumnCustomTable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 10,
        maxWidth: 120,
      ),
      child: child,
    );
  }
}

// ----------  ---------------

class TitleColumnTable extends StatelessWidget {
  final String title;
  const TitleColumnTable({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ----------  ---------------

class CheckBoxTable extends StatefulWidget {
  final bool initIsChecked;
  final ValueChanged<bool> onCheckbox;
  const CheckBoxTable(
      {super.key, required this.onCheckbox, required this.initIsChecked});

  @override
  State<CheckBoxTable> createState() => _CheckBoxTableState();
}

class _CheckBoxTableState extends State<CheckBoxTable> {
  bool _isChecked = false;

  @override
  void initState() {
    widget.initIsChecked ? _isChecked = true : _isChecked = false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckBoxTable oldWidget) {
    if (oldWidget.initIsChecked != widget.initIsChecked) {
      widget.initIsChecked ? _isChecked = true : _isChecked = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      activeColor: widget.initIsChecked ? Colors.grey : Colors.blue,
      onChanged: (value) {
        if (widget.initIsChecked == false) {
          setState(() {
            _isChecked = value!;
          });
          widget.onCheckbox(_isChecked);
        }
      },
    );
  }
}

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool> onSwitchButton;
  const SwitchButton({super.key, required this.onSwitchButton});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isChange = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: isChange,
        activeColor: Colors.blue,
        onChanged: (bool value) {
          setState(() {
            isChange = value;
          });
          widget.onSwitchButton(value);
        },
      ),
    );
  }
}
