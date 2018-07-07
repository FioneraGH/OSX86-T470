# OSX86-T470

This repo maintains lost of dsl file disassebled from **ACPI Machine Language Binary File**.

For lenovo-t470, many files need be patched. For example, dual battery BAT0 and
BAT1.

This repo have origin acpi files including dsdt/ssdts, of cause the patched
file will appear in patched folder. For addons and plugins will be added in the
future perhaps.

DSDT patched list:

1. patch XHC.PMEE = 0 when S5 for shutdown trigger restart

1. Fix _WAK Arg0 v2 & USB3 _PWR for instant wake

1. _PRW rewrited, not invoke GPRW

