#!/usr/bin/env lua

function replaceVariableInFile(pattern, substitution, filepath)
    local file = io.open(filepath)
    local contents = file:read("*a")
    file:close()

    contents = contents:gsub(pattern, substitution)

    file = io.open(filepath, "w")
    file:write(contents)
    file:close()
end

function replaceVariableInFiles(pattern, substitution)
    replaceVariableInFile(pattern, substitution, "./README.md")
    replaceVariableInFile(pattern, substitution, "./pom.xml")
    replaceVariableInFile(pattern, substitution, "./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME/subsystem/Module.java")
    replaceVariableInFile(pattern, substitution, "./src/test/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME/subsystem/ModuleTest.java")
end

io.write("Enter project name: ")
local PROJECT_NAME = io.read()
replaceVariableInFiles("PROJECT_NAME", PROJECT_NAME)

io.write("Enter short description: ")
local PROJECT_SHORT_DESCRIPTION = io.read()
replaceVariableInFiles("PROJECT_SHORT_DESCRIPTION", PROJECT_SHORT_DESCRIPTION)

io.write("Enter author name: ")
local PROJECT_AUTHOR = io.read()
replaceVariableInFiles("PROJECT_AUTHOR", PROJECT_AUTHOR)

io.write("Enter contact email: ")
local PROJECT_CONTACT_EMAIL = io.read()
replaceVariableInFiles("PROJECT_CONTACT_EMAIL", PROJECT_CONTACT_EMAIL)

io.write("Enter copyright year: ")
local PROJECT_COPY_YEAR = io.read()
replaceVariableInFiles("PROJECT_COPY_YEAR", PROJECT_COPY_YEAR)

io.write("Enter TLD: ")
local PROJECT_TLD = io.read()
replaceVariableInFiles("PROJECT_TLD", PROJECT_TLD)

io.write("Enter Domain: ")
local PROJECT_DOMAIN = io.read()
replaceVariableInFiles("PROJECT_DOMAIN", PROJECT_DOMAIN)

os.rename("./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME", "./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/" .. PROJECT_NAME)
os.rename("./src/main/java/PROJECT_TLD/PROJECT_DOMAIN", "./src/main/java/PROJECT_TLD/" .. PROJECT_DOMAIN)
os.rename("./src/main/java/PROJECT_TLD", "./src/main/java/" .. PROJECT_TLD)

os.rename("./src/test/java/PROJECT_TLD/PROJECT_DOMAIN/PROJECT_NAME", "./src/main/java/PROJECT_TLD/PROJECT_DOMAIN/" .. PROJECT_NAME)
os.rename("./src/test/java/PROJECT_TLD/PROJECT_DOMAIN", "./src/main/java/PROJECT_TLD/" .. PROJECT_DOMAIN)
os.rename("./src/test/java/PROJECT_TLD", "./src/main/java/" .. PROJECT_TLD)
