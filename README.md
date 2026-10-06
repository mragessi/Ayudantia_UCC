# Ayudantía UCC

Espacio de trabajo colaborativo para elaborar casos de CFD con **OpenFOAM**: desde el mallado con **Gmsh**, pasando por **snappyHexMesh**, hasta armar el directorio completo de un caso de simulación.

Todos los estudiantes trabajan sobre el mismo caso; lo que varía es el diseño de la malla en Gmsh (cómo escribe cada uno su archivo `.geo`).

## Estructura del repositorio

```
Ayudantia_UCC/
├── README.md
├── casoBase/                  # Caso común a todos (p. ej. mallaBase3D.geo)
└── estudiantes/
    ├── AbigailSALAZAR/
    │   └── NOTAS.md
    ├── IgnacioTRUJILLO/
    │   └── NOTAS.md
    └── LucilaFUNES/
        └── NOTAS.md
```

- `casoBase/`: material de partida. No se modifica; se copia a la carpeta de cada estudiante para trabajar.
- `estudiantes/<NombreAPELLIDO>/`: espacio personal de cada estudiante.

## Flujo de trabajo

### 1) Instalar GitHub Desktop

Descargar e instalar [GitHub Desktop](https://desktop.github.com/) e iniciar sesión con tu cuenta de GitHub.

### 2) Clonar el repositorio

En GitHub Desktop: `File > Clone repository…` → pestaña **URL** → pegar `https://github.com/mragessi/Ayudantia_UCC.git` → elegir la carpeta local y presionar **Clone**.

### 3) Acceder a tu carpeta de estudiante

Todos trabajamos sobre la rama `main`. Abrí la carpeta del repositorio clonado y ubicate en tu espacio personal, `estudiantes/<TuNombreAPELLIDO>/`. Trabajá solo ahí: no modifiques `casoBase/` ni las carpetas de otros compañeros. Copiá a tu carpeta lo que necesites de `casoBase/`.

### 4) Subir cambios

1. Antes de empezar a trabajar: **Fetch origin** / **Pull origin** para traer lo último.
2. GitHub Desktop lista los archivos modificados; escribí un mensaje corto y claro en **Summary** (por ejemplo: "Malla v2 con refinamiento en la entrada").
3. Presioná **Commit** y luego **Push origin**.

### 5) Documentar los cambios en `NOTAS.md`

Cada estudiante tiene su archivo `estudiantes/<NombreAPELLIDO>/NOTAS.md`. Después de cada sesión de trabajo, agregá una entrada con fecha, qué cambiaste y por qué, y el resultado (qué funcionó, qué errores aparecieron).
