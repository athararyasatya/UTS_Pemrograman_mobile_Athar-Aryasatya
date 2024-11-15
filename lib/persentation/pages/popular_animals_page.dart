import 'package:flutter/material.dart';

class PopularAnimalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animals populer",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Grid dengan kartu Animal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return AnimalCard(animal: animals[index]);
              },
            ),
          ),
          // Shadow di bagian bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          // Garis dan tombol di bagian bawah
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Garis indikasi di atas tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
                SizedBox(height: 10),
             
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final Animal animal;

  AnimalCard({required this.animal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AnimalDetailPopup(animal: animal);
          },
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    animal.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.info_outline, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            animal.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            animal.location,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalDetailPopup extends StatelessWidget {
  final Animal animal;

  AnimalDetailPopup({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                animal.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 16),
            Text(
              animal.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              animal.location,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              animal.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Animal {
  final String name;
  final String imagePath;
  final double distance;
  final Color backgroundColor;
  final String location;
  final String description;

  Animal({
    required this.name,
    required this.imagePath,
    required this.distance,
    required this.backgroundColor,
    this.location = "Lokasi tidak tersedia",
    this.description = "Deskripsi tidak tersedia",
  });
}

final List<Animal> animals = [
  Animal(
    name: "Sumatran Tiger",
    imagePath: 'assets/images/harimau.png',
    distance: 1.2,
    backgroundColor: Colors.purple[100]!,
    location: "Sumatra",
    description: "Salah satu mamalia paling ikonik yang menyimbolkan kekuatan, keindahan serta pentingnya konservasi.",
  ),
  Animal(
    name: "Bekantan",
    imagePath: 'assets/images/bekan.png',
    distance: 2.3,
    backgroundColor: Colors.orange[100]!,
    location: "Kalimantan",
    description: "Bekantan merupakan sejenis kera dengan ciri khas hidung panjang dan besar serta rambut berwarna coklat kemerahan.",
  ),
  Animal(
    name: "African Elephant",
    imagePath: 'assets/images/gajah.png',
    distance: 1.5,
    backgroundColor: Colors.blue[100]!,
    location: "Afrika",
    description: "African Elephant adalah spesies gajah terbesar yang hidup di benua Afrika.",
  ),
  Animal(
    name: "Komodo Dragon",
    imagePath: 'assets/images/komodo.png',
    distance: 1.9,
    backgroundColor: Colors.green[100]!,
    location: "Flores NTT",
    description: "Komodo Dragon adalah kadal terbesar di dunia yang hanya ditemukan di pulau Komodo.",
  ),
    Animal(
    name: "Aligator Gar",
    imagePath: 'assets/images/alig.png',
    distance: 1.9,
    backgroundColor: Colors.green[100]!,
    location: "Amerika utara",
    description: "Alligator gar atau ikan aligator adalah satu dari tujuh spesies gar yang tergabung ke dalam keluarga Lepisosteidae. Kelompok ini kemudian dipisahkan menjadi dua genus besar, yaitu Atractosteus dan Lepisosteus.",
  ),
      Animal(
    name: "Candrawasih",
    imagePath: 'assets/images/candrawasih.png',
    distance: 1.9,
    backgroundColor: Colors.green[100]!,
    location: "Papua",
    description: "Cendrawasih botak masuk dalam bangsa Passeriformes. Ciri khasnya kakinya memiliki empat jari dengan tiga jari ke arah depan dan satu ke arah belakang."
    ),
];
