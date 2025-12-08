# Mapa en Mosaico de San Carlos, Alajuela

**Proyecto 3 - Sistemas de Información Geográfica**  
**Tecnológico de Costa Rica**  
**II Semestre 2025**

---

## 👥 Integrantes del Grupo

- **Dylan Cachón**
- **Victoria Sandí**

---

## 📍 Cantón Asignado

**San Carlos**, Alajuela, Costa Rica

**Coordenadas del área de estudio:**
- Norte: 10.78°
- Sur: 10.24°
- Este: -84.00°
- Oeste: -84.96°

**Bounding Box:** `[10.24, -84.96, 10.78, -84.00]`

---

## 🎯 Objetivo del Proyecto

Crear un mapa interactivo en mosaico (tile map) del cantón de San Carlos utilizando TileMill y publicarlo en la web mediante GitHub Pages. El mapa incluye capas base de información geográfica de Costa Rica, datos de elevación procesados, y datos de servicios y comercios obtenidos de OpenStreetMap.

---

## 🌐 Mapa Publicado

**URL del mapa:** [PENDIENTE - Se actualizará después de la publicación]

---

## 📊 Datos Utilizados

### Capas Base (Instituto Geográfico Nacional)

| Capa | Archivo | Elementos | Descripción |
|------|---------|-----------|-------------|
| Cantones | `geo_cantones.shp` | 81 cantones | Límites cantonales de Costa Rica |
| Distritos | `geo_distritos.shp` | - | Límites distritales |
| Carreteras | `geo_carreter.shp` | 5,040 segmentos | Red vial nacional |
| Ríos | `geo_rios.shp` | 857 ríos | Red hidrográfica |
| Poblados | `geo_poblados.shp` | 4,884 poblados | Centros poblados |
| Poblados principales | `geo_poblprinc.shp` | 378 poblados | Cabeceras distritales |
| Hitos de elevación | `geo_hitos.shp` | 7,504 puntos | Puntos con elevación para interpolación |

**Fuente:** Instituto Geográfico Nacional de Costa Rica (IGN)  
**Proyección:** WGS 84 (EPSG:4326)

---

### Capas Recortadas para San Carlos

Todas las capas nacionales fueron recortadas al área del cantón de San Carlos:

- `canton_san_carlos.shp` - Límite del cantón
- `distritos_san_carlos.shp` - 13 distritos
- `carreteras_san_carlos.shp` - 251 segmentos de carreteras
- `rios_san_carlos.shp` - 68 ríos principales
- `poblados_san_carlos.shp` - 271 poblados
- `poblprinc_san_carlos.shp` - 10 cabeceras distritales

**Herramienta utilizada:** QGIS 3.44 - Geoprocesamiento → Recortar (Clip)

---

### Capas de Elevación (Generadas)

#### DEM (Modelo Digital de Elevación)

**Archivo:** `dem_san_carlos.tif`

**Metodología:**
1. Capa de entrada: `geo_hitos.shp` (7,504 puntos con campo ELEVACION)
2. Herramienta: QGIS → Processing Toolbox → TIN Interpolation
3. Formato de salida: GeoTIFF

**Resultado:** Superficie continua de elevación del terreno

---

#### Hillshade (Relieve Sombreado)

**Archivo:** `hillshade_san_carlos.tif`

**Metodología:**
1. Capa de entrada: `dem_san_carlos.tif`
2. Herramienta: QGIS → Processing Toolbox → Hillshade
3. Formato de salida: GeoTIFF

**Resultado:** Representación visual del relieve con sombras

---

### Capas de OpenStreetMap

