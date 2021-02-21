import 'package:finanzas_personales/app/modules/category/models/category_models.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoryController extends GetxController {
  final appData = GetStorage();

  final List<CategoryModel> category = [
    CategoryModel(
      id: '1',
      name: 'Vestimenta',
      limiteGasto: 90,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '2',
      name: 'Comida',
      limiteGasto: 80,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '3',
      name: 'Vivienda',
      limiteGasto: 60,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
    CategoryModel(
      id: '4',
      name: 'Salud',
      limiteGasto: 96,
      tipo: 'ingreso',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
