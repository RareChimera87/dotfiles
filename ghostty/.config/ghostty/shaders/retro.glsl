void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Obtenemos el color original de la terminal
    vec2 uv = fragCoord / iResolution.xy;
    vec4 color = texture(iChannel0, uv);

    // Creamos las líneas de escaneo (scanlines)
    float scanline = sin(fragCoord.y * 2.0) * 0.1;
    color.rgb -= scanline;

    // Un ligero toque de brillo siguiendo al cursor (usando iCurrentCursor)
    float dist = distance(fragCoord, iCurrentCursor.xy + vec2(iCurrentCursor.z / 2.0, -iCurrentCursor.w / 2.0));
    if (dist < 100.0) {
        color.rgb += (1.0 - dist / 100.0) * 0.05;
    }

    fragColor = color;
}