**Método de descarga:** Overpass Turbo API (https://overpass-turbo.eu/)

#### Polígonos

| Capa | Archivo | Query OSM | Descripción |
|------|---------|-----------|-------------|
| Parques | `parques_san_carlos.shp` | `leisure=park` | Parques públicos |
| Plazas | `plazas_san_carlos.shp` | `place=square` | Plazas y espacios públicos |
| Zonas verdes | `zonas_verdes_san_carlos.shp` | `landuse=grass/forest` | Áreas verdes y bosques |

#### Puntos de Servicios

| Capa | Archivo | Query OSM | Descripción |
|------|---------|-----------|-------------|
| Escuelas | `escuelas_san_carlos.shp` | `amenity=school` | Centros educativos |
| Hospitales | `hospitales_san_carlos.shp` | `amenity=hospital` | Hospitales |
| Clínicas | `clinicas_san_carlos.shp` | `amenity=clinic` | Clínicas y EBAIS |
| Gasolineras | `gasolineras_san_carlos.shp` | `amenity=fuel` | Estaciones de servicio |
| Hoteles | `hoteles_san_carlos.shp` | `tourism=hotel` | Hoteles y hospedajes |
| Bancos | `bancos_san_carlos.shp` | `amenity=bank` | Agencias bancarias |
| Comercios | `comercios_san_carlos.shp` | `shop=*` | Establecimientos comerciales |

**Proceso de descarga:**
1. Acceso a Overpass Turbo: https://overpass-turbo.eu/
2. Configuración del bounding box de San Carlos
3. Ejecución de consultas específicas por tipo de elemento
4. Exportación en formato GeoJSON
5. Conversión a Shapefile en QGIS

**Ejemplo de consulta utilizada (Parques):**
```overpass
[bbox:10.24,-84.96,10.78,-84.00][timeout:90];
(
  way["leisure"="park"];
  relation["leisure"="park"];
);
out geom;
```

---

## 🛠️ Metodología

### Fase 1: Preparación de Datos en QGIS

#### 1.1 Generación del DEM
- Interpolación TIN desde puntos de elevación
- Resolución: 30 metros
- Tiempo de procesamiento: ~15 minutos

#### 1.2 Generación del Hillshade
- Cálculo de sombras desde el DEM
- Parámetros estándar de cartografía
- Tiempo de procesamiento: ~2 minutos

#### 1.3 Recorte de Capas Nacionales
- Uso de `canton_san_carlos.shp` como máscara
- Herramienta: Clip (Recortar)
- Todas las capas procesadas a WGS84

#### 1.4 Descarga de Datos OSM
- Método: Overpass Turbo API
- Formato inicial: GeoJSON
- Conversión: GeoJSON → Shapefile (QGIS)
- Total de capas descargadas: 10

---

### Fase 2: Configuración en TileMill

#### 2.1 Creación del Proyecto
```bash
Proyecto: mapa_san_carlos
Descripción: Mapa en mosaico del cantón de San Carlos
```

#### 2.2 Orden de Capas (de abajo hacia arriba)
1. **hillshade_san_carlos** (raster) - Relieve sombreado
2. **dem_san_carlos** (raster) - Elevación con colores
3. **canton_san_carlos** (polígono) - Límite cantonal
4. **distritos_san_carlos** (polígono) - Divisiones administrativas
5. **zonas_verdes_san_carlos** (polígono) - Áreas verdes
6. **parques_san_carlos** (polígono) - Parques
7. **plazas_san_carlos** (polígono) - Plazas
8. **rios_san_carlos** (línea) - Red hidrográfica
9. **carreteras_san_carlos** (línea) - Red vial
10. **poblados_san_carlos** (punto) - Poblados menores
11. **poblprinc_san_carlos** (punto) - Cabeceras
12. **escuelas_san_carlos** (punto) - Educación
13. **hospitales_san_carlos** (punto) - Salud (hospitales)
14. **clinicas_san_carlos** (punto) - Salud (clínicas)
15. **gasolineras_san_carlos** (punto) - Combustible
16. **hoteles_san_carlos** (punto) - Hospedaje
17. **bancos_san_carlos** (punto) - Servicios financieros
18. **comercios_san_carlos** (punto) - Comercio

---

#### 2.3 Simbología

##### Capas Raster
- **Hillshade:** Opacidad 30-40%, escalado lanczos
- **DEM:** Rampa de color (verde→amarillo→marrón→blanco), opacidad 70%

##### Polígonos
- **Cantón:** Borde negro 3px, sin relleno
- **Distritos:** Borde gris 2px, sin relleno (visible zoom ≥10)
- **Parques:** Relleno verde claro (#8fbf8f), borde verde oscuro
- **Zonas verdes:** Relleno verde (#b8f5b8), sin borde

##### Líneas
- **Ríos:** Azul (#4a9fd6), grosor 1.5-2.5px según zoom
- **Carreteras Nacionales:** Amarillo/naranja (#fdb863), grosor 3-5px
- **Carreteras Cantonales:** Naranja (#fd8d3c), grosor 2-3px, línea punteada
- **Caminos Vecinales:** Gris (#999), grosor 1-2px

##### Puntos
**Poblados:**
- Principales: Círculo rojo (#b30000), 12-16px
- Normales: Círculo rojo claro (#e31a1c), 8-10px

**Servicios (con íconos):**
- Hospitales: Rojo (#d7191c), 24-28px
- Escuelas: Azul (#4575b4), 20-24px
- Clínicas: Azul claro (#91bfdb), 18-20px
- Bancos: Verde (#238b45), 18-20px
- Gasolineras: Amarillo (#fee090), 18-20px
- Hoteles: Azul claro (#91bfdb), 18-20px
- Comercios: Púrpura (#c994c7), 16-18px

**Íconos:** Formato PNG 32x32px de Maki Icons (Mapbox)

---

#### 2.4 Etiquetas

**Configuración general:**
- Fuente: DejaVu Sans
- Halo blanco (2px) para contraste
- Tamaño variable según zoom

**Por tipo:**
- Cantón: 16pt, negrita (zoom <10)
- Distritos: 11-14pt, regular (zoom ≥10)
- Ríos: 9-11pt, itálica, azul oscuro
- Carreteras: 9-11pt, negrita, código de ruta
- Poblados principales: 11-13pt, negrita
- Poblados: 9-10pt, regular (zoom ≥12)
- Servicios: Nombre del lugar, 8-10pt (zoom ≥14)

---

#### 2.5 Niveles de Zoom

| Zoom | Capas Visibles |
|------|----------------|
| 0-9 | Hillshade, DEM, cantón (con etiqueta) |
| 10-11 | + Distritos, ríos, carreteras principales |
| 12-13 | + Poblados, calles, servicios principales |
| 14-16 | + Todos los servicios, comercios, detalles completos |

---

### Fase 3: Exportación de Tiles

#### Configuración de Exportación
- **Formato:** MBTiles
- **Nombre:** `san_carlos.mbtiles`
- **Zoom levels:** 8 (mínimo) a 16 (máximo)
- **Centro:** [-84.43, 10.47]
- **Bounds:** Ajustado a San Carlos
- **Metatile:** 2

#### Conversión a Estructura Web
```bash
# Usando mbtiles_to_tiles.py
python mbtiles_to_tiles.py san_carlos.mbtiles tiles/

# Estructura resultante:
tiles/
  └── {z}/
      └── {x}/
          └── {y}.png
```

---

### Fase 4: Desarrollo Web

#### Estructura del Sitio
```
mapa_san_carlos_web/
├── index.html          # Página principal
├── tiles/              # Carpeta con tiles generados
│   ├── 8/
│   ├── 9/
│   └── ...
└── README.md
```

#### Tecnologías
- **Leaflet.js 1.9.4** - Librería de mapas interactivos
- **HTML5 + CSS3** - Estructura y diseño
- **JavaScript** - Interactividad

#### Características del Mapa Web
- Centro inicial: San Carlos
- Zoom inicial: 10
- Zoom mínimo: 8
- Zoom máximo: 16
- Controles: Zoom, escala
- Panel de información con leyenda
- Diseño responsivo (móvil/tablet/escritorio)

---

### Fase 5: Publicación

#### GitHub Pages
```bash
# Inicializar repositorio
git init
git add .
git commit -m "Proyecto 3 - Mapa San Carlos"

# Subir a GitHub
git remote add origin https://github.com/[usuario]/mapa-san-carlos.git
git push -u origin main

# Activar GitHub Pages
# Settings → Pages → Source: main branch
```

**URL resultante:** `https://[usuario].github.io/mapa-san-carlos/`

---

## 📈 Estadísticas del Proyecto

### Capas Procesadas
- **Total de capas:** 25
- **Capas base:** 7
- **Capas generadas:** 2 (DEM, hillshade)
- **Capas de OSM:** 10
- **Capas recortadas:** 6

### Elementos Cartográficos
- **Puntos de elevación:** 7,504
- **Ríos:** 68
- **Carreteras:** 251 segmentos
- **Poblados principales:** 10
- **Poblados:** 271
- **Distritos:** 13
- **Servicios (estimado):** 200+
- **Comercios (estimado):** 300+

### Especificaciones Técnicas
- **Proyección:** WGS 84 (EPSG:4326)
- **Resolución DEM:** 30 metros
- **Formato tiles:** PNG 256x256px
- **Niveles de zoom:** 8-16
- **Tamaño estimado tiles:** 500MB - 2GB

---

## 🛠️ Herramientas Utilizadas

### Software GIS
- **QGIS 3.44** (Solothurn) - Procesamiento de datos espaciales
  - TIN Interpolation - Generación del DEM
  - Hillshade - Relieve sombreado
  - Clip - Recorte de capas
  - Export - Conversión de formatos

### Descarga de Datos
- **Overpass Turbo** - Consultas a OpenStreetMap
- **Overpass API** - Extracción de datos OSM

### Generación de Tiles
- **TileMill 0.10.1** - Diseño cartográfico y generación de tiles

### Desarrollo Web
- **Leaflet.js 1.9.4** - Librería de mapas
- **Visual Studio Code** - Editor de código
- **Git** - Control de versiones
- **GitHub Pages** - Hosting web

### Recursos de Diseño
- **Maki Icons** (Mapbox) - Íconos para puntos de interés

---

## 🎨 Paleta de Colores

### Elementos Naturales
- **Agua (ríos):** #4a9fd6 (azul medio)
- **Parques:** #8fbf8f (verde claro)
- **Zonas verdes:** #b8f5b8 (verde muy claro)
- **Elevación baja:** #d7f4d7 (verde pálido)
- **Elevación media:** #ffffb2 (amarillo)
- **Elevación alta:** #bd7526 (marrón)
- **Elevación muy alta:** #ffffff (blanco)

### Infraestructura
- **Carreteras nacionales:** #fdb863 (amarillo/naranja)
- **Carreteras cantonales:** #fd8d3c (naranja)
- **Caminos vecinales:** #999999 (gris)
- **Límites administrativos:** #000000 (negro)

### Servicios (Íconos)
- **Hospitales:** #d7191c (rojo intenso)
- **Escuelas:** #4575b4 (azul)
- **Bancos:** #238b45 (verde)
- **Hoteles:** #91bfdb (azul claro)
- **Gasolineras:** #fee090 (amarillo claro)
- **Comercios:** #c994c7 (púrpura)

---

## 📚 Referencias

### Datos Geográficos
- Instituto Geográfico Nacional de Costa Rica (IGN)
- OpenStreetMap Contributors
- SRTM Digital Elevation Data

### Documentación Técnica
- TileMill Documentation: https://tilemill-project.github.io/tilemill/
- Leaflet Documentation: https://leafletjs.com/
- Overpass API Documentation: https://wiki.openstreetmap.org/wiki/Overpass_API
- CartoCSS Documentation: https://cartocss.readthedocs.io/

### Recursos de Diseño
- Maki Icons: https://labs.mapbox.com/maki-icons/
- ColorBrewer: https://colorbrewer2.org/

---

## 📄 Archivos Entregables

### Documentación
- ✅ README.md (este archivo)
- ✅ Lista de capas con metadatos

### Código
- ✅ tilemill_style.mss (estilos CartoCSS)
- ✅ index.html (página web del mapa)

### Datos (No incluidos por tamaño)
- Shapefiles procesados
- DEM y hillshade generados
- Tiles exportados
- Proyecto de TileMill

---

## 🚀 Instrucciones de Uso

### Para Visualizar el Mapa
1. Visitar: [URL del mapa publicado]
2. Usar controles de zoom (+/-)


---

## 📧 Contacto

**Dylan Cachón** - dychacon@estudiantec.cr 
**Victoria Sandí** - vsandi@estudiantec.cr

**Curso:** Sistemas de Información Geográfica  
**Institución:** Tecnológico de Costa Rica  
**Fecha:** 8 de Diciembre 2025

---

## 📜 Licencia

Este proyecto fue desarrollado con fines académicos para el curso de Sistemas de Información Geográfica del Tecnológico de Costa Rica.

**Datos:**
- Capas base IGN: Uso académico permitido
- Datos OpenStreetMap: © OpenStreetMap contributors, ODbL
- Datos brindados por el profesor mediante TecDigital
- Íconos Maki: © Mapbox, licencia BSD

---

**Última actualización:** Diciembre 2025
