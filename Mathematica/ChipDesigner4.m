(* ::Package:: *)

BeginPackage["ChipDesigner4`"];

Initialize::usage = "ChipDesigner4@Initialize[] ";
Clear[Initialize]
AimedIonHeight::usage="xxx";
\[CapitalOmega]::usage="XXX";
\[Psi]::usage="XXX";
zh::usage="XXX";
wgnd::usage="XXX";
wrf::usage="XXX";
xShift::usage="xx";
zEscape::usage="XXX";
rfPotentialPack::usage="XXX";
TotalPotentialPack::usage="XXX";
DeriveTPXpack::usage="xxx";
DeriveTPZpack::usage="xxx";
zRootPack::usage="xxx";
zEscapeRootPack::usage="xxx";
HessianMatrixPack::usage="xxx";
EVecPack::usage="xxx";
EigenValuePack::usage="xxx";
SecFreqPack::usage="XXX";
QparaXpack::usage="XXX";
MaxEscapeArrPack::usage="xx";
MaxEscapePack::usage="xx";
Drev1Pack::usage="xxx";
InhomoPack::usage="XXX";
InhomothetaPack::usage="XXX";
zInhomoPack::usage="XXX";
ShowTrapDepth::usage = "Returns the trap depth.";
ShowQ::usage = "Returns Q parameter. For corrected (with mapping to the homogenous trap), use ShowCorrectedQ.";
ShowSecFreq::usage = "Returns secular frequency.";
ShowInhomo::usage = "Returns the inhomogenity factor.";
ShowCorrectedQ::usage = "Returns the corrected Q.";
xRootPack::usage="XXX";
zRootPack::usage="XXX";
zEscapeRootPack::usage="XXX";
zEscape::usage="XXX";
ShowAll::usage="XXX";
e::usage="xx";
Altaf::usage="xx";
Vrf::usage="";
mYb::usage="";
xp::usage="";
ComputePack::usage="";
ShowInhomoTheta::usage="";
Asym::usage=""

Clear[ShowInhomoTheta]
Clear[ShowAll]
Clear[rfPotentialPack]
Clear[TotalPotentialPack]
Clear[DeriveTPXpack]
Clear[DeriveTPZpack]
Clear[zRootPack]
Clear[HessianMatrixPack]
Clear[EVecPack]
Clear[EigenValuePack]
Clear[SecFreqPack]
Clear[QparaXpack]
Clear[MaxEscapePack]
Clear[MaxEscapeArrPack]
Clear[Drev1Pack]
Clear[InhomoPack]
Clear[zInhomoPack]
Clear[InhomothetaPack]
Clear[Initialize]
Clear[ComputeAn]
Clear[ShowQ]
Clear[ShowTrapDepth]
Clear[ShowSecFreq]
Clear[ShowCorrectedQ]
Clear[ShowInhomo]
Clear[ShowTD]

Clear[ShowRF]
(*REFERENCE: NIntegrateUtilities*)

(*
""
*)

Begin["`Private`"];
Initialize[AIH_,\[CapitalOmega]in_,Vrfin_]:=
( 
AimedIonHeight=AIH*10^-6;
\[CapitalOmega]=\[CapitalOmega]in*2\[Pi]*10^6;
Vrf=Vrfin;
e = 1.6 10^-19;
mYb = 171 1.66 10^-27; 
Altaf=1.5;
\[Psi]=e^2/(4 mYb \[CapitalOmega]^2);
xp=0*10^(-6);(*x koord search position*)
wgnd=Sqrt[(4 AimedIonHeight^2)/(1/Altaf^2+2/Altaf)]/Altaf;
wrf=Altaf*wgnd;
xShift=wgnd/2;
zEscape=Sqrt[2 wgnd wrf+wgnd^2+2(wrf+wgnd)Sqrt[2wgnd wrf+wgnd^2]]/2;
Asym=1;
)

