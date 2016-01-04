
replaceVariableInFile () {
    sed -e s/$1/$2/g -i "" $3
}

replaceVariableInFiles () {
    replaceVariableInFile $1 $2 "./README.md"
    replaceVariableInFile $1 $2 "./pom.xml"
    replaceVariableInFile $1 $2 "./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME/subsystem/Module.java"
    replaceVariableInFile $1 $2 "./src/test/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME/subsystem/ModuleTest.java"
}

read -p "Enter project name: " PROJECT_NAME
replaceVariableInFiles "PROJECT_NAME" "${PROJECT_NAME}"

read -p "Enter short description: " PROJECT_SHORT_DESCRIPTION
replaceVariableInFiles "PROJECT_SHORT_DESCRIPTION" "${PROJECT_SHORT_DESCRIPTION}"

read -p "Enter author name: " PROJECT_AUTHOR
replaceVariableInFiles "PROJECT_AUTHOR" "${PROJECT_AUTHOR}"

read -p "Enter contact email: " PROJECT_CONTACT_EMAIL
replaceVariableInFiles "PROJECT_CONTACT_EMAIL" "${PROJECT_CONTACT_EMAIL}"

read -p "Enter copyright year: " PROJECT_COPY_YEAR
replaceVariableInFiles "PROJECT_COPY_YEAR" "${PROJECT_COPY_YEAR}"

read -p "Enter TLD: " PROJECT_TLD
replaceVariableInFiles "PROJECT_TLD" "${PROJECT_TLD}"

read -p "Enter Domain: " PROJECT_DOMAIN
replaceVariableInFiles "PROJECT_DOMAIN" "${PROJECT_DOMAIN}"

mv ./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME ./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/${PROJECT_NAME}
mv ./src/main/java/PROJECT_TLD/PROJECT_DOMAIN ./src/main/java/PROJECT_TLD/${PROJECT_DOMAIN}
mv ./src/main/java/PROJECT_TLD ./src/main/java/${PROJECT_TLD}
