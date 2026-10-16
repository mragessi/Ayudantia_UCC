// Gmsh project created on Sat Jul 13 18:51:11 2024
SetFactory("OpenCASCADE");
//+


// --- Origen ---//

x0 = 0.18;
y0 = 0.18;
z0 = 0;

// ------------ Geometría de la Tolva ------------ //

deltaH = 0.5;
Point(1) = {1.975+x0, 1.975+y0, 0+z0, 1.0};
Point(2) = {1.975+x0+deltaH, 1.975+y0, 0+z0, 1.0};
Point(3) = {1.975+x0+deltaH, 1.975+y0+deltaH, 0+z0, 1.0};
Point(4) = {1.975+x0, 1.975+y0+deltaH, 0+z0, 1.0};

deltaV = 3; //5.43;
deltaH = 1.975+0.5+1.975;
Point(5) = {x0, y0, z0+deltaV, 1.0};
Point(6) = {x0+deltaH, y0, z0+deltaV, 1.0};
Point(7) = {x0+deltaH, y0+deltaH, z0+deltaV, 1.0};
Point(8) = {x0, y0+deltaH, z0+deltaV, 1.0};

//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 7};
//+
Line(7) = {7, 8};
//+
Line(8) = {8, 5};
//+
Line(9) = {1, 5};
//+
Line(10) = {2, 6};
//+
Line(11) = {3, 7};
//+
Line(12) = {4, 8};

