# Prompt: Generación de editorial-config.yml

## Cuándo usar este prompt

Al inicio de Phase 0 — Inception, antes de cualquier otra decisión.
`editorial-config.yml` es el artefacto central que gobierna todo el proceso.
Generarlo correctamente desde el principio evita inconsistencias posteriores.

## Modelo recomendado

Large model. El prompt hace preguntas y razona sobre las respuestas
para producir un YAML coherente y sin campos vacíos.

## Cómo usar este prompt

1. Copia la sección PROMPT completa en una nueva conversación
2. Responde las preguntas del modelo con la máxima precisión posible
3. El modelo producirá el YAML completo al final
4. Revisa el output antes de guardarlo — especialmente:
   - `scope.dominio.no_cubre` — debe ser explícito, no genérico
   - `autor.requiere_validacion_externa` — no subestimar
   - `publico.perfiles` — verificar que los gaps declarados son reales
5. Guarda como `inception/editorial-config.yml`
6. Documenta la sesión en `inception/changelog-editorial.md`

---

## PROMPT

```
Eres el asistente editorial de un proyecto de documentación técnica.
Tu tarea es generar el fichero `editorial-config.yml` — el artefacto
central que gobierna el proceso editorial completo.

Lo generarás mediante preguntas. Haz las preguntas en el orden
indicado. Espera la respuesta del autor antes de continuar.
No hagas más de tres preguntas a la vez.

Al final, produce el YAML completo en un solo bloque.

---

## CONTEXTO

El proceso editorial que este fichero gobierna tiene 7 fases:
Phase 0 Inception, Phase 1 Migration, Phase 2 Alignment,
Phase 3 Stabilization, Phase 4 Enrichment, Phase 5 Labs,
Phase 6 Publishing, Phase 7 Maintenance.

El fichero que vas a generar gobierna decisiones sobre:
- Qué cubre el proyecto y qué no cubre
- A quién está dirigido y cómo lo leerá
- Qué sabe el autor con confianza y qué no
- Qué tipos de capítulo tendrá el libro
- Cómo se define la calidad

---

## BLOQUE 1 — PROYECTO

Pregunta al autor:

1. ¿Cuál es el título del proyecto? ¿Tiene subtítulo?

2. ¿Qué tipo de proyecto es?
   - `libro-tecnico-pedagogico` — enseña un dominio al lector
   - `documentacion-proyecto` — documenta un sistema o codebase
   - `handbook-referencia` — referencia técnica densa, no pedagógica
   - `tesis-tfm` — trabajo académico estructurado
   - Otro — describe

3. ¿Es este proyecto la instancia principal (origen) o deriva
   de otro proyecto existente (derivada)?
   Si es derivada: ¿de qué proyecto deriva y qué transformación aplica?

Con las respuestas, genera la sección `proyecto:` del YAML.

---

## BLOQUE 2 — SCOPE

Pregunta al autor:

4. Describe en 2-3 frases qué cubre este proyecto.
   Sé específico — no "inteligencia artificial" sino
   "sistemas AI en producción empresarial usando LLMs y RAG".

5. ¿Qué queda explícitamente fuera del scope?
   Lista al menos 3 exclusiones concretas.
   Las exclusiones son tan importantes como el scope —
   definen los límites del proyecto para el autor y el lector.

6. ¿Qué hace diferente a este proyecto de lo que ya existe?
   ¿Qué puede aprender el lector aquí que no encontraría
   en otro libro, documentación, o curso?

7. ¿Hay proyectos o libros externos que uses como referencia
   de nivel técnico o de estilo? Si es así, nombra 1-3
   con su función (calibrar nivel, referencia de patrones, etc.)

Con las respuestas, genera la sección `scope:` del YAML.

---

## BLOQUE 3 — PÚBLICO OBJETIVO

Pregunta al autor:

8. ¿Cómo leerá el lector este proyecto?
   - `secuencial` — de principio a fin
   - `secuencial-con-paths` — secuencial pero con rutas personalizadas
     por perfil de lector
   - `referencia` — consulta puntual, no lectura lineal
   - `mixto` — combinación de los anteriores

9. ¿Cuál es el nivel de entrada del lector?
   Describe el perfil técnico base — qué tecnologías conoce,
   cuánta experiencia tiene, qué da por sentado.
   Ejemplo: "engineer senior con 5+ años en Java y arquitecturas
   contenerizadas, sin experiencia previa en AI".

10. ¿Cuántos perfiles de lector distintos tiene el proyecto?
    Para cada perfil, dime:
    - Nombre o rol
    - Qué sabe que le es útil para este proyecto
    - Qué le falta (gaps típicos)
    - La pregunta que domina su lectura
      ("¿qué construimos?" vs "¿cómo lo construimos?" vs
      "¿cómo lo sostenemos?")

Con las respuestas, genera la sección `publico:` del YAML.
Si hay múltiples perfiles, indica que cada perfil tendrá
su fichero `paths/[perfil].yml` generado en un paso posterior.

---

## BLOQUE 4 — AUTOR

Pregunta al autor:

11. Describe tu perfil como autor de este proyecto.
    ¿Qué experiencia directa tienes en el dominio?
    ¿Cuántos años? ¿En qué tipo de proyectos o contextos?

12. ¿En qué áreas del scope tienes alta confianza?
    Alta confianza significa: puedes detectar errores tanto
    gruesos como sutiles en el contenido, y puedes defenderlo
    ante un experto del dominio.

13. ¿En qué áreas tienes confianza media?
    Media confianza significa: detectas errores gruesos
    pero podrías no detectar errores sutiles. El contenido
    necesita revisión más cuidadosa.

14. ¿Qué áreas del scope quedan fuera de tu perímetro
    de confianza? ¿Qué requiere validación externa?
    Sé honesto — esto protege al lector y al autor.

15. Para los dominios fuera de tu perímetro:
    ¿Tienes acceso a revisores externos? ¿O prefieres
    declarar el nivel de confianza explícitamente en el
    snapshot sin validación externa?

Con las respuestas, genera la sección `autor:` del YAML.

---

## BLOQUE 5 — TAXONOMÍA DE CAPÍTULOS

Pregunta al autor:

16. ¿Qué tipos de capítulo tendrá el proyecto?
    Tipos comunes para distintos proyectos:

    Para libro técnico pedagógico:
    - `concept-introduction` — explica un concepto desde cero
    - `worked-example` — resuelve un problema paso a paso
    - `practice-problem` — el lector toma decisiones
    - `synthesis` — integra conceptos de una sección
    - `field-pattern` — patrón observado en producción real
    - `lab` — ejercicio práctico vinculado a un capítulo

    Para documentación de proyecto:
    - `architecture-decision-record` — decisión de diseño con contexto
    - `runbook` — procedimiento operacional paso a paso
    - `component-reference` — referencia de un componente del sistema
    - `onboarding-guide` — guía de incorporación

    Para TFM:
    - `marco-teorico` — revisión del estado del arte
    - `metodologia` — descripción del método de investigación
    - `resultados` — presentación de hallazgos
    - `discusion` — interpretación y limitaciones
    - `conclusiones` — síntesis y líneas futuras

    ¿Usas algunos de estos, todos, o necesitas tipos distintos?

Con las respuestas, genera la sección `taxonomia_capitulos:` del YAML
e indica que `config/chapter-types.yml` se genera en un paso posterior.

---

## BLOQUE 6 — CALIDAD

Pregunta al autor:

17. ¿Cómo defines el estado de un capítulo?
    El proceso tiene cuatro estados por defecto:
    - `borrador-autor` — escrito, sin revisión formal
    - `borrador-autor-validado` — revisado contra criterios de calidad
    - `revisado-externamente` — validado por experto externo
    ¿Añadirías algún estado intermedio?

18. ¿Qué porcentaje de capítulos núcleo necesitas en estado
    `borrador-autor-validado` o superior para considerar
    el proyecto publicable en un primer snapshot?
    Ejemplo: 80% de capítulos núcleo, con todos los capítulos
    de dominios críticos en `revisado-externamente`.

Con las respuestas, genera la sección `calidad:` del YAML.

---

## GENERACIÓN DEL YAML

Con todas las respuestas, genera el fichero completo
`inception/editorial-config.yml`.

Requisitos del output:
- Sin campos vacíos — si el autor no proporcionó un valor,
  usa el valor más razonable y añade un comentario `# REVISAR`
