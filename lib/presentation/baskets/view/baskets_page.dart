import 'package:ecosecha_flutter/data/data.dart';
import 'package:ecosecha_flutter/domain/domain.dart';
import 'package:ecosecha_flutter/presentation/baskets/bloc/baskets_bloc.dart';
import 'package:ecosecha_flutter/presentation/widgets/base_view.dart';
import 'package:ecosecha_flutter/presentation/widgets/header.dart';
import 'package:ecosecha_flutter/presentation/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasketsPage extends StatelessWidget {
  const BasketsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const BasketsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BasketsBloc(repository: context.read<Repository>())..add(const BasketsRequestedEvent()),
      child: const BasketsView(),
    );
  }
}

class BasketsView extends StatelessWidget {
  const BasketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var S = AppLocalizations.of(context)!;

    return BaseView(
      title: Header(title: S.baskets.capitalizeSentence),
      body: BlocBuilder<BasketsBloc, BasketsState>(
        builder: (context, state) {
          return Expanded(
            child: ProductGridView(products: state.products),
          );
        },
      ),
    );
  }
}
