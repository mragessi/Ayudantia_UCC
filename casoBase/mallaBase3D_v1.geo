SetFactory("OpenCASCADE");

tamanoDeCelda = 0.1;		// tamano de celda objetivo
Lx = 4.45 + 0.7485;	// ancho en x del sedimentador (secciones 4 a 6)



// ---- Secciones (Curve Loop k) ----
Macro Seccion
  p = 10*k;
  Point(p+1) = {xa, ya, z};
  Point(p+2) = {xb, ya, z};
  Point(p+3) = {xb, yb, z};
  Point(p+4) = {xa, yb, z};
  Line(p+1) = {p+1, p+2};
  Line(p+2) = {p+2, p+3};
  Line(p+3) = {p+3, p+4};
  Line(p+4) = {p+4, p+1};
  Curve Loop(k) = {p+1, p+2, p+3, p+4};
Return

zs[] = {0, 3, 4.60, 5.65, 6.65, 6.95}; //5.43, 7.03, 8.08, 9.08, 9.58

k=1; xa=1.975; xb=2.475; ya=1.975; yb=2.475; z=zs[0]; Call Seccion;  // fondo tolva (superficie 1)
k=2; xa=0; xb=4.45; ya=0; yb=4.45; z=zs[1]; Call Seccion;          // tope tolva
k=3; xa=0; xb=4.45; ya=0; yb=4.45; z=zs[2]; Call Seccion;          // superficie 7
k=4; xa=0; xb=Lx;  ya=0; yb=4.45; z=zs[3]; Call Seccion;          // superficie 8
k=5; xa=0; xb=Lx;  ya=0; yb=4.45; z=zs[4]; Call Seccion;          // superficie 9
k=6; xa=0; xb=Lx;  ya=0; yb=4.45; z=zs[5]; Call Seccion;          // superficie 10


// ---- Un loft reglado por tramo ----
Ruled ThruSections(1) = {1, 2};
Ruled ThruSections(2) = {2, 3};
Ruled ThruSections(3) = {3, 4};
Ruled ThruSections(4) = {4, 5};
Ruled ThruSections(5) = {5, 6};

// ---- Pegar caras compartidas ----
Coherence;

// ---- Desplazo en X e Y para referencia todo al (0, 0, 0) ---- 
deltaX = 0.18;		
deltaY = 0.18;
Translate {0.18, 0.18, 0} { Volume{:}; }

// ---- Transfinite de curvas ----
e = 1e-4;
// 1) curvas "verticales" de cada tramo (la caja también atrapa las horizontales, se pisan luego)
For t In {0:4}
  c[] = Curve In BoundingBox {-1, -1, zs[t]-e, 7, 7, zs[t+1]+e};
  n = Round((zs[t+1]-zs[t])/tamanoDeCelda) + 1;
  Transfinite Curve {c[]} = n Using Progression 1;
EndFor
// 2) curvas horizontales de cada seccion
For t In {0:5}
  c[] = Curve In BoundingBox {-1, -1, zs[t]-e, 7, 7, zs[t]+e};
  Transfinite Curve {c[]} = 49 Using Progression 1;
EndFor

Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";

// ---- Agrego el espesor lateral sobre la tolva ---- 

	L = deltaX;
	celdas = L/tamanoDeCelda+1;

aguasArriba[] = Surface In BoundingBox {0.179, 0, 0, 0.181, 4.631, 6.981};

	Printf("aguasArriba: %g superficies seleccionadas", #aguasArriba[]);
	For i In {0:#aguasArriba[]-1}
	  Printf("  Surface %g", aguasArriba[i]);
	EndFor
	Extrude {-L, 0, 0} { Surface{aguasArriba[]}; Layers {celdas}; Recombine; }

aguasAbajo[] = {34,39,44,49};
	Extrude {L, 0, 0} { Surface{aguasAbajo[]}; Layers {celdas}; Recombine; }

	L = deltaY;
	celdas = L/tamanoDeCelda+1;

derecha[] = Surface In BoundingBox {-0.01, 0.179, 0, 5.73, 0.181, 6.981};
	Printf("derecha: %g superficies seleccionadas", #derecha[]);
	For i In {0:#derecha[]-1}
	  Printf("  Surface %g", derecha[i]);
	EndFor
	Extrude {0, -L, 0} { Surface{derecha[]}; Layers {celdas}; Recombine; }

izquierda[] = Surface In BoundingBox {-0.01, 4.629, 0, 5.73, 4.631, 6.981};
	Printf("izquierda: %g superficies seleccionadas", #izquierda[]);
	For i In {0:#izquierda[]-1}
	  Printf("  Surface %g", izquierda[i]);
	EndFor
	Extrude {0, L, 0} { Surface{izquierda[]}; Layers {celdas}; Recombine; }


// ---- Volúmenes y contornos ---- 

Physical Volume("internalMesh") = {Volume{:}};

topSurface[] = Surface In BoundingBox {-1, -1, zs[5]-e, 7, 7, zs[5]+e};
Physical Surface("top") = {topSurface[]};