# Inception Prompts

Prompts para la generación de los artefactos de Phase 0 — Inception
que requieren razonamiento sobre el scope y el dominio del libro.

## Prompts disponibles

### fill-editorial-config.md
Genera `inception/editorial-config.yml` mediante conversación.
El modelo hace preguntas por bloques y produce el YAML completo al final.

**Cuándo:** Decision 1-6 de Phase 0 — el primer prompt a ejecutar.
El `editorial-config.yml` es el input de todos los demás prompts.

**Input:** Respuestas del autor a las preguntas del prompt
**Output:** `inception/editorial-config.yml`
**Modelo:** Large — razona sobre las respuestas para producir YAML coherente

---

### analyse-corpus-notes.md
Analiza el contenido del corpus de notas existente antes de generar
el índice v0. Identifica mezcla de dominios, recomienda fragmentaciones,
y detecta gaps entre el corpus y el scope declarado.

**Cuándo:** Decision 7, paso 1 — antes de generate-index-v0.md.
También en Phase 3 y Phase 7 para notas nuevas (incremental).

**Input:** Contenido completo de las notas + scope del proyecto
**Output:** `corpus/notes/analysis.yml`
**Modelo:** Large — requiere leer contenido completo de cada nota

---

### generate-index-v0.md
Genera el índice v0 — la hipótesis inicial del territorio del libro.

**Cuándo:** Decision 7, paso 2 — después de analyse-corpus-notes.md.

**Input:** editorial-config.yml + `corpus/notes/analysis.yml`
**Output:** `index/history/index-v0.md`
**Modelo:** Large — sin optimización de contexto

---

### generate-domain-refs.md
Genera el corpus de referencias del dominio organizado por sección.

**Cuándo:** Decision 7, paso 3 — después de generate-index-v0.md.

**Input:** Secciones del índice v0 + scope del proyecto
**Output:** `references/domain-refs.yml`
**Modelo:** Large — requiere conocimiento amplio del dominio

---

## Orden de ejecución en Inception

```
fill-editorial-config.md → inception/editorial-config.yml
        ↓
analyse-corpus-notes.md  → corpus/notes/analysis.yml
        ↓
[autor revisa y resuelve fragmentaciones]
        ↓
generate-index-v0.md     → index/history/index-v0.md
        ↓
generate-domain-refs.md  → references/domain-refs.yml
        ↓
Inception completa
```

## Ejecuciones incrementales de analyse-corpus-notes.md

El análisis del corpus no es de ejecución única. Se re-ejecuta:
- Phase 3 — Stabilization: cuando se añaden notas de elicitación
- Phase 7 — Maintenance: cuando se añaden notas nuevas

En ejecuciones incrementales, pasar solo las notas nuevas
y el `analysis.yml` existente. El prompt actualiza las entradas
nuevas sin modificar las existentes.

## Advertencia sobre verificación de referencias

generate-domain-refs.md puede cometer errores en URLs,
años de publicación, y nombres de autores.
Todos los outputs tienen `verificado: pendiente`.
La verificación humana es obligatoria antes de Phase 4.
