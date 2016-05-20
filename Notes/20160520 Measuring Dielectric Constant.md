To measure the dielectric constant of a novel spin-on material, here is a general note on ideals to implement it.

# Low frequency
LRC circuit. Use the resonance to find the capacitance.
# VSWR
the freq difference between two `S11` dips is $\Delta f$, then the length is related via

$L=c/(2\sqrt{\varepsilon_r}\Delta f)$
#Ring resonator
The coupled ring resonator gives the resonant freq, which gives $\varepsilon_{eff}$
#Group delay
the definition of a group delay: $t_g=$d $\phi/$d $f$

VNA measures a difference quotient rather than a differential quotient, which yields an approximation. In a specific frequency range, which is called `aperture` $\Delta f$

The aperture should be in accordance with

* accuracy
* frequency variation 

#ref

https://cdn.rohde-schwarz.com/pws/dl_downloads/dl_application/application_notes/1ez35/1ez35_1e.pdf

http://www.microwaves101.com/encyclopedias/measuring-dielectric-constant
