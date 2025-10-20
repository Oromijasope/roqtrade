import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../components/button_hot.dart';
import 'important_message_sheet_model.dart';

class ImportantMessageSheet extends StackedView<ImportantMessageSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const ImportantMessageSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ImportantMessageSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF262932),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF20252B),
                  child: SvgPicture.asset('assets/icons/close.svg'),
                ),
              ),
            ],
          ),
          SvgPicture.asset('assets/images/important_message.svg'),
          const SizedBox(height: 12),
          Text(
            request.title ?? 'Important message!',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (request.description != null) ...[
            Center(
              child: Text(
                request.description!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFA7B1BC),
                ),
                maxLines: 3,
                softWrap: true,
              ),
            ),
          ],
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFA7B1BC),
              ),
              children: [
                TextSpan(
                  text: 'Learn more',
                  style: const TextStyle(
                    color: Color(0xFF85D1F0),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      completer?.call(SheetResponse(data: 'showRisks'));
                    },
                ),
                const TextSpan(text: ' about the risks.'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: viewModel.isChecked,
                onChanged: (value) {
                  viewModel.toggleCheckbox(value!);
                },
                activeColor: Colors.green,
              ),
              const Expanded(
                child: Text(
                  'Check this box to agree to Roqqu’s copy trading policy',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ButtonHot(
            width: double.infinity,
            height: 52,
            label: 'Proceed to copy trade',
            isDisabled: !viewModel.isChecked,
            onPressed: viewModel.isChecked
                ? () {
                    viewModel.gotoEnterAmount();
                  }
                : null,
            gradient: const LinearGradient(
              colors: [
                Color(0xFFDD568D),
                Color(0xFF7847E1),
                Color(0xFF3E32C1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ],
      ),
    );
  }

  @override
  ImportantMessageSheetModel viewModelBuilder(BuildContext context) =>
      ImportantMessageSheetModel();
}
