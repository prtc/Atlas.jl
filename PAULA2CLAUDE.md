We finished phases 1-4 in half the allocated time and half allocated budget.

Let's use the remaining credit to start a streamlined version of the migration. Upon reading your migration assessments, let's invert the logic that was before (ATALS12 first) to see what we can do with SYNTHE which is simpler -> SYNTHE first.

I noticed a possible confusion. SYNTHE is both the name of a single code (synthe.for) and how we refer to the whole pipeline of producing the synthetic spectrum.

I do not see the explicit reference for synthe.for code in file docs/archaeology/ARCHITECTURE_INSIGHTS.md, nor is there a deep dive on it. The code is at upstream/castelli/source_codes/synthe/synthe.for 

As per Fiorella Castelli instructions, SYNTHE suite is compiled with:

 xnfpelsyn.for    
 atlas7v.for    
compile: gfortran -fno-automatic -w -O3 -c xnfpelsyn.for
         gfortran -fno-automatic -w -O3 -c atlas7v.for
         gfortran xnfpelsyn.o atlas7v.o -o xnfpelsyn.exe

 synbeg.for    
compile: gfortran -fno-automatic -w -O3 -o synbeg.exe synbeg.for

 rgfalllinesnew.for    
compile: gfortran -fno-automatic -w -O3 -o rgfalllinesnew.exe rgfallinesnew.for

 rpredict.for   
compile: gfortran -fno-automatic -w -O3 -o rpredict.exe rpredict.for


 rmolecasc.for    
compile: gfortran -fno-automatic -w -O3 -o rmolecasc.exe rmolecasc.for

 rschwenk.for    
compile: gfortran -fno-automatic -w -O3 -o rschwenk.exe rschwenk.for

 rh2ofast.for    
compile: gfortran -fno-automatic -w -O3 -o rh2ofast.exe rh2ofast.for


synthe.for   
compile: gfortran -fno-automatic -w -O3 -o synthe.exe synthe.for


 spectrv.for    
 atlas7v.for    
compile: gfortran -fno-automatic -w -O3 -c spectrv.for
         gfortran -fno-automatic -w -O3 -c atlas7v.for
         gfortran spectrv.o atlas7v.o -o spectrv.exe

 rotate.for   
compile: gfortran -fno-automatic -w -O3 -o rotate.exe rotate.for

 broaden.for    
compile: gfortran -fno-automatic -w -O3 -o broaden.exe broaden.for

 converfsynnmtoa.for   
compile: gfortran -fno-automatic -w -O3 -o converfsynnmtoa.exe converfsynnmtoa.for

 fluxaverage1a_nmtoa.for   
compile: gfortran -fno-automatic -w -O3 -o fluxaverage1a_nmtoa.exe fluxaverage1a_nmtoa.for


Please evaluate if:

- Do we need a deep dive in synthe.for or is it indeed simple enough that a deep dive is not needed?
- xnfpelsyn.for and spectrv.for are linked with atlas7v.for. We have deep dives for ATLAS12 but not for atlas7v.for. There are differences that will affect us, read file docs/archaeology/ATLAS12_VS_ATLAS7V_COMPARISON.md
