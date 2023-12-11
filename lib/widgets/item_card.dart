import 'package:flutter/material.dart';
import 'package:prj_wisatacandisi51_flutterpert3/models/candi.dart';
import 'package:prj_wisatacandisi51_flutterpert3/widgets/detail_screen.dart';

class ItemCard extends StatelessWidget {
  // TODO : 1. DEKLARASIKAN VARIABEL
  final Candi candi;

  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    //TODO : 6. Implementasi ROUTING KE DETAILSCREEN
    

    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: candi)
            ),
        );
      },
      child: Card(
        // TODO : 2. tetapkan parameter
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(4),
        elevation: 1,
    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO : 3. Buat IMAGE
            Expanded(
              // TODO : 7. Implementasi Hero Animation

              child: Hero(
                tag: candi.imageAsset,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // TODO : 4. BUAT TEXT
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // TODO : 5. BUAT TEXT
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                candi.type,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
