# OSX86-T470

This repo maintains lost of dsl file disassebled from **ACPI Machine Language Binary File**.

For lenovo-t470, many files need be patched. For example, dual battery BAT0 and
BAT1.

This repo have origin acpi files including dsdt/ssdts, of cause the patched
file will appear in patched folder. For addons and plugins will be added in the
future perhaps.

DSDT patched list:

1. duplicate RTKB was removed (compile fix)

1. BAT0._STA/BAT1._STA has inserted "Return 0" for combining them to BATC which
   defined in BATTCD hotpatch

1. BAT0/BAT1._BIX has been renamed to XBIX