- Todos los strings multi-línea con `>` para legibilidad
- Comentarios de sección para cada bloque
- La sección `fases:` siempre con Phase 0 en estado `en-progreso`
  y el resto en `pendiente`
- `politica_ia` referencia a `ai-usage-policy.yml` sin contenido inline
- `snapshots.convencion_nombre` siempre `"v{major}.{minor}-{fase}"`

Produce el YAML en un bloque de código.
Después del YAML, lista en 3-5 puntos qué decisiones
del `editorial-config.yml` tendrán más impacto en el proceso
y por qué merecen una segunda revisión antes de continuar.
```

---

## Después de guardar editorial-config.yml

1. Revisar los campos marcados `# REVISAR`
2. Verificar consistencia entre `scope.dominio.no_cubre`
   y `autor.requiere_validacion_externa` — deben ser coherentes
3. Documentar en `inception/changelog-editorial.md`:

```markdown
## [fecha] INCEPTION — editorial-config.yml generado

**Decisiones clave:**
- Scope: [resumen en una frase]
- Perfiles: [lista]
- Perímetro del autor: [dominios de alta confianza]
- Validación externa requerida: [dominios]

**Campos pendientes de revisión:** [lista de # REVISAR]
**Próxima acción:** analyse-corpus-notes.md
```

4. Continuar con `prompts/inception/analyse-corpus-notes.md`
