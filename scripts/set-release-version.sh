#!/bin/bash
set -e

# Extract semantic version template from Core PCL project.
currentVersion=`grep AssemblyInformationalVersion Microsoft.Sonoma.Core/Properties/AssemblyInfo.cs | sed -E "s/^.*\"(.*)\".*$/\1/"`

# Remove pre-release
officialVersion=`sed -E 's/(.*)-.*/\1/' <<< "$currentVersion"`

# Replace version in all the assemblies
find . -name AssemblyInfo.cs | xargs sed -E -i '' "s/(AssemblyInformationalVersion\(\")(.*)\"\)/\1$officialVersion\")/g"
