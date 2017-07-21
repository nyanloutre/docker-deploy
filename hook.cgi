#!/bin/sh

echo "Content-type: text/html"
echo ""
echo "  <!doctype html>

        <html lang=\"en\">
        <head>
            <meta charset=\"utf-8\">
        </head>
        <body>
            <h1>Mise à jour conteneurs</h1>
            <pre>"

sudo /opt/site_max.sh

echo "      </pre>
        </body>
        </html>"

exit 0
