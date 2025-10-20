import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../components/button_hot.dart'; // ✅ import your ButtonHot
import 'risks_sheet_model.dart';

class RisksSheet extends StackedView<RisksSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const RisksSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RisksSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
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
          // Title
          Text(
            request.title ?? 'Risks involved in copy trading',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(height: 8),

          // Description
          if (request.description != null) ...[
            Text(
              request.description!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFA7B1BC),
                  fontWeight: FontWeight.w400),
              maxLines: 3,
              softWrap: true,
            ),
            const SizedBox(height: 16),
          ],

          Expanded(
            child: ListView(
              children: const [
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Market risks",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "All investments carry risks, including potential loss of capital.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Dependency on others",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "Copy trading involves following the strategies of others, which means your success is dependent on their decisions, skills, and risk tolerance.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Mismatched risk profiles",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: [
                    ListTile(
                        title: Text(
                      "The risk tolerance of the person you're copying may not align with your own, which could lead to unwanted losses or higher risk exposure.s",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Control and understanding",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "You may not have full control over the trades made by the person you're copying, and a lack of understanding of their strategies could increase risk.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Emotional decisions",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "Following others may lead to emotional decision-making, such as panic or greed, especially when market conditions change rapidly.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Costs involved",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "Copy trading might incur additional fees or commissions, reducing potential profits. Be sure to understand the cost structure before engaging.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Diversify",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "Relying on a single trader or strategy can expose you to concentrated risk. Diversifying across multiple strategies can help mitigate some risks.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Execution risks",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "The timing and execution of trades may differ slightly between your account and the trader you're copying, which can affect your performance.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Copy trading investments can be complex",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  children: [
                    ListTile(
                        title: Text(
                      "Copy trading involves varied strategies and risks, requiring careful understanding.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA7B1BC)),
                    ))
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          ButtonHot(
              width: double.infinity,
              height: 52,
              label: 'I have read the risks',
              isDisabled: false,
              onPressed: () {
                completer?.call(SheetResponse(confirmed: true));
              }),
        ],
      ),
    );
  }

  @override
  RisksSheetModel viewModelBuilder(BuildContext context) => RisksSheetModel();
}
