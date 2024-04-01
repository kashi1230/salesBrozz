
import '../imports.dart';
import '../model/dashboard_model.dart';

class DashboardController {
  final dashboardPurchaseList = [
    DashboardModel(
      icon: Icons.shopping_cart,
      title: 'Total\nPurchace\nInvoices',
      value: '06',
    ),
    DashboardModel(
      icon: Icons.currency_rupee_rounded,
      title: 'Total\nPurchase\nAmmount',
      value: '₹ 4,500',
    ),
    DashboardModel(
      icon: Icons.payments_outlined,
      title: 'Pending\nPurchase\nAmmount',
      value: '₹ 4,500',
    ),
    DashboardModel(
      icon: Icons.payment,
      title: 'Paid\nPurchase\nAmmount',
      value: '₹ 10,050',
    ),
  ];
}
