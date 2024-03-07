#!/bin/bash
set -e

sed -i 's/-Xms.*/-Xms512m/' /opt/idea/bin/idea64.vmoptions
sed -i 's/-Xmx.*/-Xmx4g/'   /opt/idea/bin/idea64.vmoptions
sed -i 's/-XX:ReservedCodeCacheSize=.*/-XX:ReservedCodeCacheSize=512m/' /opt/idea/bin/idea64.vmoptions

sed -i 's/-Xms.*/-Xms512m/' /opt/android/android-studio/bin/studio64.vmoptions
sed -i 's/-Xmx.*/-Xmx4g/'   /opt/android/android-studio/bin/studio64.vmoptions
sed -i 's/-XX:ReservedCodeCacheSize=.*/-XX:ReservedCodeCacheSize=512m/' /opt/android/android-studio/bin/studio64.vmoptions



