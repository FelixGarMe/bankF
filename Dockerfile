# Usa la imagen oficial de Flutter como base
FROM cirrusci/flutter:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios al contenedor
COPY . .

# Cambia al usuario no privilegiado (no root)
USER nonroot

# Ejecuta el comando flutter pub get
RUN flutter pub get

# Construye la aplicación Flutter para producción
RUN flutter build apk --release

# Comando por defecto al iniciar el contenedor
CMD ["flutter", "run", "--release"]
