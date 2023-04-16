import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class SearchById extends StatefulWidget {
  const SearchById({
    super.key,
    required this.textEditController,
    required this.onTap,
  });

  final TextEditingController textEditController;
  final VoidCallback onTap;

  @override
  State<SearchById> createState() => _SearchByIdState();
}

class _SearchByIdState extends State<SearchById> {
  final ValueNotifier<bool> _notifierTextIsEmpty = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _notifierTextIsEmpty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 365),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: widget.textEditController,
              style: GoogleFonts.inter(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: 'Digite seu ID do Discord',
                hintStyle: TextStyle(color: Colors.grey.withAlpha(200)),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.grey.withAlpha(400),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xff232328),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: _notifierTextIsEmpty,
                  builder: (_, notifierTextIsEmptyValue, __) => Visibility(
                    visible: !notifierTextIsEmptyValue,
                    child: GestureDetector(
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        widget.textEditController.clear();
                        _notifierTextIsEmpty.value = true;
                      },
                    ),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (String value) {
                _notifierTextIsEmpty.value = value.isEmpty;
              },
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 100,
            height: 46,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xff5865f2),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onPressed: widget.onTap,
              child: Text(
                'Pesquisar',
                style: GoogleFonts.inter(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
