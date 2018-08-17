#mysql -u root -pinfosupport unittests_all -e "drop database unittests_all;"
#mysql -u root -pinfosupport unittests_all -e "create database unittests_all;"
#mysql -u root -pinfosupport unittests_all < unittest.structure.sql
#mysql -u root -pinfosupport unittests_all -e "INSERT INTO unittests_all.registration (SELECT NULL as id, NULL as test_method_id, method_class, method_name, unit_test_method_class, unit_test_method_name, unit_test_code, unit_test_code_sbt, method_code, method_code_sbt FROM unittests.registration WHERE method_code IS NOT NULL AND unit_test_code IS NOT NULL);"
mysql -u root -pinfosupport unittests_all -e "INSERT INTO unittests_all.registration (SELECT NULL as id, NULL as test_method_id, method_class, method_name, unit_test_method_class, unit_test_method_name, unit_test_code, unit_test_code_sbt, method_code, method_code_sbt FROM unittests_ast.registration ar WHERE method_code IS NOT NULL AND unit_test_code IS NOT NULL AND 0 = (SELECT count(*) FROM unittests_all.registration WHERE method_code = ar.method_code AND unit_test_code = ar.unit_test_code));"