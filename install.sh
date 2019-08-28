#############################################
# Magisk Module Installer Script
#############################################

#############################################
# Config Flags
#############################################

SKIPMOUNT=false

PROPFILE=true

POSTFSDATA=false

LATESTARTSERVICE=true

#############################################
# Replace list
#############################################

REPLACE="
"

print_modname() {
  ui_print "*******************************"
  ui_print "     UncensoredDNS4Magisk      "
  ui_print "             v1.0              "
  ui_print "        By Strappazzon         "
  ui_print "*******************************"
}

on_install() {
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}

mount /system 2>/dev/null
	
if [ -a /system/etc/resolv.conf ]; then
  mkdir -p $TMPDIR/system/etc/
  printf "nameserver 89.233.43.71\nnameserver 91.239.100.100" >> $TMPDIR/system/etc/resolv.conf
  touch $TMPDIR/auto_mount
fi
