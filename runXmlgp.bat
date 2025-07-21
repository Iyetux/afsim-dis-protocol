@echo off
setlocal enabledelayedexpansion

set "SCHEMA=%~1"
if "%SCHEMA%"=="" (
    echo Usage: %0 schema.xml
    exit /b 1
)

for %%L in (java cpp python javascript objc csharp) do (
    set "LANG=%%L"
    set "OUTDIR=target\generated-sources\%%L"
    echo === Generating %%L ===

    cmd /v:on /c mvn exec:java -Dexec.mainClass=edu.nps.moves.xmlpg.Xmlpg -Dxmlpg.generatedSourceDir="!OUTDIR!" -Dexec.args="%~1 !LANG!"
)

@rem run command；runXmlgp.bat DIS2012.xml java