Initialize[AIH_,\[CapitalOmega]in_,Vrfin_,Af_]:=
( 
AimedIonHeight=AIH*10^-6;
\[CapitalOmega]=\[CapitalOmega]in*2\[Pi]*10^6;
Vrf=Vrfin;
e = 1.6 10^-19;
mYb = 171 1.66 10^-27; 
Altaf=Af;
\[Psi]=e^2/(4 mYb \[CapitalOmega]^2);
xp=0*10^(-6);(*x koord search position*)
wgnd=Sqrt[(4 AimedIonHeight^2)/(1/Altaf^2+2/Altaf)]/Altaf;
wrf=Altaf*wgnd;
xShift=wgnd/2;
zEscape=Sqrt[2 wgnd wrf+wgnd^2+2(wrf+wgnd)Sqrt[2wgnd wrf+wgnd^2]]/2;
Asym=1;
)

Initialize[AIH_,\[CapitalOmega]in_,Vrfin_,Af_,asy_]:=
( 
AimedIonHeight=AIH*10^-6;
\[CapitalOmega]=\[CapitalOmega]in*2\[Pi]*10^6;
Vrf=Vrfin;
e = 1.6 10^-19;
mYb = 171 1.66 10^-27; 
Altaf=Af;
\[Psi]=e^2/(4 mYb \[CapitalOmega]^2);
xp=0*10^(-6);(*x koord search position*)
wgnd=Sqrt[(4 AimedIonHeight^2)/(1/Altaf^2+2/Altaf)]/Altaf;
wrf=Altaf*wgnd;
xShift=wgnd/2;
zEscape=Sqrt[2 wgnd wrf+wgnd^2+2(wrf+wgnd)Sqrt[2wgnd wrf+wgnd^2]]/2;
Asym=asy;
)

ComputePack[]:=(
rfPotentialPack[x_,z_]=Vrf/\[Pi](ArcTan[(wrf*Asym+wgnd-x-xShift)/z]-ArcTan[1/z(wgnd-x-xShift)]-ArcTan[(x+xShift)/z]+ArcTan[1/z(wrf+x+xShift)]);
TotalPotentialPack[x_,z_]=\[Psi](D[rfPotentialPack[x,z],x]^2+D[rfPotentialPack[x,z],z]^2);
DeriveTPXpack[x_,z_]=D[TotalPotentialPack[x,z],x];
DeriveTPZpack[x_,z_]=D[TotalPotentialPack[x,z],z];
zRootPack=z/.FindRoot[{DeriveTPXpack[x,z]==0,DeriveTPZpack[x,z]==0},{{x,0},{z,AimedIonHeight}},AccuracyGoal->3,PrecisionGoal->3];
zEscapeRootPack=z/.FindRoot[{DeriveTPXpack[x,z]==0,DeriveTPZpack[x,z]==0},{{x,0},{z,zEscape}},AccuracyGoal->3,PrecisionGoal->3];
HessianMatrixPack[x_,z_]=D[TotalPotentialPack[x,z],{{x,z},2}];
EVecPack=Eigenvectors[HessianMatrixPack[0,AimedIonHeight]];
EigenValuePack=Take[Eigenvalues[HessianMatrixPack[0,AimedIonHeight]],2];
SecFreqPack=Sqrt[EigenValuePack/mYb]/(2 \[Pi]);
QparaXpack=2Sqrt[2]*2\[Pi]*SecFreqPack[[1]]/\[CapitalOmega];
MaxEscapeArrPack=FindMaximum[{TotalPotentialPack[0,z]},{z,0.00027},Method->"Newton"];
MaxEscapePack=z/.MaxEscapeArrPack[[2]];
Drev1Pack[x_,z_]=D[rfPotentialPack[x,z],x]+D[rfPotentialPack[x,z],z];
InhomoPack[x_,z_]=(2e)/(mYb \[CapitalOmega]^2) Abs[D[Drev1Pack[x,z],{x,1}]+Abs[D[Drev1Pack[x,z],{z,1}]]];
zInhomoPack=z/.FindRoot[TotalPotentialPack[0,z]-TotalPotentialPack[0,zEscape]==0,{z,0.00012}];
InhomothetaPack=InhomoPack[0.000001,zInhomoPack]/InhomoPack[0.000001,AimedIonHeight];
)
ShowAll[]:=
(
Print["Initialized. ", "The trapping position is ",zh*1000000,"um.","The escaping position is ",zEscape*1000000,"um"]
Print["Driving frequency is ", \[CapitalOmega]/1000000, " MHz. RF voltage ",Vrf,"V"]
Print["The rf electrodes should be ", wrf*10^6, " um width, the ground ",wgnd*10^6," um width"]
Print["The actual trapping position is  ", zRootPack]
Print["The secular frequency is ", SecFreqPack]
Print["Opp. escaping position is ",MaxEscapePack]
Print["Trap depth is: ",(TotalPotentialPack[0,zEscape]-TotalPotentialPack[0,AimedIonHeight])/e]
Print["The Q parameter along x is ", QparaXpack]
Print["The inhomogenity factor is ", InhomothetaPack]
)

