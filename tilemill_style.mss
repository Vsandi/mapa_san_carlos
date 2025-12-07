Map {
  background-color: #b8dee6;
}

#countries {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
}

#dem_san_carlos {
  raster-opacity: 1;
  raster-scaling: lanczos;
}

#hillshade_san_carlos {
  raster-opacity: 0.3;
  raster-scaling: lanczos;
}

/* ===== CAPAS DE POLÍGONOS ===== */

/* 1. CANTÓN - BORDE PRINCIPAL */
#canton_san_carlos {
  /* ZOOM <= 10: Etiqueta del cantón visible, borde normal */
  [zoom < 10] {
    line-color: #000;
    line-width: 3;
    line-opacity: 0.8;
    polygon-opacity: 0;
    
    /* ETIQUETA ENCIMA DE TODO (en niveles bajos de zoom) */
    ::label {
      text-name: "'San Carlos'";
      text-face-name: "DejaVu Sans Bold";
      text-size: 16;
      text-fill: #000;
      text-halo-fill: #fff;
      text-halo-radius: 2;
      text-placement: interior;
      text-min-distance: 100;
      text-dy: 0;
    }
  }
}

/* 2. DISTRITOS - BORDES INTERNOS */
#distritos_san_carlos {
  /* ZOOM >= 10: Bordes + etiquetas */
  [zoom >= 10] {
    line-color: #000;
    line-width: 2.5;
    line-opacity: 0.8;
    polygon-opacity: 0;
    
    ::label {
      text-name: "[NDISTRITO]";
      text-face-name: "DejaVu Sans Book";
      text-size: 11;
      text-fill: #000;
      text-halo-fill: #fff;
      text-halo-radius: 1;
      text-placement: interior;
      text-min-distance: 50;
      [zoom >= 11] { text-size: 12; }
      [zoom >= 13] { text-size: 13; }
      [zoom >= 15] { text-size: 14; }
      /* DESACTIVAR TODA la prevención de choques */
      text-allow-overlap: true;
      text-avoid-edges: false;
      text-min-distance: 0;
    }
  }
}

/* ===== CAPAS DE LÍNEAS ===== */

/* 3. RÍOS */
#rios_san_carlos {
  /* Aparecen solo a partir de zoom >= 10 */
  [zoom >= 10] {
    line-color: #6baed6;
    line-width: 1;
    line-opacity: 0.8;
    
    ::label {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Oblique";
      text-size: 9;
      text-fill: #08519c;
      text-placement: line;
      text-spacing: 300;
      text-max-char-angle-delta: 30;
      [zoom >= 12] { text-size: 10; }
      [zoom >= 14] { text-size: 11; }
    }
  }
}

/* 4. CARRETERAS */
#carreteras_san_carlos {
  /* Aparecen solo a partir de zoom >= 10 */
  [zoom >= 10] {
    line-color: #999;
    line-width: 1;
    
    [TIPO = "CARRETERA NACIONAL"] {
      line-color: #fed976;
      line-width: 2;
      [zoom >= 12] { line-width: 4; }
    }
    [TIPO = "CARRETERA CANTONAL"] {
      line-color: #fd8d3c;
      line-width: 1.5;
      line-dasharray: 6, 2;
    }
    
    ::label {
      text-name: "[CODIGO]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 9;
      text-fill: #333;
      text-halo-fill: #fff;
      text-halo-radius: 2;
      text-placement: line;
      text-spacing: 400;
      [zoom >= 12] { text-size: 10; }
      [zoom >= 14] { text-size: 11; }
    }
  }
}

/* ===== CAPAS DE PUNTOS ===== */

/* 5. POBLADOS PRINCIPALES */
#poblprinc_san_carlos {
  /* Aparecen solo a partir de zoom >= 10 */
  [zoom >= 10] {
    marker-fill: #800026;
    marker-line-color: #fff;
    marker-line-width: 1;
    marker-opacity: 0.9;
    marker-width: 10;
    [zoom >= 12] { marker-width: 12; }
    [zoom >= 14] { marker-width: 14; }
    
    ::label {
      text-name: "[NOMDISTR]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 11;
      text-fill: #800026;
      text-halo-fill: #fff;
      text-halo-radius: 2;
      text-dy: -10;
      [zoom >= 12] { text-size: 12; }
      [zoom >= 14] { text-size: 13; }
    }
  }
}

/* 6. POBLADOS NORMALES */
#poblados_san_carlos {
  /* Aparecen solo a partir de zoom >= 12 */
  [zoom >= 12] {
    marker-fill: #e31a1c;
    marker-line-color: #fff;
    marker-line-width: 0.5;
    marker-opacity: 0.8;
    marker-width: 8;
    
    [zoom >= 14] { marker-width: 7; }
    
    ::label {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Book";
      text-size: 9;
      text-fill: #e31a1c;
      text-halo-fill: #fff;
      text-halo-radius: 1;
      text-dy: -8;
      [zoom >= 14] { text-size: 10; }
    }
  }
}