# Prompt: Generación de Índice v0

## Cuándo usar este prompt

Usar al final de Phase 0 — Inception, como Decision 7,
una vez que las decisiones 1-6 están completas y documentadas:
- Scope definido
- Perfiles de audiencia definidos
- Perímetro de conocimiento del autor declarado
- Taxonomía de capítulos definida

No usar antes. El índice v0 depende de todas las decisiones anteriores.
Un índice generado sobre un scope provisional produce trabajo desperdiciado.

## Modelo recomendado

Large model. Sin optimización de contexto.
El razonamiento sobre progresión pedagógica requiere
capacidad de mantener coherencia global a través de todo el scope.

## Cómo usar este prompt

1. Ejecuta primero `analyse-corpus-notes.md` y obtén `corpus/notes/analysis.yml`
2. Copia la sección PROMPT completa
3. Rellena todas las secciones marcadas con [RELLENAR]
4. Incluye el contenido de `analysis.yml` en la sección CORPUS
5. Ejecuta el prompt completo en una sola llamada
6. Revisa las SEÑALES DE REVISIÓN antes de guardar el output
7. Guarda el output como `index/history/index-v0.md`
8. Documenta la decisión en `inception/changelog-editorial.md`

---

## PROMPT

```
Eres el asistente editorial de un libro técnico.
Tu tarea es generar el índice v0 — la hipótesis inicial del territorio
del libro — a partir de la configuración del proyecto.

El índice v0 es una hipótesis, no un compromiso. Debe:
- Cubrir el scope completo declarado, incluso donde no hay notas todavía
- Reflejar una progresión pedagógica coherente para los perfiles declarados
- Ser suficientemente específico para que Phase 2 pueda mapear notas contra él
- Identificar y declarar explícitamente sus propias señales de revisión

---

## CONFIGURACIÓN DEL PROYECTO

### Scope

**Objetivo del libro:**
[RELLENAR — pedagógico / referencia técnica / híbrido]

**Dominio — qué cubre:**
[RELLENAR — lista de dominios y conceptos incluidos]

**Dominio — qué NO cubre:**
[RELLENAR — límites explícitos del scope]

**Propuesta de valor diferencial:**
[RELLENAR — qué tiene este libro que no tienen los recursos existentes]

### Perfiles de audiencia

[RELLENAR — para cada perfil:]

Perfil: [nombre]
- Conocimiento previo: [lista]
- Pregunta dominante: [una frase]
- Gaps típicos: [lista]
- Transferencias peligrosas: [analogías del dominio previo que pueden llevar a decisiones erróneas]

[repetir por cada perfil]

### Taxonomía de capítulos disponibles

[RELLENAR — lista de tipos disponibles con descripción de una línea cada uno]

Ejemplo:
- concept-introduction: establece marco conceptual, parte de lo conocido
- worked-example: proceso de razonamiento visible, no solo resultados
- field-pattern: conocimiento tácito operacional, solo del autor
- synthesis: consolida sección, prepara para la siguiente
- lab: escenario empresarial con restricciones reales

### Perímetro de conocimiento del autor

**Alta confianza** (puede detectar errores sutiles):
[RELLENAR]

**Confianza media** (puede detectar errores gruesos):
[RELLENAR]

**Requiere validación externa:**
[RELLENAR]

---

## CORPUS DE NOTAS DISPONIBLE

[RELLENAR — incluir el contenido de corpus/notes/analysis.yml
generado por analyse-corpus-notes.md]

Si no hay notas todavía, todos los capítulos serán marcados [P].
En ese caso dejar esta sección vacía.

---

## PARÁMETROS DE GENERACIÓN

Granularidad: secciones-y-capítulos
Cobertura: scope-completo
Idioma de salida: [RELLENAR — español / inglés]
Número estimado de capítulos: [RELLENAR — o dejar en blanco para que el modelo decida]

---

## INSTRUCCIONES DE RAZONAMIENTO

Antes de generar el índice, razona internamente los siguientes puntos.
No los incluyas en el output final — son pasos de preparación.

**Paso 1 — Mapa de progresión pedagógica:**
Identifica qué conceptos del scope son prerrequisito de qué otros.
Qué tiene que saber el lector antes de poder entender cada área.
Produce un orden parcial de los conceptos principales.

**Paso 2 — Agrupación en secciones:**
Agrupa los conceptos en secciones que tengan coherencia interna
y progresión natural entre ellas. Una sección es un territorio,
no un contenedor administrativo.
Cada sección debe tener una razón de ser que puedas expresar en una frase.

**Paso 3 — Granularidad de capítulos:**
Para cada sección, decide qué conceptos merecen capítulo propio
y qué conceptos son subcapítulos o forman parte de un capítulo mayor.
Criterio: un capítulo tiene un objetivo de aprendizaje claro y
completo que no se puede partir sin perder coherencia.

**Paso 4 — Asignación de tipos:**
Para cada capítulo, asigna el tipo más apropiado de la taxonomía.
Un concept-introduction establece marco. Un field-pattern documenta
conocimiento tácito. No uses field-pattern si el contenido
puede verificarse en literatura — solo para conocimiento operacional
que el autor tiene y no está documentado en ningún sitio.

**Paso 5 — Asignación de perfiles:**
Para cada capítulo, identifica qué perfiles lo necesitan.
[ALL] para capítulos de núcleo compartido.
Perfiles específicos para capítulos especializados.
Sé honesto — si un capítulo es realmente solo para un perfil, márcalo así.

**Paso 6 — Estado del corpus:**
Para cada capítulo, revisa si alguna de las notas del corpus
cubre ese contenido. Si hay cobertura, marca [N]. Si no, marca [P].
Si hay cobertura parcial, marca [N] con nota.

**Paso 7 — Señales de revisión:**
Identifica antes de generar:
- Capítulos que podrían fusionarse (conceptos demasiado próximos)
- Capítulos que podrían dividirse (demasiado amplio para un capítulo)
- Secciones que podrían reordenarse (la progresión no es obvia)
- Capítulos sin posible origen en el corpus ni en el perímetro del autor
- Conceptos del scope que no tienen capítulo asignado

---

## FORMATO DE SALIDA

Produce el índice en el siguiente formato exacto.
No añadas explicaciones fuera del formato.

### Frontmatter YAML

```yaml
---
version: v0
instancia: [objetivo del libro — pedagógico / referencia / etc.]
estado: hipotesis-inicial
generado_en: phase-0-inception
fecha: [fecha de hoy]
logica: scope-completo-con-progresion-pedagogica
nota: >
  Este índice es una hipótesis inicial del territorio del libro.
  No es un compromiso sobre el contenido final.
  Será revisado en Phase 2 — Alignment contra el corpus de notas real.
  Los capítulos marcados como [P] son placeholders sin notas todavía.
  Los capítulos marcados como [N] tienen notas en el corpus actual.
