import sqlite3
import os
import sys

def extract_mbtiles_corrected(mbtiles_path, output_dir):
    """Extrae tiles de un archivo .mbtiles con estructura correcta"""
    
    print(f"🔧 Extrayendo tiles de: {mbtiles_path}")
    print(f"📁 Guardando en: {output_dir}")
    
    try:
        # Conectar a la base de datos
        conn = sqlite3.connect(mbtiles_path)
        cursor = conn.cursor()
        
        # Consulta CORREGIDA - unir tablas map e images
        cursor.execute("""
            SELECT m.zoom_level, m.tile_column, m.tile_row, i.tile_data 
            FROM map m 
            JOIN images i ON m.tile_id = i.tile_id
        """)
        tiles = cursor.fetchall()
        
        total_tiles = len(tiles)
        print(f"📊 Encontrados {total_tiles} tiles para extraer...")
        
        # Contador para progreso
        extracted = 0
        
        for zoom, x, y, tile_data in tiles:
            # Calcular y inverso (MBTiles usa TMS, Leaflet usa XYZ)
            y = (2 ** zoom - 1) - y
            
            # Crear estructura de directorios
            tile_dir = os.path.join(output_dir, str(zoom), str(x))
            os.makedirs(tile_dir, exist_ok=True)
            
            # Ruta del archivo
            tile_path = os.path.join(tile_dir, f"{y}.png")
            
            # Guardar tile
            try:
                with open(tile_path, 'wb') as f:
                    f.write(tile_data)
                extracted += 1
            except Exception as e:
                print(f"⚠️  Error guardando tile {zoom}/{x}/{y}: {e}")
                continue
            
            # Mostrar progreso cada 50 tiles
            if extracted % 100 == 0:
                print(f"🔄 Progreso: {extracted}/{total_tiles} tiles extraídos")
        
        conn.close()
        print(f"✅ ¡Extracción completada! {extracted}/{total_tiles} tiles guardados en: {output_dir}")
        
        # Mostrar estadísticas
        print(f"\n📈 Estadísticas:")
        print(f"   - Tiles extraídos: {extracted}")
        print(f"   - Tiles totales: {total_tiles}")
        print(f"   - Éxito: {(extracted/total_tiles)*100:.1f}%")
        
        return True
        
    except sqlite3.Error as e:
        print(f"❌ Error de base de datos: {e}")
        return False
    except Exception as e:
        print(f"❌ Error inesperado: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    mbtiles_file = "mapa_san_carlos.mbtiles"
    output_folder = "tiles"
    
    if not os.path.exists(mbtiles_file):
        print(f"❌ No se encuentra el archivo: {mbtiles_file}")
        return
    
    print("=" * 50)
    print("🚀 EXTRACTOR DE TILES MBTILES - VERSIÓN CORREGIDA")
    print("=" * 50)
    
    # Extraer tiles
    success = extract_mbtiles_corrected(mbtiles_file, output_folder)
    
    if success:
        print("\n🎉 ¡PROCESO COMPLETADO EXITOSAMENTE!")
        print("=" * 50)
        
        # Verificar estructura generada
        print(f"\n📂 Estructura generada en '{output_folder}':")
        if os.path.exists(output_folder):
            zoom_levels = []
            total_png_files = 0
            
            for root, dirs, files in os.walk(output_folder):
                if files:
                    zoom = root.split(os.sep)[-2] if len(root.split(os.sep)) > 1 else "root"
                    png_count = len([f for f in files if f.endswith('.png')])
                    if png_count > 0 and zoom not in zoom_levels and zoom.isdigit():
                        zoom_levels.append(zoom)
                    total_png_files += png_count
            
            zoom_levels.sort()
            print(f"   - Niveles de zoom: {', '.join(zoom_levels)}")
            print(f"   - Archivos PNG totales: {total_png_files}")
            
        print("\n📝 SIGUIENTES PASOS:")
        print("1. 📂 Copia la carpeta 'tiles/' a tu proyecto HTML")
        print("2. 🗺️  Usa este código en tu HTML:")
        print("""
        L.tileLayer('tiles/{z}/{x}/{y}.png', {
            minZoom: 5,
            maxZoom: 12
        }).addTo(map);
        """)
        print("3. 🌐 Abre index.html en tu navegador y ¡disfruta tu mapa!")
        
    else:
        print("\n❌ EXTRACCIÓN FALLIDA")

if __name__ == "__main__":
    main()