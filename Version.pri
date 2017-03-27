# Author: KangLin(Email:kl222@126.com)

#TODO:发行版本时，需要修改下列值  
MAJOR_VERSION_NUMBER=0
MINOR_VERSION_NUMBER=0
REVISION_VERSION_NUMBER=6

BUILD_VERSION=$$system(git rev-parse --short HEAD)
isEmpty(BUILD_VERSION){
    BUILD_VERSION=0
}

VERSION_NUMBER_STRING="$${MAJOR_VERSION_NUMBER}.$${MINOR_VERSION_NUMBER}.$${REVISION_VERSION_NUMBER}.$${BUILD_VERSION}"

message($$VERSION_NUMBER_STRING)

#生成的版本头文件  
FILENAME=$$PWD/Version.h
#版本模板文件  
TEMPLATE_FILENAME=$$PWD/Version.h.template

RABBITGIS_VERSION_CONTENTS=$$cat($$TEMPLATE_FILENAME, blob)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%MAJOR_VERSION_NUMBER%", $$MAJOR_VERSION_NUMBER)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%MINOR_VERSION_NUMBER%", $$MINOR_VERSION_NUMBER)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%REVISION_VERSION_NUMBER%", $$REVISION_VERSION_NUMBER)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%BUILD_VERSION%", $$BUILD_VERSION)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%RABBITGIS_SYSTEM%", $$RABBITGIS_SYSTEM)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%RABBITGIS_PLATFORM%", $$RABBITGIS_PLATFORM)
RABBITGIS_VERSION_CONTENTS=$$replace(RABBITGIS_VERSION_CONTENTS, "%RABBITGIS_ARCHITECTURE%", $$RABBITGIS_ARCHITECTURE)
write_file($$FILENAME, RABBITGIS_VERSION_CONTENTS)
