Map {
  background-color: #b8dee6;
}

#dem_san_carlos {
  raster-opacity: 1;
  raster-scaling: lanczos;
}

#hillshade_san_carlos {
  raster-opacity: 0.3;
  raster-scaling: lanczos;
}

/* ===== CANTÓN Y DISTRITOS ===== */
#canton_san_carlos {
  [zoom <= 10] {
    line-color: #000;
    line-width: 3;
    line-opacity: 0.8;
    polygon-opacity: 0;
    
    ::label {
      text-name: "'San Carlos'";
      text-face-name: "DejaVu Sans Bold";
      text-size: 16;
      text-fill: #000;
      text-halo-fill: rgba(255, 255, 255, 0.9);
      text-halo-radius: 5;
      text-placement: interior;
      text-min-distance: 100;
      text-opacity: 1;
      /* DESACTIVAR TODA la prevención de choques */
      text-allow-overlap: true;
      text-avoid-edges: false;
      text-min-distance: 0;
    }
  }
  
  [zoom > 10] {
    line-color: #000;
    line-width: 2;
    line-opacity: 0.6;
    polygon-opacity: 0;
  }
}

#distritos_san_carlos {
  [zoom <= 10] {
    line-color: #666;
    line-width: 2;
    line-opacity: 0.3;
    polygon-opacity: 0;
  }
  
  [zoom = 10] {
    line-color: #000;
    line-width: 1.5;
    line-dasharray: 4, 2;
    line-opacity: 0.6;
    polygon-opacity: 0;
    
    ::label {
      text-name: "[NDISTRITO]";
      text-face-name: "DejaVu Sans Book";
      text-size: 10;
      text-fill: #444;
      text-halo-fill: #fff;
      text-halo-radius: 1;
      text-placement: interior;
      text-min-distance: 50;
      [zoom >= 12] { text-size: 11; }
      [zoom >= 14] { text-size: 12; }
      /* DESACTIVAR TODA la prevención de choques */
      text-allow-overlap: true;
      text-avoid-edges: false;
      text-min-distance: 0;
    }
  }
  
  [zoom > 10] {
    line-color: #000;
    line-width: 1.5;
    line-dasharray: 4, 2;
    line-opacity: 0.6;
    polygon-opacity: 0;
  }
}

/* ===== RÍOS ===== */
#rios_san_carlos {
  [zoom >= 11] { 
    line-color: #2980b9;
    line-width: 1;
    line-opacity: 0.7;
    
    ::label {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Oblique";
      text-size: 9;
      text-fill: #1a5276;
      text-placement: line;
      text-spacing: 400;
      text-max-char-angle-delta: 25;
      [zoom >= 13] { text-size: 10; }
      [zoom >= 15] { text-size: 11; }
    }
  }
}

/* ===== CARRETERAS ===== */
#carreteras_san_carlos {
  [zoom >= 11] {
    line-color: #7f8c8d;
    line-width: 1.5;
    line-opacity: 0.8;
    
    [TIPO = "CARRETERA NACIONAL"] {
      line-color: #e67e22;
      line-width: 2;
      [zoom >= 13] { line-width: 4; }
      [zoom >= 15] { line-width: 4.5; }
    }
    [TIPO = "CARRETERA CANTONAL"] {
      line-color: #f39c12;
      line-width: 1.5;
      line-dasharray: 6, 3;
      [zoom >= 14] { line-width: 2.5; }
    }
    
    
    ::label {
      text-name: "[CODIGO]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 9;
      text-fill: #e67e22;
      text-halo-fill: #fff;
      text-halo-radius: 2;
      text-placement: line;
      text-spacing: 500;
      [zoom >= 13] { text-size: 10; }
      [zoom >= 15] { text-size: 11; }
    }
  }
}

/* ===== POBLADOS ===== */
#poblprinc_san_carlos {
  [zoom > 10] {
    marker-fill: #8e44ad; /* Morado para cabeceras */
    marker-line-color: #fff;
    marker-line-width: 1.5;
    marker-opacity: 0.9;
    marker-width: 9;
    marker-allow-overlap: false;
    
    [zoom >= 12] { marker-width: 11; }
    [zoom >= 14] { marker-width: 13; }
    
    ::label {
      text-name: "[NOMDISTR]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 11;
      text-fill: #8e44ad;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 2;
      text-dy: -12;
      [zoom >= 12] { text-size: 12; }
      [zoom >= 14] { text-size: 13; }
      /* DESACTIVAR TODA la prevención de choques */
      text-allow-overlap: true;
      text-avoid-edges: false;
      text-min-distance: 0;
    }
  }
}

#poblados_san_carlos {
  [zoom >= 13] {
    marker-fill: #27ae60; /* Verde para poblados */
    marker-line-color: #fff;
    marker-line-width: 0.8;
    marker-opacity: 0.8;
    marker-width: 6;
    marker-allow-overlap: false;
    
    [CATEGORIA = "Urbano"] {
      marker-fill: #16a085; /* Verde azulado */
      marker-width: 7;
    }
    [CATEGORIA = "Rural"] {
      marker-fill: #27ae60;
      marker-width: 5;
    }
    
    [zoom >= 15] { marker-width: 8; }
    
    ::label {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Book";
      text-size: 9;
      text-fill: #2c3e50;
      text-halo-fill: rgba(255, 255, 255, 0.7);
      text-halo-radius: 1;
      text-dy: -10;
      [zoom >= 15] { text-size: 10; }
    }
  }
}