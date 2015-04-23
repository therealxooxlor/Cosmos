@echo off
:SOF
@REM Delete so if builder fails it wont exist
del source\Cosmos.Build.Builder\bin\Debug\Cosmos.Build.Builder.*

%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe "source\Builder.sln" /nologo /maxcpucount /p:Configuration=Debug /p:Platform=x86

@if not exist source\Cosmos.Build.Builder\bin\Debug\Cosmos.Build.Builder.exe goto error

start source\Cosmos.Build.Builder\bin\Debug\Cosmos.Build.Builder.exe -bat %1 %2 %3 %4 %5 %6 %7 %8 %9

@exit

:Error
@echo _
@echo _
@echo Something went wrong.
echo Retry?
set /p %retry%=Y/n: 
if %retry% == Y goto :SOF
if %retry% == n goto :EOF
