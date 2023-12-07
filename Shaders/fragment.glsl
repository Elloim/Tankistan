#version 460

in vec3 Color;
in vec3 Normal;
in vec3 FragPos;

out vec4 outColor;

uniform vec3 lightColor;
uniform vec3 lightPos;
uniform vec3 cameraPos;
uniform vec3 ambiant;

float specularStrength = 1.;

void main() {
	vec3 lightDir = normalize(lightPos - FragPos);
	vec3 viewDir = normalize(cameraPos - FragPos);
	vec3 halfDir = normalize(lightDir + viewDir);
	vec3 reflectDir = reflect(-lightDir, Normal);
	float spec = 0.5 * pow(max(dot(Normal, halfDir), 0.0), 64) + 0.0 * pow(max(dot(reflectDir, viewDir), 0.0), 16);
	float diff = max(dot(Normal, lightDir), 0.0);

	if (diff == 0.) {
		spec = 0.;
	}

	vec3 diffuse = 0.8 * diff * lightColor;
	vec3 specular = spec * specularStrength * lightColor;
	vec3 result = (ambiant + specular + diffuse) * Color;

	outColor = vec4(result, 1.0);
};