ShowTrapDepth[AH_,VF_,VA_,Af_]:=
(
Initialize[AH,VF,VA,Af];
ComputePack[];
(TotalPotentialPack[0,zEscape]-TotalPotentialPack[0,AimedIonHeight])/e
)
ShowTrapDepth[]:=
(
(TotalPotentialPack[0,zEscape]-TotalPotentialPack[0,AimedIonHeight])/e
)

ShowQ[]:=
(
QparaXpack
)
ShowRF[]:=
(
{\[CapitalOmega]/(2 \[Pi]),Vrf}
)
ShowSecFreq[]:=
(
SecFreqPack
)

ShowSecFreq[AH_,VF_,VA_,Af_]:=
(
Initialize[AH,VF,VA,Af];
ComputePack[];
SecFreqPack
)
ShowQ[AH_,VF_,VA_,Af_]:=
(
Initialize[AH,VF,VA,Af];
ComputePack[];
QparaXpack
)
ShowTD[AH_,VF_,VA_,Af_]:=
(
Initialize[AH,VF,VA,Af];
ComputePack[];
(TotalPotentialPack[0,zEscape]-TotalPotentialPack[0,AimedIonHeight])/e
)
ShowCorrectedQ[]:=
(
InhomothetaPack*QparaXpack
)

FindVsourceGivenSecFrq[AH_,SF_,Vmax_,Vmin_,VAmax_,VAmin_,Af_]:=
(
Initialize[AH,Vmin,VAmax,Af];
ComputePack[];
If[
SF>SecFreqPack,
(
Print["No solution"]
Return;
)]
Initialize[AH,Vmax,VAmin,Af];
ComputePack[];
If[
SF<SecFreqPack,
(
Print["No solution"]
Return;
)]
(*While[
Abs[SecFreqPack-SF]>10^6,
If[SecFreqPack>SF,

]
]*)
)

ShowInhomo[x0_,z0_,AH_,VF_,VA_,as_]:=
(
Initialize[AH,VF,VA,1.5,as];
ComputePack[];
InhomoPack[0.000001,z0]/InhomoPack[0.000001,AH*10^(-6)]
(*InhomoPack[x_,z_]=
(2e)/(mYb \[CapitalOmega]^2) Abs[D[Drev1Pack[x,z],{x,1}]+Abs[D[Drev1Pack[x,z],{z,1}]]];*)
(*Plot[InhomoPack[0.000001,z]/InhomoPack[0.000001,AH],{z,0.000001,0.00035}]*)
)
ShowInhomo[AH_,VF_,VA_,as_]:=
(
Initialize[AH,VF,VA,1.5,as];
ComputePack[];
InhomoPack[0.000001,zInhomoPack]/InhomoPack[0.000001,AH*10^(-6)]
(*InhomoPack[x_,z_]=
(2e)/(mYb \[CapitalOmega]^2) Abs[D[Drev1Pack[x,z],{x,1}]+Abs[D[Drev1Pack[x,z],{z,1}]]];*)
(*Plot[InhomoPack[0.000001,z]/InhomoPack[0.000001,AH],{z,0.000001,0.00035}]*)
)
ShowInhomoTheta[AH_,VF_,VA_]:=
(
Initialize[AH,VF,VA];
ComputePack[];
InhomoPack[0.000001,zInhomoPack]/InhomoPack[0.000001,AH*10^(-6)]
)
ShowInhomoTheta[AH_,VF_,VA_,Af_,as_]:=
(
Initialize[AH,VF,VA,Af,as];
ComputePack[];
InhomoPack[0.000001,zInhomoPack]/InhomoPack[0.000001,AH*10^(-6)]
)



End[];(* end Private *)
EndPackage[];(*"Optimization`MPSData"*)