//+
Curve Loop(1) = {1, 2, 3, 4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {8, 5, 6, 7};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {9, 5, -10, -1};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {2, 11, -6, -10};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {3, 12, -7, -11};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {12, 8, -9, -4};
//+
Plane Surface(6) = {6};
//+
Surface Loop(1) = {2, 6, 5, 1, 3, 4};
//+
Volume(1) = {1};



// ------------ Resolución de la malla Tolva------------ //
tamanoDeCelda = 0.1;


planoInferior[] = {1, 2, 3, 4};
planoSuperior[] = {5, 6, 7, 8};
lineasVerticales[] = {9, 10, 11, 12};
//+

Longitud = 4.45;
resolucion1 = Longitud/tamanoDeCelda+1;
Transfinite Curve {planoInferior[]} = resolucion1 Using Progression 1;
Transfinite Curve {planoSuperior[]} = resolucion1 Using Progression 1;


Longitud = 3;
resolucion2 = Longitud/tamanoDeCelda+1;
Transfinite Curve {lineasVerticales[]} = resolucion2 Using Progression 1.02;


tolva[] = {1,2,3,4,5,6};
Transfinite Surface {tolva[]};
Recombine Surface {tolva[]};

Transfinite Volume{1};

// ------------ Geometría del Sedimentador ------------ //
deltaV = 3+1.6;
deltaH = 1.975+0.5+1.975;
Point(9) = {x0, y0, z0+deltaV, 1.0};
Point(10) = {x0+deltaH, y0, z0+deltaV, 1.0};
Point(11) = {x0+deltaH, y0+deltaH, z0+deltaV, 1.0};
Point(12) = {x0, y0+deltaH, z0+deltaV, 1.0};

deltaV = 3+1.6+1.05;
deltaH = 1.975+0.5+1.975;
deltaH2 = 0.7485;
Point(13) = {x0, y0, z0+deltaV, 1.0};
Point(14) = {x0+deltaH+deltaH2, y0, z0+deltaV, 1.0};
Point(15) = {x0+deltaH+deltaH2, y0+deltaH, z0+deltaV, 1.0};
Point(16) = {x0, y0+deltaH, z0+deltaV, 1.0};

deltaV = 3+1.6+1.05+1;
deltaH = 1.975+0.5+1.975;
deltaH2 = 0.7485;
Point(17) = {x0, y0, z0+deltaV, 1.0};
Point(18) = {x0+deltaH+deltaH2, y0, z0+deltaV, 1.0};
Point(19) = {x0+deltaH+deltaH2, y0+deltaH, z0+deltaV, 1.0};
Point(20) = {x0, y0+deltaH, z0+deltaV, 1.0};

deltaV = 3+1.6+1.05+1+0.3;
deltaH = 1.975+0.5+1.975;
deltaH2 = 0.7485;
Point(21) = {x0, y0, z0+deltaV, 1.0};
Point(22) = {x0+deltaH+deltaH2, y0, z0+deltaV, 1.0};
Point(23) = {x0+deltaH+deltaH2, y0+deltaH, z0+deltaV, 1.0};
Point(24) = {x0, y0+deltaH, z0+deltaV, 1.0};

//+
Line(13) = {9, 10};
//+
Line(14) = {10, 11};
//+
Line(15) = {11, 12};
//+
Line(16) = {12, 9};
//+
Line(17) = {13, 14};
//+
Line(18) = {14, 15};
//+
Line(19) = {15, 16};
//+
Line(20) = {16, 13};
//+
Line(21) = {17, 18};
//+
Line(22) = {18, 19};
//+
Line(23) = {19, 20};
//+
Line(24) = {20, 17};
//+
Line(25) = {21, 22};
//+
Line(26) = {22, 23};
//+
Line(27) = {23, 24};
//+
Line(28) = {24, 21};

planosSedimentor[] = {13:28};
Transfinite Curve {planosSedimentor[]} = resolucion1 Using Progression 1;


// Lineas verticales
//+
Line(29) = {5, 9}; Line(30) = {6, 10}; Line(31) = {7, 11}; Line(32) = {8, 12};
nivel1[] = {29:32};
h1 = 1.6;
R1 = h1/tamanoDeCelda+1;
Transfinite Curve {nivel1[]} = R1 Using Progression 1;

Line(33) = {9, 13}; Line(34) = {10, 14}; Line(35) = {11, 15}; Line(36) = {12, 16};
nivel2[] = {33:36};
h2 = 1.05;
R2 = h2/tamanoDeCelda+1;
Transfinite Curve {nivel2[]} = R2 Using Progression 1;

Line(37) = {13, 17}; Line(38) = {14, 18}; Line(39) = {15, 19}; Line(40) = {16, 20};
nivel3[] = {37:40};
h3 = 1.0;
R3 = h3/tamanoDeCelda+1;
Transfinite Curve {nivel3[]} = R3 Using Progression 1;

Line(41) = {17, 21}; Line(42) = {18, 22}; Line(43) = {19, 23}; Line(44) = {20, 24};
nivel4[] = {41:44};
h4 = 0.3;
R4 = h4/tamanoDeCelda+1;
Transfinite Curve {nivel4[]} = R4 Using Progression 1;

//+
Curve Loop(7) = {13, 14, 15, 16};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {17, 18, 19, 20};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {21, 22, 23, 24};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {25, 26, 27, 28};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {29, 13, -30, -5};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {6, 31, -14, -30};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {7, 32, -15, -31};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {32, 16, -29, -8};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {13, 34, -17, -33};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {14, 35, -18, -34};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {15, 36, -19, -35};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {16, 33, -20, -36};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {17, 38, -21, -37};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {18, 39, -22, -38};
//+
Plane Surface(20) = {20};
//+
Curve Loop(21) = {19, 40, -23, -39};
//+
Plane Surface(21) = {21};
//+
Curve Loop(22) = {40, 24, -37, -20};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {21, 42, -25, -41};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {22, 43, -26, -42};
//+
Plane Surface(24) = {24};
//+
Curve Loop(25) = {23, 44, -27, -43};
//+
Plane Surface(25) = {25};
//+
Curve Loop(26) = {44, 28, -41, -24};
//+
Plane Surface(26) = {26};


surfaceSedimentador[] = {7:26};
Transfinite Surface {surfaceSedimentador[]};
Recombine Surface {surfaceSedimentador[]};


Surface Loop(2) = {2, 11, 14, 13, 12, 7};
//+
Volume(2) = {2};
//+
Surface Loop(3) = {7, 15, 16, 17, 18, 8};
//+
Volume(3) = {3};
//+
Surface Loop(4) = {8, 19, 20, 21, 22, 9};
//+
Volume(4) = {4};
//+
Surface Loop(5) = {9, 23, 24, 25, 26, 10};
//+
Volume(5) = {5};

volumenSedimentador[] = {2,3,4,5};
Transfinite Volume{volumenSedimentador[]};

// Caja en y de -0.001 a 5 para incluir las extrusiones de +-L (el cuerpo ocupa y de 0.18 a 4.63)
aguasArriba[] = Surface In BoundingBox {0.179, -0.001, 0, 0.181, 5, 7};

Printf("aguasArriba: %g superficies seleccionadas", #aguasArriba[]);
For i In {0:#aguasArriba[]-1}
  Printf("  Surface %g", aguasArriba[i]);
EndFor

L = 0.18;
celdas = L/tamanoDeCelda+1;
Extrude {-L, 0, 0} { Surface{aguasArriba[]}; Layers {celdas}; Recombine; }

surperficies[] = {12, 16, 20, 24};
Extrude {L, 0, 0} { Surface{surperficies[]}; Layers {celdas}; Recombine; }

derecha[] = Surface In BoundingBox {-0.001, 0.179, 0, 6, 0.181, 7};
Printf("derecha: %g superficies seleccionadas", #derecha[]);
For i In {0:#derecha[]-1}
  Printf("  Surface %g", derecha[i]);
EndFor
Extrude {0, -L, 0} { Surface{derecha[]}; Layers {celdas}; Recombine; }

izquierda[] = Surface In BoundingBox {-0.001, 4.629, 0, 6, 4.631, 7};
Printf("izquierda: %g superficies seleccionadas", #izquierda[]);
For i In {0:#izquierda[]-1}
  Printf("  Surface %g", izquierda[i]);
EndFor
Extrude {0, L, 0} { Surface{izquierda[]}; Layers {celdas}; Recombine; }



// ---- Volúmenes y contornos ---- 

Physical Volume("internalMesh") = {Volume{:}};

topSurface[] = Surface In BoundingBox {-1, -1, 6.949, 7, 7, 6.96};
Physical Surface("top") = {topSurface[]};