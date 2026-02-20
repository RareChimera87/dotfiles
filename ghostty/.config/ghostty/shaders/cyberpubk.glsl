void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    
    // 1. Obtener el color original
    vec4 texColor = texture(iChannel0, uv);
    
    // 2. Efecto de resplandor (Bloom) sutil
    vec4 bloom = vec4(0.0);
    float samples = 0.0;
    for(float x = -2.0; x <= 2.0; x++) {
        for(float y = -2.0; y <= 2.0; y++) {
            bloom += texture(iChannel0, uv + vec2(x, y) / iResolution.xy);
            samples++;
        }
    }
    bloom /= samples;
    
    // 3. Color de tinte Cyberpunk (Azul/Violeta)
    vec3 tint = vec3(0.1, 0.0, 0.2) * (1.0 - uv.y);
    
    // Mezclamos todo: original + un poco de brillo + tinte de fondo
    fragColor = texColor + (bloom * 0.4) + vec4(tint * (1.0 - texColor.a), 0.0);
}
