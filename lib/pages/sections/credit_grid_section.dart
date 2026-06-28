import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/components/cards/label.dart';
import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/member/member_model.dart';
import 'package:nes_ticket/states/actions/credits/credits_state.dart';

Widget _buildLabel(MemberModel item) =>
    Label(label: item.knownForDepartment, value: item.name);

class CreditGridSection extends ConsumerWidget {
  final int? id;
  final bool isTv;

  const CreditGridSection({super.key, required this.id, required this.isTv});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getCreditsCrewProvider(id: id, isTv: isTv));

    return state.when(
      data: (datas) {
        if (datas.hasNoValue) return SizedBox.shrink();

        final limitedDatas = datas!.take(8).toList();

        return Column(
          spacing: 12,
          children: [
            for (var i = 0; i < limitedDatas.length; i += 2)
              Row(
                spacing: 12,
                children: [
                  _buildLabel(limitedDatas[i]),
                  i + 1 < limitedDatas.length
                      ? _buildLabel(limitedDatas[i + 1])
                      : Spacer(),
                ],
              ),
          ],
        );
      },
      error: (error, stackTrace) {
        return SizedBox.shrink();
      },
      loading: () => Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
