#!/bin/bash
echo "Start running script: \"$0\"";
xcrun simctl list devices |
    grep "(Booted)" | 
    grep -E -o -i "([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})" | 
    while read -r device; do 
        open $(xcrun simctl get_app_container "$device" "$PRODUCT_BUNDLE_IDENTIFIER" data)/Documents; 
    done
