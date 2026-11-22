    import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _thumbnailController = TextEditingController();
  final _startedAtController = TextEditingController();
  final _endedAtController = TextEditingController();

  String _category = 'S1';
  DateTime? _startedAt;
  DateTime? _endedAt;

  final List<String> _categories = [
    'SD',
    'SMP',
    'SMA/SMK',
    'D1',
    'D2',
    'D3',
    'D4',
    'S1',
    'S2',
    'S3',
    'Lainnya',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    _startedAtController.dispose();
    _endedAtController.dispose();
    super.dispose();
  }

  String _formatDateForField(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  String _formatDateForData(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  Future<void> _selectDate({required bool isStartDate}) async {
    final currentValue = isStartDate ? _startedAt : _endedAt;
    final initialDate =
        currentValue ?? _startedAt ?? _endedAt ?? DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: isStartDate ? 'Pilih tanggal mulai' : 'Pilih tanggal akhir',
    );

    if (pickedDate == null) return;

    setState(() {
      if (isStartDate) {
        _startedAt = pickedDate;
        _startedAtController.text = _formatDateForField(pickedDate);
      } else {
        _endedAt = pickedDate;
        _endedAtController.text = _formatDateForField(pickedDate);
      }
    });
  }

  String? _validateThumbnailUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL gambar pendidikan wajib diisi.';
    }

    final uri = Uri.tryParse(value.trim());
    if (uri == null ||
        (uri.scheme != 'http' && uri.scheme != 'https') ||
        uri.host.isEmpty) {
      return 'Masukkan URL gambar yang valid (http atau https).';
    }

    return null;
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final education = <String, String>{
      'title': _titleController.text.trim(),
      'description': _descriptionController.text.trim(),
      'category': _category,
      'thumbnail': _thumbnailController.text.trim(),
      'started_at': _formatDateForData(_startedAt!),
      'ended_at': _formatDateForData(_endedAt!),
    };

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Data Pendidikan'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: education.entries
                .map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('${entry.key}: ${entry.value}'),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pendidikan'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pendidikan',
                  hintText: 'Contoh: S1 Ilmu Komputer',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama pendidikan wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Pendidikan',
                  hintText: 'Ceritakan pendidikan atau pengalaman belajarmu',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                minLines: 3,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Deskripsi pendidikan wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(
                  labelText: 'Jenjang Pendidikan',
                  border: OutlineInputBorder(),
                ),
                items: _categories
                    .map(
                      (category) => DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _category = value);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(
                  labelText: 'URL Gambar Pendidikan',
                  hintText: 'https://contoh.com/gambar.jpg',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                validator: _validateThumbnailUrl,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _startedAtController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tanggal mulai',
                  hintText: 'Pilih tanggal mulai',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(isStartDate: true),
                validator: (_) {
                  if (_startedAt == null) {
                    return 'Tanggal mulai wajib dipilih.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _endedAtController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tanggal akhir',
                  hintText: 'Pilih tanggal akhir',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(isStartDate: false),
                validator: (_) {
                  if (_endedAt == null) {
                    return 'Tanggal akhir wajib dipilih.';
                  }
                  if (_startedAt != null && _endedAt!.isBefore(_startedAt!)) {
                    return 'Tanggal akhir tidak boleh sebelum tanggal mulai.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.save),
                label: const Text('Simpan Pendidikan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
