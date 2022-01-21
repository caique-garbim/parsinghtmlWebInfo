#
# Parsing HTML WebInfo - PowerShell
#
# use o powershell:
# ~ powershell ./parsing_html_webinfo.ps1 https://site.com.br
#
param($p1)

if (!$p1) {
    cls
    echo " "
    echo "+--------------------------------------------+"
    echo "|                PARSING HTML                |"
    echo "|            Digite a URL do site:           |"
    echo "| .\parsing_html_webinfo https://site.com.br |"
    echo "+--------------------------------------------+"
    echo " "
    pause
    exit
} else {
    cls
    echo "----------------------------------------------"
    echo " VARRENDO O SITE: $p1"
    echo "----------------------------------------------"
    echo " "
    
    try {$web = Invoke-WebRequest -uri $p1 -Method Options
    } catch {}
    echo "----------------------------------------------"
    echo " [*] O servidor roda:"
    $web.headers.server
    echo " "
    echo "----------------------------------------------"
    echo " [*] O servidor aceita os seguintes métodos:"
    $web.headers.allow
    echo " "
    echo "----------------------------------------------"
    echo " [*] Links encontrados:"
    (Invoke-WebRequest -uri $p1).links.href | Select-String "//"
    echo " "
    pause
    exit
}
