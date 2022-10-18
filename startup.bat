
for /F %%I in ('dir /b /o:-d build\libs\*.war') do ( set file=%%I & goto :end )

:end

copy build\libs\%file% C:\workset\bin\apache-tomcat-9.0.36-netminer\webapps\%file%

cd C:\workset\bin\apache-tomcat-9.0.36-netminer\bin
startup.bat

pause