capitulos_total: [número]
secciones_total: [número]
perfiles:
  [lista de ids de perfiles]
---
```

### Introducción

Una sección breve (3-5 líneas) explicando cómo usar el índice
y que los paths por perfil están en `inception/config/paths/`.

Leyenda de símbolos: [N], [P], y un símbolo por perfil.

### Secciones y capítulos

Para cada sección:

```markdown
## Section N — Título
### Descripción en 2-3 frases: qué territorio cubre esta sección,
### por qué existe como sección separada, qué progresión sigue internamente.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| NN | Título descriptivo del capítulo | tipo | [perfiles] | [N] o [P] |
```

### Mapa de progresión pedagógica

Un diagrama ASCII mostrando el orden de lectura recomendado
entre secciones, con bifurcaciones donde los perfiles divergen.

### Tabla de estado del corpus

```markdown
| Sección | Capítulos | Con notas [N] | Placeholders [P] |
|---------|-----------|---------------|-----------------|
```

Con fila de totales al final.

### Señales de revisión conocidas en v0

Lista de señales identificadas durante la generación.
Para cada señal:
- Tipo: posible-solapamiento / posible-division / gap-de-cobertura /
        capitulo-sin-origen / reordenacion-posible
- Capítulos afectados
- Descripción del problema
- Decisión recomendada (el autor decide en Phase 2)

---

## RESTRICCIONES

- No inventes conocimiento que no esté en el scope declarado
- No generes capítulos de Field Pattern sobre dominios fuera
  del perímetro de alta confianza del autor sin marcarlo explícitamente
- Si el scope cubre un dominio en el perímetro de validación externa,
  marca los capítulos correspondientes con nota visible
- No produzcas más de 80 capítulos en la primera versión —
  la granularidad excesiva se corrige en Phase 3, no en v0
- Cada capítulo debe tener una descripción de exactamente una frase
  que complete: "Después de este capítulo, el lector puede..."
- No uses el mismo tipo para más del 60% de los capítulos de una sección
```

---

## Verificación antes de guardar el output

Antes de guardar como `index/history/index-v0.md`, comprueba:

- [ ] El frontmatter está completo y los totales son correctos
- [ ] Cada capítulo tiene tipo asignado de la taxonomía declarada
- [ ] Cada capítulo tiene al menos un perfil asignado
- [ ] La tabla de estado del corpus coincide con el conteo real
- [ ] Las señales de revisión están documentadas
- [ ] No hay capítulos de Field Pattern sobre dominios fuera del perímetro sin nota
- [ ] El total de capítulos no supera 80

## Después de guardar

Documenta la decisión en `inception/changelog-editorial.md`:

```markdown
## [fecha] INCEPTION — Índice v0 generado

**Capítulos:** [número]
**Secciones:** [número]
**Cobertura del corpus:** [N con notas] / [total]
**Señales de revisión identificadas:** [número]
**Decisión:** Índice v0 aceptado como hipótesis inicial para Phase 2
**Próxima revisión:** Phase 2 — Alignment
```
