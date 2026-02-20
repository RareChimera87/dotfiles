void mainImage(out vec4 O, vec2 I){
    vec3 p, // Ray position
         r = normalize(vec3(I+I,0) - iResolution.xyy), // Ray direction
         a = normalize(tan(2.3*.2+vec3(0,1,2))); // Rotation axis
    float i, // Iterator
          t, // Distance
          v, // Density
          l, // Length^2
          n; // Noise iterator
    // Raymarching loop
    for (O*=i; i++<90.;t+=v*.03){
    p=t*r;
    // Move camera back
    p.z+=6.;
    // Rotate around rotation axis
    p = a*dot(a,p)*2.-p;
    // Store length^2
    l = dot(p,p);
    // Apply log transform
    p = log(abs(p)+.01);
    // Voxel effect
    p=ceil(p*50.)/50.;
    // Turbulence
    for (n=.5; n++<6.; p+=2.*sin(p.zxy*n+2.3*n)/n);
    // Extra rotation before final turbulence step
    p.yz*=mat2(cos(iTime+vec4(0,11,33,0)));
    p+=2.*sin(p.zxy*7.5+2.3*7.5)/7.5;
    // Density based on distance to sphere
    v = abs(length(p)-.5)+.05;
    // Color accumulation based on iteration and density, blue orb in the center
    O+=exp(sin(i*.2+vec4(0,2,4,0)))/v + 3.*exp(sin(iTime+vec4(0,1,2,0)))/l;
    }
    // Tone mapping
    O = tanh(O/2e2);
}
