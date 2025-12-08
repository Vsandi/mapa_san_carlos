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
  [zoom <= 9] {
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
      text-opacity: 1;
      text-allow-overlap: true;
      text-avoid-edges: false;
    }
  }
  
  [zoom > 9] {
    line-color: #000;
    line-width: 2;
    line-opacity: 0.6;
    polygon-opacity: 0;
  }
}

/* ===== DISTRITOS (VERSIÓN ANTERIOR) ===== */
#distritos_san_carlos {
  [zoom <= 9] {
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

/* ===== ÁREAS VERDES - BORDES VERDES MÁS VISIBLES ===== */
#zonas_verdes_san_carlos {
  [zoom >= 10] {
    polygon-fill: #2ecc71;
    polygon-opacity: 0.15;
    line-color: #27ae60;
    line-width: 1.2; /* Aumentado de 0.8 a 1.2 */
    line-opacity: 0.7; /* Aumentado de 0.4 a 0.7 */
    
    [landuse = "grass"] {
      polygon-fill: #a3e4d7;
      line-color: #58d68d; /* Verde más vibrante */
      line-width: 1;
    }
    [landuse = "forest"] {
      polygon-fill: #186a3b;
      line-color: #145a32;
      polygon-opacity: 0.2;
      line-width: 1.5; /* Borde más grueso para bosques */
    }
    [landuse = "recreation_ground"] {
      polygon-fill: #82e0aa;
      line-color: #27ae60;
      line-width: 1.2;
    }
    
    ::label[zoom >= 12] {
      text-name: "[name]";
      [name = ""] { text-name: "'Zona verde'"; }
      text-face-name: "DejaVu Sans Book";
      text-size: 10;
      text-fill: #145a32;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-placement: interior;
    }
  }
}

/* ===== PLAZAS - BORDES VERDES MÁS VISIBLES ===== */
#plazas_san_carlos {
  [zoom >= 11] {
    polygon-fill: #f9e79f;
    polygon-opacity: 0.2;
    line-color: #27ae60; /* Cambiado de amarillo a verde */
    line-width: 1.2; /* Aumentado de 1 a 1.2 */
    line-opacity: 0.8; /* Aumentado de 0.6 a 0.8 */
    
    ::label[zoom >= 13] {
      text-name: "'Plaza'";
      text-face-name: "DejaVu Sans Book";
      text-size: 10;
      text-fill: #b7950b;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-placement: interior;
    }
  }
}

/* ===== PARQUES - BORDES VERDES MÁS VISIBLES ===== */
#parques_san_carlos {
  [zoom >= 10] {
    polygon-fill: #58d68d;
    polygon-opacity: 0.2;
    line-color: #27ae60;
    line-width: 1.5; /* Aumentado de 1 a 1.5 */
    line-opacity: 0.8; /* Aumentado de 0.6 a 0.8 */
    
    ::label[zoom >= 12] {
      text-name: "[name]";
      [name = ""] { text-name: "'Parque'"; }
      text-face-name: "DejaVu Sans Bold";
      text-size: 10;
      text-fill: #1e8449;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-placement: interior;
      [zoom >= 14] { text-size: 11; }
    }
  }
}

/* ===== RÍOS ===== */
#rios_san_carlos {
  [zoom >= 10] {
    line-color: #2980b9;
    line-width: 1;
    line-opacity: 0.7;
    
    ::label[zoom >= 11] {
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
  [zoom >= 10] {
    line-color: #7f8c8d;
    line-width: 1.5;
    line-opacity: 0.8;
    
    [TIPO = "CARRETERA NACIONAL"] {
      line-color: #e67e22;
      line-width: 2;
      [zoom >= 12] { line-width: 3; }
      [zoom >= 14] { line-width: 4; }
    }
    [TIPO = "CARRETERA CANTONAL"] {
      line-color: #f39c12;
      line-width: 1.5;
      line-dasharray: 6, 3;
      [zoom >= 13] { line-width: 2; }
    }
    
    ::label[zoom >= 12] {
      text-name: "[CODIGO]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 9;
      text-fill: #e67e22;
      text-halo-fill: #fff;
      text-halo-radius: 2;
      text-placement: line;
      text-spacing: 500;
      [zoom >= 14] { text-size: 10; }
    }
  }
}

/* ===== POBLADOS ===== */
#poblprinc_san_carlos {
  [zoom >= 9] {
    marker-fill: #8e44ad;
    marker-line-color: #fff;
    marker-line-width: 1.5;
    marker-opacity: 0.9;
    marker-width: 8;
    marker-allow-overlap: false;
    
    [zoom >= 11] { marker-width: 10; }
    [zoom >= 13] { marker-width: 12; }
    
    ::label[zoom >= 10] {
      text-name: "[NOMDISTR]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 11;
      text-fill: #8e44ad;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 2;
      text-dy: -12;
      text-allow-overlap: true;
      [zoom >= 12] { text-size: 12; }
      [zoom >= 14] { text-size: 13; }
    }
  }
}

