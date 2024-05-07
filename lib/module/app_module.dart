import 'package:flutter_modular/flutter_modular.dart';
import 'package:na_porta/scr/repository/order_repository.dart';
import 'package:na_porta/scr/repository/order_repository_impl.dart';
import 'package:na_porta/scr/viewModel/order_list_view_model.dart';

import '../scr/database/database_service_impl.dart';
import '../scr/views/order_list_view.dart';

class AppModule extends Module{
  @override
  void binds(i){
  i.add<OrderRepository>(OrderRepositoryImpl.new);
  i.addInstance(DatabaseServiceImpl);

  i.add(OrderListViewModel.new);

  }

  @override
  void routes(RouteManager r) {
   r.child('/', child: (context ) => const  ListPage());
    super.routes(r);
  }
}