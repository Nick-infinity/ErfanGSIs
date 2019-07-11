#/bin/bash

LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
apppath=$1

find $apppath/res/ -type f -exec sed -i 's/@android/@*android/g' {} +
sed -i 's/<bool name="config_has_rounded_corner">true/<bool name="config_has_rounded_corner">false/' $apppath/res/values/bools.xml
echo "Adding tissot stuff"
rm -rf $apppath/res/xml/power_profile.xml && cp -r $LOCALDIR/MiA1/xml/power_profile.xml $apppath/res/xml/power_profile.xml
rm -rf $apppath/res/xml/power_profile.xml && cp -r $LOCALDIR/MiA1/xml/power_profile_test.xml $apppath/res/xml/power_profile_test.xml
echo "Added power profiles for tissot"
sed -i "6i <bool name="config_ignoreRssnrSignalLevel">true</bool>" $apppath/res/values/bools.xml
sed -i "6i <integer name="config_deviceHardwareKeys">83</integer>" $apppath/res/values/integers.xml
echo "Added configs for tissot"
