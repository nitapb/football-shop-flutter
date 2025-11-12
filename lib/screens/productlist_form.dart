import 'package:flutter/material.dart';
import 'package:football_shop/widgets/drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "Perlengkapan"; // default
  String _thumbnail = "";
  bool _isAvailable = false; // default

  final List<String> _categories = [
    'Perlengkapan',
    'Aksesori',
    'Pakaian',
    'Sepatu',
  ];

  bool _isValidURL(String value) {
    final urlPattern =
        r'^(http|https):\/\/[a-zA-Z0-9\-\.]+\.[a-z]{2,4}\/?\S*$';
    return RegExp(urlPattern).hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Produk ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama produk tidak boleh kosong!";
                  } else if (value.length < 3) {
                    return "Nama produk minimal 3 karakter.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Harga ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Harga Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _price = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  final number = int.tryParse(value);
                  if (number == null) {
                    return "Harga harus berupa angka!";
                  } else if (number <= 0) {
                    return "Harga harus lebih dari 0!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Deskripsi ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Deskripsi Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLines: 4,
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  } else if (value.length < 10) {
                    return "Deskripsi minimal 10 karakter.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Kategori ===
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Kategori Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                value: _category,
                items: _categories
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _category = value!),
              ),
              const SizedBox(height: 12),

              // === Thumbnail ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL Gambar Produk (opsional)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
                validator: (value) {
                  if (value != null && value.isNotEmpty && !_isValidURL(value)) {
                    return "Masukkan URL yang valid";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === Produk Tersedia ===
              SwitchListTile(
                title: const Text("Produk Tersedia"),
                value: _isAvailable,
                onChanged: (value) =>
                    setState(() => _isAvailable = value),
              ),
              const SizedBox(height: 16),

              // === Tombol Simpan ===
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:
                              const Text('Produk Berhasil Disimpan!'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text('Nama: $_name'),
                                Text('Harga: Rp$_price'),
                                Text('Deskripsi: $_description'),
                                Text('Kategori: $_category'),
                                Text('Thumbnail: $_thumbnail'),
                                Text(
                                    'Tersedia: ${_isAvailable ? "Ya" : "Tidak"}'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
