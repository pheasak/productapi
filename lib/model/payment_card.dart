class PaymentCard {
  String card, name;
  PaymentCard({required this.card, required this.name});
  static List<PaymentCard> lscard = [
    PaymentCard(card: 'assets/image/mastercard.png', name: 'Mastercard'),
    PaymentCard(card: 'assets/image/palpay.png', name: 'PalPay'),
    PaymentCard(card: 'assets/image/visalcard.png', name: 'Visa')
  ];
}
