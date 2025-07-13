
San Diego Supercomputer Center grid for 2 km/s microturbulent velocity

THE USER SHOULD BE AWARE THAT ERRORS ARE POSSIBLE.  This is a summary of
errors in earlier versions that were distributed on tape.

27 MARCH 1992 PRELIMINARY    COLORS MAY CHANGE

There are corrections to errors in the version of 19 Jan 92 found by 
Fiorella Castelli plus the addition of [-4.0],[-4.5], and [-5.0].
     ap03t5500g45k2c125 was missing
     ap03t5500g50k2c125 was duplicated
     am10t3500g50k2c125 was duplicated
     am30t4000g50k2c125 was the wrong model and has been deleted
     am30t5250g00k2c125 was duplicated and has been replaced
     am30t5250g05k2c125 was the wrong model
     am30t5750g40k2c125 was the wrong model
     am35t5250g25k2c125 was the wrong model
     am35t5250g30k2c125 was duplicated
     am35t8250g15k2c125 was the wrong model and has been deleted

     The low temperature, high gravity, lowest abundance corner of the grid 
could not be computed because the models would not converge or scale.  I will
someday learn how to make them.  Low gravity, low temperature, low abundance
models sometimes have ripples near the surface.  I think it is because of
unstable numerical cancellation between the infrared and ultraviolet
contributions to the flux derivative.  All the models are forced to be
monotonic decreasing in T.  I think that the ripples are not physical and
that they can be smoothed out if they are aesthetically unpleasing.  Low
abundance, early-type models tend to want a temperature rise at the surface.
I do not yet know if this is physically correct (in LTE, plane-parallel) or
a numerical artifact.  The temperature is not allowed to rise in these 
models.


29 JULY 1992   [+1.0] CORRECTED

There was a tape mixup in producing the files BDFP10LIT which are the line
opacities used to compute the flux.  The fluxes between 91 and 364 nm are
bad for the [+1.0] models.  So are the colors and limb-darkening.  The
models themselves and the Balmer lines profiles were not affected.  The
fluxes and colors on this tape have been corrected.  Please let me know
if you need new distribution function or limb-darkening tapes.


7 OCTOBER 1992 [+1.0], [+0.0], [-0.3], SUN CORRECTED

Fiorella Castelli found additional errors in [+1.0] that required 
recomputing all the models, fluxes, Balmer lines, and colors.  John Lester 
found errors in the [+0.0] and the [-0.3] fluxes that required recomputing 
the fluxes and colors but not the models.  And also the solar model.  The 
total flux errors in the models were small, in the sun 0.14%, so the models 
were not recomputed.  New distribution function and Rosseland opacities and
new limbdarkening tapes are available for [+1.0], [+0.0], and [-0.3].   I 
have ordered hardware for making CD-ROMs.  I hope that they will be available 
in November.


4 DECEMBER 1992 BALMER LINE PROFILES CORRECTED

Mercedes Richards found that some Balmer line profiles showed structure in
the line cores that was not physical.  It turned out that the lowest electron
density at which the profiles were tabulated was 1.E10 and that the program 
was extrapolating off the table.  The program was changed to scale the
profile from 1.E10 to lower densities.  The profiles now have line centers
similar to those predicted by SYNTHE which uses a completely independent
formulation.  Vega and the sun are not affected at all.  Deane Peterson also 
warns that the profiles are tabulated for 0 km/s microturbulent velocity 
regardless of the model.  The error is insignificant at 2 km/s because of the 
large thermal width, but for 8 km/s it may matter.  The hardware for making
CD-ROMs has arrived but is not yet working.


25 JANUARY 1993 [+0.0] CORRECTED, VILNIUS AND HBETA COLORS ADDED 

Vytas Straizys found errors in the fluxes at low temperatures for [+0.0]
so all the convective [+0.0] models were recomputed, including the sun.
The current version of ATLAS9 has been improved considerably by Fiorella
Castelli and myself with changes to the radiation calculation and to the
temperature correction.  Also in cool stars many wavelengths were optically
thick at the first or second depth in the atmosphere so that the radiation
calculation was highly uncertain.  To reduce this problem all new models 
have been computed with 72 depths starting at 1.e-7 instead of 64 at 1.e-6.
This also reduces the temperature drop at the surface and makes the models
easier to converge.  ATLAS9 users may wish to get the improved version.
The Vilnius photometry given here is preliminary.  Straizys is analyzing it.  
The H beta photometry is also preliminary.  Castelli and I are working on 
it.  The hardware for making CD-ROMs is still not working. 