#poblados_san_carlos {
  [zoom >= 12] {
    marker-fill: #27ae60;
    marker-line-color: #fff;
    marker-line-width: 0.8;
    marker-opacity: 0.8;
    marker-width: 6;
    marker-allow-overlap: false;
    
    [CATEGORIA = "Urbano"] {
      marker-fill: #16a085;
      marker-width: 7;
    }
    [CATEGORIA = "Rural"] {
      marker-fill: #27ae60;
      marker-width: 5;
    }
    
    [zoom >= 14] { marker-width: 8; }
    
    ::label[zoom >= 13] {
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

/* ===== HOSPITALES ===== */
#hospitales_san_carlos {
  [zoom >= 12] {
    //marker-file: url(symbols/hospital.svg);
    marker-width: 14;
    marker-opacity: 1;
    marker-fill: #e74c3c;
    marker-line-color: #c0392b;
    
    [zoom >= 13] { marker-width: 16; }
    [zoom >= 14] { marker-width: 18; }
    
    ::label[zoom >= 13] {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Bold";
      text-size: 10;
      text-fill: #e74c3c;
      text-halo-fill: rgba(255, 255, 255, 0.9);
      text-halo-radius: 2;
      text-dy: 18;
      
      [zoom >= 15] { 
        text-size: 11;
        text-dy: 20;
      }
    }
  }
}

/* ===== ESCUELAS ===== */
#escuela_san_carlos {
  [zoom >= 13] {
    marker-width: 12;
    marker-opacity: 0.9;
    marker-allow-overlap: false;
    
    [DEPENDENCI = "PUB"] {
      marker-fill: #2980b9;
      marker-line-color: #1a5276;
    }
    [DEPENDENCI = "PRI"] {
      marker-fill: #8e44ad;
      marker-line-color: #6c3483;
    }
    [DEPENDENCI = "SUB"] {
      marker-fill: #27ae60;
      marker-line-color: #1e8449;
    }
    
    [zoom >= 14] { marker-width: 14; }
    
    ::label[zoom >= 14] {
      text-name: "'ESCUELA '+"[NOMBRE]"";
      text-face-name: "DejaVu Sans Book";
      text-size: 9;
      text-fill: #2c3e50;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-dy: 14;
      
      [DEPENDENCI = "PUB"] { text-fill: #2980b9; }
      [DEPENDENCI = "PRI"] { text-fill: #8e44ad; }
      [DEPENDENCI = "SUB"] { text-fill: #27ae60; }
    }
  }
}

/* ===== CLÍNICAS ===== */
#clinicas_san_carlos {
  [zoom >= 13] {
    marker-width: 12;
    marker-opacity: 0.9;
    
    [TIPO = "E.B.A.I.S"] {
      marker-fill: #3498db;
      marker-line-color: #2980b9;
    }
    [TIPO = "C.C.S.S"] {
      marker-fill: #2ecc71;
      marker-line-color: #27ae60;
    }
    
    [zoom >= 14] { marker-width: 14; }
    
    ::label[zoom >= 14] {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Book";
      text-size: 9;
      text-fill: #2c3e50;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-dy: 14;
      
      [TIPO = "E.B.A.I.S"] { text-fill: #2980b9; }
      [TIPO = "C.C.S.S"] { text-fill: #27ae60; }
    }
  }
}

/* ===== HOTELES ===== */
#hoteles_san_carlos {
  [zoom >= 13] {
    marker-width: 12;
    marker-opacity: 0.9;
    
    [CATEGORIA_ = "1"] {
      marker-fill: #f1c40f;
      marker-width: 10;
    }
    [CATEGORIA_ = "2"] {
      marker-fill: #f39c12;
      marker-width: 11;
    }
    [CATEGORIA_ = "3"] {
      marker-fill: #e67e22;
      marker-width: 12;
    }
    [CATEGORIA_ = "4"] {
      marker-fill: #d35400;
      marker-width: 13;
    }
    [CATEGORIA_ = "5"] {
      marker-fill: #c0392b;
      marker-width: 14;
      marker-line-width: 2;
    }
    
    [zoom >= 14] { 
      [CATEGORIA_ = "5"] { marker-width: 16; }
    }
    
    ::label[zoom >= 14] {
      text-name: "[NOMBRE]";
      text-face-name: "DejaVu Sans Book";
      text-size: 9;
      text-fill: #7d3c98;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-dy: 16;
    }
  }
}

/* ===== GASOLINERAS ===== */
#gasolineras_san_carlos {
  [zoom >= 13] {
    marker-width: 12;
    marker-opacity: 0.9;
    marker-fill: #2c3e50;
    marker-line-color: #1c2833;
    
    [zoom >= 14] { marker-width: 14; }
    
    ::label[zoom >= 14] {
      text-name: "[OTRO_NOMBR]";
      [OTRO_NOMBR = "NA"] {
        text-name: "[NOMBRE_REC]";
      }
      text-face-name: "DejaVu Sans Book";
      text-size: 9;
      text-fill: #2c3e50;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-dy: 15;
    }
  }
}

/* ===== AGENTES BANCARIOS ===== */
#agentes_bancarios_san_carlos {
  [zoom >= 13] {
    marker-width: 12;
    marker-opacity: 0.9;
    marker-allow-overlap: false;
    
    [BANCO = "BANCO CREDITO AGRICOLA DE CARTAGO"] {
      marker-fill: #27ae60;
      marker-line-color: #1e8449;
    }
    [BANCO = "BANCO NACIONAL DE COSTA RICA"] {
      marker-fill: #e74c3c;
      marker-line-color: #c0392b;
    }
    [BANCO = "BANCO DE COSTA RICA"] {
      marker-fill: #3498db;
      marker-line-color: #2980b9;
    }
    [BANCO = "BANCO POPULAR"] {
      marker-fill: #f1c40f;
      marker-line-color: #f39c12;
    }
    [BANCO = "MUTUAL ALAJUELA"] {
      marker-fill: #8e44ad;
      marker-line-color: #6c3483;
    }
    [BANCO = "BANCO INTERFIN"] {
      marker-fill: #d35400;
      marker-line-color: #a04000;
    }
    [BANCO = "BANCO BAC-SAN JOSE"] {
      marker-fill: #1abc9c;
      marker-line-color: #16a085;
    }
    
    [zoom >= 14] { marker-width: 13; }
    
    ::label[zoom >= 14] {
      text-name: "'Bancredito'";
      [BANCO = "BANCO NACIONAL DE COSTA RICA"] { text-name: "'BNCR'"; }
      [BANCO = "BANCO DE COSTA RICA"] { text-name: "'BCR'"; }
      [BANCO = "BANCO POPULAR"] { text-name: "'BP'"; }
      [BANCO = "MUTUAL ALAJUELA"] { text-name: "'MUTUAL'"; }
      [BANCO = "BANCO INTERFIN"] { text-name: "'INTERFIN'"; }
      [BANCO = "BANCO BAC-SAN JOSE"] { text-name: "'BAC'"; }
      
      text-face-name: "DejaVu Sans Bold";
      text-size: 8;
      text-fill: #2c3e50;
      text-halo-fill: rgba(255, 255, 255, 0.8);
      text-halo-radius: 1;
      text-dy: 14;
      
      [BANCO = "BANCO CREDITO AGRICOLA DE CARTAGO"] { text-fill: #27ae60; }
      [BANCO = "BANCO NACIONAL DE COSTA RICA"] { text-fill: #e74c3c; }
      [BANCO = "BANCO DE COSTA RICA"] { text-fill: #3498db; }
      [BANCO = "BANCO POPULAR"] { text-fill: #f39c12; }
      [BANCO = "MUTUAL ALAJUELA"] { text-fill: #8e44ad; }
      [BANCO = "BANCO INTERFIN"] { text-fill: #d35400; }
      [BANCO = "BANCO BAC-SAN JOSE"] { text-fill: #16a085; }
    }
  }
}

/* ===== COMERCIOS (Puntos) ===== */
#comercios_san_carlos {
  [zoom >= 14] {
    //marker-file: url(symbols/shop.svg);
    marker-width: 10;
    marker-opacity: 0.7;
    marker-fill: #e74c3c;
    marker-line-color: #c0392b;
    marker-line-width: 1;
    
    [zoom >= 15] { marker-width: 12; }
    
    ::label[zoom >= 15] {
      text-name: "[name]";
      [name = ""] { text-name: "'Comercio'"; }
      text-face-name: "DejaVu Sans Book";
      text-size: 8;
      text-fill: #7f8c8d;
      text-halo-fill: rgba(255, 255, 255, 0.7);
      text-halo-radius: 1;
      text-dy: 13;
    }
  }
}