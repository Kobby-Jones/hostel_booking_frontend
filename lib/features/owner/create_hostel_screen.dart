// ignore_for_file: deprecated_member_use

import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:image_picker/image_picker.dart";
import "package:go_router/go_router.dart";
import "../../ui/tokens/spacing.dart";
import "../../ui/primitives/app_button.dart";
import "../../services/hostel_service.dart";
import "../../services/image_service.dart";

class CreateHostelScreen extends StatefulWidget {
  const CreateHostelScreen({super.key});

  @override
  State<CreateHostelScreen> createState() => _CreateHostelScreenState();
}

class _CreateHostelScreenState extends State<CreateHostelScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<XFile> _selectedImages = [];
  bool _isSubmitting = false;
  double _uploadProgress = 0;

  Future<void> _pickImages() async {
    final images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) setState(() => _selectedImages.addAll(images));
  }

  Future<void> _handleSubmit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;
    if (_selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please add at least one image")));
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final formData = _formKey.currentState!.value;
      // 1. Create Hostel Record
      final hostelId = await HostelService().createHostel({
        ...formData,
        "amenities": (formData["amenities"] as String).split(",").map((e) => e.trim()).toList(),
      });

      // 2. Handle Multi-Image Upload
      final imgService = ImageService();
      for (int i = 0; i < _selectedImages.length; i++) {
        setState(() => _uploadProgress = (i + 1) / _selectedImages.length);
        
        final file = File(_selectedImages[i].path);
        final presigned = await imgService.getPresignedUrl(
          fileName: _selectedImages[i].name,
          fileType: "image/jpeg",
          hostelId: hostelId,
        );

        await imgService.uploadToCloud(presigned["uploadUrl"], file, "image/jpeg");
        await imgService.saveMetadata(url: presigned["fileUrl"], key: presigned["key"], hostelId: hostelId);
      }

      if (mounted) context.pop();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Your Hostel")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("BASIC INFORMATION"),
              const SizedBox(height: 16),
              _buildField("name", "Hostel Name", Icons.business_rounded, [FormBuilderValidators.required()]),
              _buildField("description", "Detailed Description", Icons.description_rounded, [FormBuilderValidators.required(), FormBuilderValidators.minLength(10)]),
              
              const SizedBox(height: 32),
              _buildSectionHeader("LOCATION & CONTACT"),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(child: _buildField("city", "City", Icons.location_city, [FormBuilderValidators.required()])),
                const SizedBox(width: 12),
                Expanded(child: _buildField("state", "State", Icons.map, [FormBuilderValidators.required()])),
              ]),
              _buildField("address", "Full Address", Icons.place, [FormBuilderValidators.required()]),
              _buildField("contactPhone", "Phone Number", Icons.phone, [FormBuilderValidators.required(), FormBuilderValidators.minLength(10)]),
              
              const SizedBox(height: 32),
              _buildSectionHeader("AMENITIES"),
              const SizedBox(height: 16),
              _buildField("amenities", "WiFi, Parking, Security (comma separated)", Icons.list_alt, [FormBuilderValidators.required()]),
              
              const SizedBox(height: 32),
              _buildSectionHeader("GALLERY"),
              const SizedBox(height: 16),
              _buildImagePicker(),

              const SizedBox(height: 48),
              if (_isSubmitting)
                Column(children: [
                  LinearProgressIndicator(value: _uploadProgress, borderRadius: BorderRadius.circular(10), minHeight: 8, color: const Color(0xFF0D9488)),
                  const SizedBox(height: 12),
                  const Text("Uploading your property details and images...", style: TextStyle(fontWeight: FontWeight.w600)),
                ])
              else
                AppButton(label: "Create Hostel Listing", onPressed: _handleSubmit),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.teal, letterSpacing: 1.5));
  }

  Widget _buildField(String name, String label, IconData icon, List<String? Function(dynamic)> validators) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, size: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade200)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade200)),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
        validator: FormBuilderValidators.compose(validators),
      ),
    );
  }

  Widget _buildImagePicker() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _selectedImages.length + 1,
        itemBuilder: (context, index) {
          if (index == _selectedImages.length) {
            return GestureDetector(
              onTap: _pickImages,
              child: Container(
                width: 100,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.teal.withOpacity(0.3), style: BorderStyle.none)),
                child: const Icon(Icons.add_a_photo_outlined, color: Colors.teal),
              ),
            );
          }
          return Container(
            width: 100,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: FileImage(File(_selectedImages[index].path)), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}