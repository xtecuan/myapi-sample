@echo on


 mvnw clean compile -DskipTests=true -Dquarkus-profile=dev -Ddebug=6007 quarkus:dev
