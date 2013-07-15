#!/bin/bash
DATE="$(date +%Y/%m/%d)"
RUTA="cd /tmp/ramdisk1G/ljzac.github.io/_posts"
${RUTA}; mkdir -m 777 -p ${DATE};
${RUTA}; touch ./${DATE}/README; echo "Manual en proceso de creación, gracias por tu comprensión. Cualquier error o sugerencia favor de mandar correo a soporte@twcenter.zendesk.mx" >> ./${DATE}/README;
${RUTA}/../; git add .; git commit -am 'Creando carpeta del '${DATE};git pull; git push;
echo "Carpeta creada: ${DATE}" >> /tmp/logCarpetas.log

