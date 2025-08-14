import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // En-tête MONETIS BANK
              Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'MONETIS BANK',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '12 Boulevard des Affaires, Ville Exemple',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Tél: +999 123 456 789 | Email: contact@monetisbank.ex',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Reçu d'abonnement
              Container(
                color: Colors.orange[100],
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'REÇU D\'ABONNEMENT',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange),
                      ),
                      Text(
                        'COMPTE PROFESSIONNEL',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Date et N° de reçu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date: 11/08/2025', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                  Text('N° de reçu: 18492AB', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 20),

              // Client et compte
              Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Client: Société Alpha Développement SARL',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'N° compte: 000999PROG789',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Détail des prestations
              Text(
                'DÉTAIL DES PRESTATIONS',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
              ),
              const SizedBox(height: 10),

              Table(
                border: TableBorder.all(color: Colors.orange),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.orange),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Text('Détail', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Montant (€)',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Abonnement annuel',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '1 200,00',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Frais de mise en service',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '350,00',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
